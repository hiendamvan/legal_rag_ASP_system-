"""
asp_pipeline.py — ASP-based legal reasoning pipeline.

Pipeline:
    1. Retrieve relevant chunks from ChromaDB  (reuses retrieve.py)
    2. Match chunks to ASP rules in dieu6.lp
    3. Build structured prompt → call local fine-tuned LLM (localhost:8000)
    4. Parse JSON facts from LLM output
    5. Convert facts → ASP .lp code
    6. Run clingo reasoning
    7. Return full structured result

Usage:
    python asp_pipeline.py --query "Người đi bộ qua đường không bảo đảm an toàn thì xử lý thế nào?"
    python asp_pipeline.py --query "..." --top_k 5 --verbose
"""

import warnings
warnings.filterwarnings("ignore", message="Accessing `__path__` from")

import argparse
import json
import logging
import re
import sys
import unicodedata
from pathlib import Path

from retrieve import retrieve
from legal_knowlegde.asp_rule_loader import load_rules, match_chunk_to_rules
from model.call_llm import call_llm

_KB_DIR       = Path(__file__).parent / "legal_knowlegde"
_KB_LP        = str(_KB_DIR / "dieu6.lp")
_REASONING_LP = str(_KB_DIR / "reasoning.lp")
_LOG_FILE     = Path(__file__).parent / "pipeline_debug.log"
_LEGACY_LIST_FACT_RE = re.compile(r'^(context|exception)\((\w+),\s*\[(.*?)\]\)\.$')
_INSUFFICIENT_INFO_MESSAGE = "Không đủ cơ sở pháp lí để trả lời"
_EXCEPTION_MESSAGE = "Không bị phạt vì trường hợp ngoại lệ.."

# ── Logger setup ────────────────────────────────────────────────────────────

def _get_logger() -> logging.Logger:
    logger = logging.getLogger("asp_pipeline")
    if logger.handlers:
        return logger  # already configured
    logger.setLevel(logging.DEBUG)
    fmt = logging.Formatter("%(asctime)s [%(levelname)s] %(message)s", "%H:%M:%S")
    # Console handler
    ch = logging.StreamHandler(sys.stdout)
    ch.setLevel(logging.DEBUG)
    ch.setFormatter(fmt)
    logger.addHandler(ch)
    # File handler
    fh = logging.FileHandler(_LOG_FILE, encoding="utf-8")
    fh.setLevel(logging.DEBUG)
    fh.setFormatter(fmt)
    logger.addHandler(fh)
    return logger


def _normalize_legacy_list_facts(content: str) -> str:
    """Expand legacy list-style context/exception facts into plain ASP atoms."""
    normalized_lines: list[str] = []

    for raw_line in content.splitlines():
        line = raw_line.strip()
        match = _LEGACY_LIST_FACT_RE.fullmatch(line)
        if not match:
            normalized_lines.append(raw_line)
            continue

        predicate, rule_id, raw_items = match.groups()
        items = [item.strip() for item in raw_items.split(",") if item.strip()]
        for item in items:
            normalized_lines.append(f"{predicate}({rule_id}, {item}).")

    return "\n".join(normalized_lines)


# ── Step 1: Retrieve + match ────────────────────────────────────────────────

def _strip_question_tail(text: str) -> str:
    return re.sub(
        r"\s*(?:th[iì]\s*)?(?:(?:b[iị]\s*)?(?:phạt|xử lý|xu ly)|(?:áp dụng|ap dung)\s+rule\s+nào|(?:xử lý|xu ly)\s+theo\s+rule\s+nào|theo\s+rule\s+nào).*$",
        "",
        text,
        flags=re.IGNORECASE,
    ).strip(" ,.?")


def _extract_question_tail(query: str) -> str:
    match = re.search(
        r"((?:th[iì]\s*)?(?:(?:b[iị]\s*)?(?:phạt|xử lý|xu ly)|(?:áp dụng|ap dung)\s+rule\s+nào|(?:xử lý|xu ly)\s+theo\s+rule\s+nào|theo\s+rule\s+nào).*)$",
        query,
        flags=re.IGNORECASE,
    )
    if match:
        return match.group(1).strip()
    normalized_query = _normalize_text(query).replace("đ", "d")
    if "rule nao" in normalized_query:
        return "bị xử lý theo rule nào?"
    return "bị phạt thế nào?"


def _extract_json_object_with_key(text: str, required_key: str) -> dict | None:
    """Return the first parsed JSON object that contains required_key."""
    if not text:
        return None

    cleaned = text.strip()

    fenced = re.search(r'```(?:json)?\s*([\s\S]+?)\s*```', cleaned)
    if fenced:
        cleaned = fenced.group(1).strip()

    # Try whole payload first.
    try:
        obj = json.loads(cleaned)
        if isinstance(obj, dict) and required_key in obj:
            return obj
    except Exception:
        pass

    # Fallback: scan balanced-brace JSON objects and parse each.
    for candidate in _extract_json_candidates(cleaned):
        try:
            obj = json.loads(candidate)
            if isinstance(obj, dict) and required_key in obj:
                return obj
        except Exception:
            continue

    return None


def _decompose_query_with_llm(query: str) -> list[str]:
    """
    Ask local LLM to split a multi-violation query into self-contained sub-queries.
    Returns [] on any failure so caller can fallback to rule-based decomposition.
    """
    prompt = (
        "Tách câu hỏi pháp lý tiếng Việt thành các mệnh đề vi phạm độc lập. "
        "Chỉ trả về JSON duy nhất theo schema sau:\n"
        "{\n"
        '  "sub_queries": ["...", "..."]\n'
        "}\n\n"
        "Quy tắc:\n"
        "1. Mỗi phần tử phải là một câu hỏi đầy đủ nghĩa, có thể dùng trực tiếp để retrieve rule.\n"
        "2. Giữ đúng chủ thể (ví dụ: người điều khiển xe máy), không đổi loại phương tiện.\n"
        "3. Mỗi hành vi vi phạm tách thành một câu riêng.\n"
        "4. Không thêm giải thích, không thêm key khác, không markdown.\n\n"
        "Ví dụ 1:\n"
        "Input: Người điều khiển xe máy không bật đèn ban đêm và chạy quá tốc độ 10 km/h bị phạt thế nào?\n"
        "Output:\n"
        "{\n"
        '  "sub_queries": [\n'
        '    "Người điều khiển xe máy không bật đèn ban đêm bị phạt thế nào?",\n'
        '    "Người điều khiển xe máy chạy quá tốc độ 10 km/h bị phạt thế nào?"\n'
        "  ]\n"
        "}\n\n"
        "Ví dụ 2:\n"
        "Input: Người lái xe máy không nhường đường và vượt đèn đỏ gây tai nạn thì bị xử lý ra sao?\n"
        "Output:\n"
        "{\n"
        '  "sub_queries": [\n'
        '    "Người lái xe máy không nhường đường gây tai nạn thì bị xử lý ra sao?",\n'
        '    "Người lái xe máy vượt đèn đỏ gây tai nạn thì bị xử lý ra sao?"\n'
        "  ]\n"
        "}\n\n"
        f"Câu gốc: {query}"
    )

    try:
        raw = call_llm(prompt)
    except Exception:
        return []

    parsed = _extract_json_object_with_key(raw or "", "sub_queries")
    if not parsed:
        return []

    values = parsed.get("sub_queries")
    if not isinstance(values, list):
        return []

    normalized: list[str] = []
    seen: set[str] = set()
    for item in values:
        if not isinstance(item, str):
            continue
        candidate = re.sub(r"\s+", " ", item).strip(" ,")
        if not candidate:
            continue
        if candidate not in seen:
            seen.add(candidate)
            normalized.append(candidate)

    return normalized


def decompose_query(query: str) -> list[str]:
    compact_query = re.sub(r"\s+", " ", query).strip()
    if not _query_mentions_multiple_violations(compact_query):
        return [compact_query]

    llm_sub_queries = _decompose_query_with_llm(compact_query)
    if llm_sub_queries:
        merged = [compact_query]
        seen = {compact_query}
        for sub_query in llm_sub_queries:
            if sub_query not in seen:
                seen.add(sub_query)
                merged.append(sub_query)
        if len(merged) >= 2:
            return merged

    segments = re.split(
        r"\s*,?\s*(?:vừa|đồng thời|cùng lúc|kèm theo|và)\s+",
        compact_query,
        flags=re.IGNORECASE,
    )
    segments = [segment.strip(" ,") for segment in segments if segment.strip(" ,")]
    if len(segments) < 2:
        return [compact_query]

    question_tail = _extract_question_tail(compact_query)

    sub_queries = [compact_query]
    seen: set[str] = {compact_query}
    for clause in segments:
        cleaned_clause = _strip_question_tail(clause)
        if not cleaned_clause:
            continue
        normalized_clause = _normalize_text(cleaned_clause).replace("đ", "d")
        if any(token in normalized_clause for token in ["bi phat", "xu ly", "rule nao"]):
            sub_query = cleaned_clause
        else:
            sub_query = f"{cleaned_clause} {question_tail}".strip()
        sub_query = re.sub(r"\s+", " ", sub_query)
        if sub_query not in seen:
            seen.add(sub_query)
            sub_queries.append(sub_query)

    return sub_queries

def retrieve_and_match(query: str, top_k: int = 10) -> tuple[list[dict], list[dict]]:
    """Return (retrieved_chunks, deduplicated_matched_asp_rules)."""
    decomposed_queries = decompose_query(query)
    all_rules = load_rules()

    chunk_map: dict[tuple[str, str], dict] = {}
    seen: set[str] = set()
    matched_rules: list[dict] = []

    for sub_query in decomposed_queries:
        sub_query_chunks = retrieve(sub_query, top_k)

        for chunk in sub_query_chunks:
            meta = chunk["metadata"]
            chunk_key = (meta.get("breadcrumb", ""), chunk["text"])
            existing = chunk_map.get(chunk_key)
            if existing is None or chunk["score"] > existing["score"]:
                chunk_map[chunk_key] = chunk

        if not sub_query_chunks:
            continue

        # Ground rule matching to the strongest retrieved chunk for each sub-query.
        # This keeps single-violation questions from inheriting unrelated rules from lower-ranked chunks,
        # while multi-violation questions still get one focused chunk per sub-query.
        top_chunk = sub_query_chunks[0]
        for rule in match_chunk_to_rules(top_chunk["metadata"], all_rules):
            if rule["rule_id"] not in seen:
                seen.add(rule["rule_id"])
                matched_rules.append(rule)

    chunks = sorted(chunk_map.values(), key=lambda item: item["score"], reverse=True)

    return chunks, matched_rules


# ── Step 2: Build LLM prompt ────────────────────────────────────────────────

def _normalize_text(text: str) -> str:
    normalized = unicodedata.normalize("NFD", text.lower())
    normalized = "".join(ch for ch in normalized if unicodedata.category(ch) != "Mn")
    return re.sub(r"\s+", " ", normalized).strip()


# Ordered: most specific first so that "xe máy ba bánh" matches three_wheel before motorbike.
_SUBJECT_KEYWORD_MAP: list[tuple[list[str], str]] = [
    (["xe may ba banh", "moto ba banh"],              "three_wheel_motorbike"),
    (["xe may hai banh"],                              "two_wheel_motorbike"),
    (["xe dap dien", "xe dap may"],                  "electric_bicycle"),
    (["xe dap"],                                       "bicycle"),
    (["xe xich lo"],                                   "cyclo"),
    (["xe tho so khac", "xe tho so"],                "rudimentary_vehicle"),
    (["phuong tien khong dong co", "phuong tien tho so"], "non_motorized_vehicle"),
    (["xe may", "xe mo to", "moto", "xe gan may"],     "motorbike"),
    (["xe o to", "xe bon cho", "xe con", "o to"],       "car"),
    (["xe bon banh", "xe bon-banh"],                   "four_wheeled_motor_vehicle"),
    (["nguoi di bo"],                                  "pedestrian"),
    (["hanh khach", "nguoi ngoi tren xe"],             "passenger"),
    (["xe uu tien"],                                   "priority_vehicle"),
]

_DETECTABLE_SUBJECT_TYPES = {subject_type for _, subject_type in _SUBJECT_KEYWORD_MAP}
_SUBJECT_PARENT_MAP: dict[str, str] = {
    "electric_bicycle": "bicycle",
    "bicycle": "non_motorized_vehicle",
    "cyclo": "rudimentary_vehicle",
    "rudimentary_vehicle": "non_motorized_vehicle",
}


def _subject_matches_rule_subject(actual_subject: str, rule_subject: str) -> bool:
    """Return True when the extracted/query subject is equal to or narrower than the rule subject."""
    current = actual_subject
    while current:
        if current == rule_subject:
            return True
        current = _SUBJECT_PARENT_MAP.get(current, "")
    return False


def _detect_subject_type_from_query(query: str) -> str | None:
    """Return the KB subject type string when the query explicitly names a vehicle/person type."""
    normalized = _normalize_text(query).replace("\u0111", "d")
    for keywords, subject_type in _SUBJECT_KEYWORD_MAP:
        if any(kw in normalized for kw in keywords):
            return subject_type
    return None


def _override_subject_type_from_query(query: str, facts: list[dict]) -> list[dict]:
    """If query explicitly names a vehicle type, overwrite every case_subject_type fact with it."""
    detected = _detect_subject_type_from_query(query)
    if not detected:
        return facts

    result: list[dict] = []
    for fact in facts:
        if (
            isinstance(fact, dict)
            and fact.get("predicate") in {"case_subject_type", "driver_type", "subject_type"}
        ):
            corrected = dict(fact)
            args = list(fact.get("args") or [])
            if len(args) >= 2:
                args[1] = detected
            elif len(args) == 1:
                args.append(detected)
            else:
                args = ["user1", detected]
            corrected["args"] = args
            result.append(corrected)
        else:
            result.append(fact)
    return result


def _extract_subject_for_entity(facts: list[dict], entity: str) -> str | None:
    for fact in facts:
        if not isinstance(fact, dict):
            continue
        if fact.get("predicate") not in {"case_subject_type", "driver_type", "subject_type"}:
            continue
        args = fact.get("args") or []
        if len(args) >= 2 and str(args[0]) == entity:
            return str(args[1])
    return None


def _enforce_subject_action_pairs_from_matched_rules(
    query: str,
    facts: list[dict],
    matched_rules: list[dict],
) -> tuple[list[dict], list[dict]]:
    """
    Ensure each extracted action belongs to a rule that has the same extracted subject.

    Returns (corrected_facts, corrections), where each correction includes:
      - entity
      - subject
      - old_action
      - new_action
      - rule_id
    """
    corrected_facts: list[dict] = []
    corrections: list[dict] = []

    for fact in facts:
        if not isinstance(fact, dict):
            corrected_facts.append(fact)
            continue

        if fact.get("predicate") not in {"case_action", "did_action", "action"}:
            corrected_facts.append(fact)
            continue

        args = list(fact.get("args") or [])
        if len(args) < 2:
            corrected_facts.append(fact)
            continue

        entity = str(args[0])
        extracted_action = str(args[1])
        extracted_subject = _extract_subject_for_entity(facts, entity)

        # Only enforce when we can identify subject for this entity.
        if not extracted_subject:
            corrected_facts.append(fact)
            continue

        subject_rules = [
            rule for rule in matched_rules
            if _subject_matches_rule_subject(extracted_subject, str(rule.get("subject") or ""))
        ]
        if not subject_rules:
            corrected_facts.append(fact)
            continue

        if any(str(rule.get("action") or "") == extracted_action for rule in subject_rules):
            corrected_facts.append(fact)
            continue

        # Pick the best action among rules of the same subject.
        best_rule = max(
            subject_rules,
            key=lambda rule: _score_rule_for_query(query, rule),
        )
        corrected = dict(fact)
        corrected_args = list(args)
        corrected_args[1] = str(best_rule.get("action") or extracted_action)
        corrected["args"] = corrected_args
        corrected_facts.append(corrected)

        corrections.append(
            {
                "entity": entity,
                "subject": extracted_subject,
                "old_action": extracted_action,
                "new_action": corrected_args[1],
                "rule_id": str(best_rule.get("rule_id") or ""),
            }
        )

    return corrected_facts, corrections


def _query_mentions_exception(query: str) -> bool:
    normalized_query = _normalize_text(query)
    exception_cues = [
        "ngoai le",
        "tru truong hop",
        "tru khi",
        "tru xe",
        "khong bi phat",
        "mien phat",
        "mien tru",
        "khong ap dung",
        "duoc phep",
        "uu tien",
        "khan cap",
        "cap cuu",
    ]
    return any(cue in normalized_query for cue in exception_cues)


def _strip_unsupported_exception_facts(
    matched_rules: list[dict],
    facts: list[dict],
    allowed_rule_ids: set[str] | None = None,
) -> list[dict]:
    effective_rules = matched_rules
    if allowed_rule_ids:
        effective_rules = [
            rule for rule in matched_rules
            if str(rule.get("rule_id") or "") in allowed_rule_ids
        ]

    supported_exceptions = {
        exception_ref
        for rule in effective_rules
        for exception_ref in (rule.get("exception_ref") or [])
    }
    if not supported_exceptions:
        return [
            fact for fact in facts
            if not (
                isinstance(fact, dict)
                and fact.get("predicate") in {"case_exception", "exception_applies", "exception"}
            )
        ]

    filtered_facts: list[dict] = []
    for fact in facts:
        if not isinstance(fact, dict):
            filtered_facts.append(fact)
            continue
        if fact.get("predicate") not in {"case_exception", "exception_applies", "exception"}:
            filtered_facts.append(fact)
            continue
        args = fact.get("args") or []
        if len(args) >= 2 and str(args[1]) in supported_exceptions:
            filtered_facts.append(fact)

    return filtered_facts


def _strip_action_facts_not_in_selected_rules(
    matched_rules: list[dict],
    facts: list[dict],
    allowed_rule_ids: set[str] | None = None,
) -> list[dict]:
    """Keep action facts grounded to the LLM-selected rule ids when they are available."""
    if not allowed_rule_ids:
        return facts

    effective_rules = [
        rule for rule in matched_rules
        if str(rule.get("rule_id") or "") in allowed_rule_ids
    ]
    if not effective_rules:
        return facts

    allowed_actions = {
        str(rule.get("action") or "")
        for rule in effective_rules
        if rule.get("action")
    }
    if not allowed_actions:
        return facts

    filtered_facts: list[dict] = []
    for fact in facts:
        if not isinstance(fact, dict):
            filtered_facts.append(fact)
            continue

        if fact.get("predicate") not in {"case_action", "did_action", "action"}:
            filtered_facts.append(fact)
            continue

        args = fact.get("args") or []
        if len(args) >= 2 and str(args[1]) in allowed_actions:
            filtered_facts.append(fact)

    return filtered_facts


def _strip_exception_facts_if_not_mentioned_in_query(query: str, facts: list[dict]) -> list[dict]:
    """Remove exception facts if query does not explicitly mention exception/exemption/priority/emergency."""
    if _query_mentions_exception(query):
        return facts
    
    return [
        fact for fact in facts
        if not (
            isinstance(fact, dict)
            and fact.get("predicate") in {"case_exception", "exception_applies", "exception"}
        )
    ]


def _query_mentions_priority_vehicle_emergency(query: str) -> bool:
    normalized_query = _normalize_text(query)
    priority_cues = ["xe uu tien", "uu tien"]
    emergency_cues = ["khan cap", "lam nhiem vu", "dang di lam nhiem vu", "cap cuu"]
    return (
        any(cue in normalized_query for cue in priority_cues)
        or any(cue in normalized_query for cue in emergency_cues)
    )


def _append_priority_vehicle_emergency_exception(
    query: str,
    matched_rules: list[dict],
    facts: list[dict],
    allowed_rule_ids: set[str] | None = None,
) -> tuple[list[dict], bool]:
    exception_ref = "priority_vehicle_on_emergency_duty"
    if not _query_mentions_priority_vehicle_emergency(query):
        return facts, False

    effective_rules = matched_rules
    if allowed_rule_ids:
        effective_rules = [
            rule for rule in matched_rules
            if str(rule.get("rule_id") or "") in allowed_rule_ids
        ]

    if not any(exception_ref in (rule.get("exception_ref") or []) for rule in effective_rules):
        return facts, False

    for fact in facts:
        if not isinstance(fact, dict):
            continue
        if fact.get("predicate") not in {"case_exception", "exception_applies", "exception"}:
            continue
        args = fact.get("args") or []
        if len(args) >= 2 and str(args[1]) == exception_ref:
            return facts, False

    return facts + [
        {
            "predicate": "case_exception",
            "args": ["user1", exception_ref],
        }
    ], True


def _extract_rule_ids_from_reasoning(reasoning_results: list[str]) -> list[str]:
    rule_ids: list[str] = []
    seen: set[str] = set()

    for atom in reasoning_results:
        match = re.match(r"result\(([^,]+),(\d+),(\d+)\)", atom)
        if not match:
            continue
        rule_id = match.group(1)
        if rule_id not in seen:
            seen.add(rule_id)
            rule_ids.append(rule_id)

    return rule_ids


def _parse_result_atom(atom: str) -> tuple[str, int, int] | None:
    match = re.match(r"result\(([^,]+),(\d+),(\d+)\)", atom)
    if not match:
        return None
    return match.group(1), int(match.group(2)), int(match.group(3))


def _rule_parent_id(rule_id: str) -> str:
    """Collapse sub-rules like d7_k1_i_1, d7_k1_i_2 into d7_k1_i."""
    return re.sub(r"_\d+$", "", rule_id)


def _context_overlap_score(rule: dict, facts_json: list[dict]) -> int:
    case_contexts = _extract_fact_values(facts_json, "case_context", "has_context", "context")
    if not case_contexts:
        return 0

    rule_contexts = {
        str(context_value)
        for context_value in (rule.get("context") or [])
        if context_value
    }
    return len(rule_contexts & case_contexts)


def _select_best_rule_atom_for_parent(
    query: str,
    atoms: list[str],
    matched_rules_by_id: dict[str, dict],
    facts_json: list[dict],
) -> str:
    if len(atoms) == 1:
        return atoms[0]

    best_atom = atoms[0]
    best_context_overlap = -1
    best_score = -1
    best_text_len = -1

    for atom in atoms:
        parsed = _parse_result_atom(atom)
        if not parsed:
            continue
        rule_id = parsed[0]
        rule = matched_rules_by_id.get(rule_id)
        if not rule:
            continue
        context_overlap = _context_overlap_score(rule, facts_json)
        overlap, rule_text_len = _score_rule_for_query(query, rule)
        if (context_overlap, overlap, rule_text_len) > (best_context_overlap, best_score, best_text_len):
            best_context_overlap = context_overlap
            best_score = overlap
            best_text_len = rule_text_len
            best_atom = atom

    return best_atom


def _deduplicate_sub_rules_within_same_point(
    query: str,
    matched_rules: list[dict],
    facts_json: list[dict],
    reasoning_results: list[str],
) -> list[str]:
    """Keep at most one applied sub-rule for each point parent (e.g., d7_k1_i_1 vs d7_k1_i_2)."""
    if len(reasoning_results) <= 1:
        return reasoning_results

    matched_rules_by_id = {
        str(rule.get("rule_id")): rule
        for rule in matched_rules
        if isinstance(rule, dict) and rule.get("rule_id")
    }

    grouped_atoms: dict[str, list[str]] = {}
    ordered_parents: list[str] = []

    for atom in reasoning_results:
        parsed = _parse_result_atom(atom)
        if not parsed:
            # Keep non-result atoms as unique groups by raw atom text.
            parent_key = f"__raw__:{atom}"
        else:
            rule_id = parsed[0]
            if re.search(r"_\d+$", rule_id):
                parent_key = _rule_parent_id(rule_id)
            else:
                parent_key = f"__rule__:{rule_id}"

        if parent_key not in grouped_atoms:
            grouped_atoms[parent_key] = []
            ordered_parents.append(parent_key)
        grouped_atoms[parent_key].append(atom)

    filtered_results: list[str] = []
    for parent_key in ordered_parents:
        atoms = grouped_atoms[parent_key]
        filtered_results.append(
            _select_best_rule_atom_for_parent(query, atoms, matched_rules_by_id, facts_json)
        )

    return filtered_results


def _extract_rule_ids_from_exception_match(matched_rules: list[dict], facts_json: list[dict]) -> list[str]:
    case_exceptions = _extract_fact_values(facts_json, "case_exception", "exception_applies", "exception")
    if not case_exceptions:
        return []

    case_actions = _extract_fact_values(facts_json, "case_action", "did_action", "action")
    candidate_rules = matched_rules
    if case_actions:
        candidate_rules = [rule for rule in matched_rules if rule.get("action") in case_actions]

    matched_rule_ids: list[str] = []
    seen: set[str] = set()
    for rule in candidate_rules:
        rule_id = rule.get("rule_id")
        if not rule_id or rule_id in seen:
            continue
        if any(exception_ref in case_exceptions for exception_ref in rule.get("exception_ref", [])):
            seen.add(rule_id)
            matched_rule_ids.append(rule_id)

    return matched_rule_ids


def _extract_applied_rule_ids(matched_rules: list[dict], facts_json: list[dict], reasoning_results: list[str]) -> list[str]:
    rule_ids = _extract_rule_ids_from_reasoning(reasoning_results)
    if rule_ids:
        return rule_ids
    return _extract_rule_ids_from_exception_match(matched_rules, facts_json)


def _query_mentions_multiple_violations(query: str) -> bool:
    normalized_query = f" {_normalize_text(query).replace('đ', 'd')} "
    return any(
        cue in normalized_query
        for cue in [" vua ", " dong thoi ", " cung luc ", " kem theo ", " va "]
    )


def _score_rule_for_query(query: str, rule: dict) -> tuple[int, int]:
    normalized_query = _normalize_text(query).replace("đ", "d")
    query_tokens = {token for token in re.findall(r"\w+", normalized_query) if len(token) >= 3}
    action = str(rule.get("action", ""))
    normalized_action = action.replace("_", " ")

    normalized_rule_text = _normalize_text(
        " ".join([
            action,
            str(rule.get("original_vi_text", "")),
        ])
    ).replace("đ", "d")
    overlap = sum(1 for token in query_tokens if token in normalized_rule_text)
    mentions_driver = any(cue in normalized_query for cue in ["nguoi lai", "lai xe", "dieu khien xe"])
    if mentions_driver:
        if any(cue in normalized_rule_text for cue in ["dieu khien xe", "nguoi dieu khien", "lai xe"]):
            overlap += 3
        if any(cue in normalized_rule_text for cue in ["cho nguoi tren xe", "hanh khach", "nguoi tren xe"]):
            overlap -= 3
    if "khong that day an toan" in normalized_query and mentions_driver:
        if action == "driver_not_wearing_seatbelt":
            overlap += 10
        if action == "passenger_not_wearing_seatbelt":
            overlap -= 10

    action_cue_map = [
        (["chuyen lan"], ["lane change"], 12),
        (["giu khoang cach an toan", "khoang cach an toan"], ["following distance"], 12),
        (["den tin hieu", "tin hieu giao thong"], ["traffic light"], 12),
        (["di nguoc chieu", "nguoc chieu"], ["opposite direction"], 12),
        (["dung dien thoai", "thiet bi dien tu"], ["phone", "electronic device"], 12),
        (["khong chap hanh yeu cau kiem tra", "yeu cau kiem tra", "kiem tra ve nong do con"], ["refuse_alcohol_test"], 18),
        (["kiem tra ve chat ma tuy", "kiem tra ve chat kich thich", "chat ma tuy", "chat kich thich"], ["refuse_test", "drug", "stimulant"], 18),
        (["that day an toan", "day dai an toan"], ["seatbelt"], 12),
        (["vuot xe", "can vuot", "hieu lenh vuot"], ["overtake", "no_signal", "not_maintain_signal"], 12),
        (["bat den", "den chieu sang", "khong bat den", "khong su dung den", "thieu den"], ["no_light", "no light", "lighting"], 15),
        (["qua toc do", "chay qua toc", "toc do quy dinh", "vuot toc do"], ["speeding", "speed"], 12),
    ]
    for query_phrases, action_keywords, bonus in action_cue_map:
        if any(phrase in normalized_query for phrase in query_phrases) and any(
            keyword in normalized_action for keyword in action_keywords
        ):
            overlap += bonus

    # Vehicle-type bonus: strongly prefer rules whose subject matches the subject named in the query.
    rule_subject = str(rule.get("subject", "") or "")
    detected_subject = _detect_subject_type_from_query(query)
    if detected_subject:
        if rule_subject == detected_subject:
            overlap += 20
        elif _subject_matches_rule_subject(detected_subject, rule_subject):
            overlap += 10
        elif rule_subject in _DETECTABLE_SUBJECT_TYPES:
            overlap -= 12

    return overlap, len(normalized_rule_text)


def _prioritize_rules_for_query(query: str, rules: list[dict]) -> list[dict]:
    selected_rule_ids = {
        item["rule"]["rule_id"]
        for item in _select_rules_for_subqueries(query, rules)
    }

    def sort_key(rule: dict) -> tuple[int, int, int, int]:
        query_overlap, rule_length = _score_rule_for_query(query, rule)
        subquery_overlap = max(
            (
                _score_rule_for_query(item["sub_query"], rule)[0]
                for item in _select_rules_for_subqueries(query, rules)
            ),
            default=0,
        )
        return (
            1 if rule.get("rule_id") in selected_rule_ids else 0,
            subquery_overlap,
            query_overlap,
            rule_length,
        )

    return sorted(rules, key=sort_key, reverse=True)


def _select_rules_for_subqueries(query: str, rules: list[dict]) -> list[dict]:
    decomposed_queries = decompose_query(query)
    if len(decomposed_queries) <= 1:
        return []

    selected: list[dict] = []
    seen_rule_ids: set[str] = set()
    for sub_query in decomposed_queries[1:]:
        ranked_rules = sorted(rules, key=lambda rule: _score_rule_for_query(sub_query, rule), reverse=True)
        for rule in ranked_rules:
            rule_id = rule.get("rule_id")
            if not rule_id or rule_id in seen_rule_ids:
                continue
            score, _ = _score_rule_for_query(sub_query, rule)
            if score <= 0:
                continue
            selected.append({"sub_query": sub_query, "rule": rule})
            seen_rule_ids.add(rule_id)
            break

    return selected


def _build_subquery_coverage_block(query: str, rules: list[dict]) -> str:
    selected = _select_rules_for_subqueries(query, rules)
    if len(selected) < 2:
        return ""

    lines = ["Các mệnh đề vi phạm đã tách từ câu hỏi, không được bỏ sót mệnh đề nào:"]
    for item in selected:
        lines.append(
            f'- "{item["sub_query"]}" -> action phù hợp nhất: "{item["rule"]["action"]}"'
        )
    return "\n".join(lines) + "\n\n"


def _build_multi_violation_example(query: str, rules: list[dict]) -> str:
    if not _query_mentions_multiple_violations(query):
        return ""

    selected = _select_rules_for_subqueries(query, rules)
    if len(selected) >= 2:
        example_rules = [item["rule"] for item in selected]
        target_subject = example_rules[0].get("subject")
    else:
        prioritized_rules = _prioritize_rules_for_query(query, rules)
        target_subject = prioritized_rules[0].get("subject") if prioritized_rules else None
        example_rules = []
        seen_actions: set[str] = set()

        for rule in prioritized_rules:
            if rule.get("subject") != target_subject:
                continue
            action = rule.get("action")
            if not action or action in seen_actions:
                continue
            example_rules.append(rule)
            seen_actions.add(action)

    if len(example_rules) < 2:
        return ""

    if len(selected) < 2:
        example_rules.sort(key=lambda rule: _score_rule_for_query(query, rule), reverse=True)
        example_rules = example_rules[:2]

    lines = [
        "Ví dụ nếu câu hỏi nêu đồng thời nhiều hành vi thì phải xuất nhiều case_action:",
        "{",
        '  "facts": [',
        f'    {{"predicate": "case_subject_type", "args": ["user1", "{target_subject}"]}},',
    ]

    fact_lines: list[str] = []
    for rule in example_rules:
        fact_lines.append(
            f'    {{"predicate": "case_action", "args": ["user1", "{rule["action"]}"]}}'
        )
        contexts = rule.get("context") or []
        if contexts:
            fact_lines.append(
                f'    {{"predicate": "case_context", "args": ["user1", "{contexts[0]}"]}}'
            )

    for index, fact_line in enumerate(fact_lines):
        suffix = "," if index < len(fact_lines) - 1 else ""
        lines.append(f"{fact_line}{suffix}")

    lines.extend([
        "  ]",
        "}",
        "",
    ])
    return "\n".join(lines)


def _build_query_specific_prompt_guidance(query: str, rules: list[dict]) -> str:
    normalized_query = _normalize_text(query).replace("đ", "d")
    actions = {str(rule.get("action", "")) for rule in rules}
    exception_refs = {exception for rule in rules for exception in (rule.get("exception_ref") or [])}
    guidance_lines: list[str] = []
    selected = _select_rules_for_subqueries(query, rules)

    if {
        "driver_not_wearing_seatbelt",
        "passenger_not_wearing_seatbelt",
    }.issubset(actions) and any(cue in normalized_query for cue in ["nguoi lai", "lai xe", "dieu khien xe"]):
        guidance_lines.append(
            "- Nếu câu hỏi nói về người lái hoặc người điều khiển xe không thắt dây an toàn thì PHẢI chọn action driver_not_wearing_seatbelt, KHÔNG được chọn passenger_not_wearing_seatbelt."
        )

    if _query_mentions_multiple_violations(query):
        guidance_lines.append(
            "- Nếu câu hỏi có nhiều hành vi nối bằng các cụm như 'vừa ... vừa ...', 'đồng thời', 'và' thì phải xuất đủ một case_action cho từng hành vi khớp với câu hỏi."
        )
        if len(selected) >= 2:
            guidance_lines.append(
                "- Phải kiểm tra lần lượt từng mệnh đề đã tách ở trên và mỗi mệnh đề phải được bao phủ bởi ít nhất một case_action phù hợp."
            )

    if (
        any(cue in normalized_query for cue in ["vuot xe", "can vuot", "hieu lenh vuot", "khong bao truoc khi vuot"])
        and any(a in actions for a in ["overtake", "no_signal", "not_maintain_signal", "overtake_right"])
    ):
        overtake_actions = sorted(
            a for a in actions
            if a in {"overtake", "no_signal", "not_maintain_signal", "overtake_right"}
        )
        guidance_lines.append(
            "- Câu hỏi liên quan đến vượt xe. Giá trị action HỢP LỆ duy nhất từ các rule trên là: "
            + ", ".join(f'"{a}"' for a in overtake_actions)
            + ". TUYỆT ĐỐI không được tự tạo action name khác."
        )

    if (
        any(cue in normalized_query for cue in ["bat den", "den chieu sang", "khong su dung den", "thieu den", "khong bat den"])
        and "no_light" in actions
    ):
        guidance_lines.append(
            '- Câu hỏi liên quan đến đèn chiếu sáng. Giá trị action PHẢI là "no_light". TUYỆT ĐỐI không được tự tạo action name khác.'
        )

    if (
        "illegal_u_turn_at_restricted_location" in actions
        and "traffic_controller_order" in exception_refs
        and any(
            cue in normalized_query
            for cue in [
                "theo hieu lenh",
                "co hieu lenh",
                "nguoi dieu khien giao thong",
            ]
        )
    ):
        guidance_lines.append(
            "- Nếu câu hỏi nói việc quay đầu xe được thực hiện theo hiệu lệnh hoặc hướng dẫn của người điều khiển giao thông thì PHẢI xuất case_exception với giá trị traffic_controller_order."
        )

    if (
        "illegal_u_turn_at_restricted_location" in actions
        and "temporary_traffic_sign_instruction" in exception_refs
        and any(cue in normalized_query for cue in ["bien bao tam thoi", "bien bao hieu tam thoi", "chi dan tam thoi"])
    ):
        guidance_lines.append(
            "- Nếu câu hỏi nói việc quay đầu xe được phép theo biển báo hoặc chỉ dẫn tạm thời thì PHẢI xuất case_exception với giá trị temporary_traffic_sign_instruction."
        )

    # Subject-type guidance: when query explicitly names a vehicle type and the matched
    # rules contain subjects for both that type AND other types, tell the LLM exactly
    # which subject value to use so it doesn't copy from the wrong example rule.
    detected_subject = _detect_subject_type_from_query(query)
    if detected_subject:
        rule_subjects = {str(rule.get("subject", "")) for rule in rules}
        if detected_subject in rule_subjects:
            # Build human-readable hint for what the query mentions
            subject_hint_map = {
                "motorbike":                "xe máy / xe mô tô",
                "three_wheel_motorbike":    "xe máy ba bánh",
                "two_wheel_motorbike":      "xe máy hai bánh",
                "electric_bicycle":         "xe đạp điện / xe đạp máy",
                "bicycle":                  "xe đạp",
                "cyclo":                    "xe xích lô",
                "rudimentary_vehicle":      "xe thô sơ",
                "non_motorized_vehicle":    "phương tiện không động cơ / phương tiện thô sơ",
                "car":                      "ô tô",
                "four_wheeled_motor_vehicle": "xe bốn bánh",
                "pedestrian":               "người đi bộ",
                "passenger":               "hành khách",
                "priority_vehicle":         "xe ưu tiên",
            }
            vn_hint = subject_hint_map.get(detected_subject, detected_subject)
            guidance_lines.append(
                f"- Câu hỏi đề cập đến '{vn_hint}', vì vậy PHẢI chọn "
                f'case_subject_type = "{detected_subject}". '
                f"KHÔNG được chọn bất kỳ subject type nào khác."
            )

    if not guidance_lines:
        return ""
    return "\n".join(guidance_lines) + "\n"


def _build_retrieved_chunk_block(chunks: list[dict] | None) -> str:
    if not chunks:
        return ""

    lines = ["Trích đoạn điều luật đã retrieve:"]
    for chunk in chunks[:5]:
        metadata = chunk.get("metadata", {})
        label = metadata.get("breadcrumb") or metadata.get("dieu_title") or ""
        body = metadata.get("diem_text") or chunk.get("text", "")
        body = re.sub(r"\s+", " ", str(body)).strip()
        if len(body) > 500:
            body = body[:500].rstrip() + "..."
        lines.append(f"- {label}: {body}")
    return "\n".join(lines) + "\n\n"


def _build_subject_action_pair_block(rules: list[dict]) -> str:
    if not rules:
        return ""

    lines = [
        "Cặp subject-action hợp lệ (phải lấy cùng một rule, không ghép chéo):"
    ]
    seen: set[tuple[str, str, str]] = set()
    for rule in rules:
        rule_id = str(rule.get("rule_id") or "")
        subject = str(rule.get("subject") or "")
        action = str(rule.get("action") or "")
        if not rule_id or not subject or not action:
            continue
        key = (rule_id, subject, action)
        if key in seen:
            continue
        seen.add(key)
        lines.append(f'- {rule_id}: subject="{subject}", action="{action}"')

    if len(lines) == 1:
        return ""
    return "\n".join(lines) + "\n\n"


def build_extraction_prompt(query: str, rules: list[dict], chunks: list[dict] | None = None) -> str:
    prioritized_rules = _prioritize_rules_for_query(query, rules)
    rules_have_exception = any(rule.get("exception_ref") for rule in prioritized_rules)
    multi_violation_example = _build_multi_violation_example(query, prioritized_rules)
    query_specific_guidance = _build_query_specific_prompt_guidance(query, prioritized_rules)
    subquery_coverage_block = _build_subquery_coverage_block(query, prioritized_rules)
    retrieved_chunk_block = _build_retrieved_chunk_block(chunks)
    subject_action_pair_block = _build_subject_action_pair_block(prioritized_rules)
    rules_json = json.dumps(
        [
            {
                "rule_id": r["rule_id"],
                "subject": r["subject"],
                "action":  r["action"],
                "context": r["context"],
                **({"exception": r["exception_ref"]} if r["exception_ref"] else {}),
            }
            for r in prioritized_rules
        ],
        ensure_ascii=False,
        indent=1,
    )

    exception_instruction = (
        "Chỉ sau khi đã chốt matched_rule_ids ở BƯỚC 1, mới được xét exception của CHÍNH các rule_id đó. Nếu câu hỏi khớp ngoại lệ của rule_id đã match thì xuất case_exception tương ứng; nếu không khớp thì KHÔNG được xuất case_exception.\n"
        if rules_have_exception else
        "Không có exception nào trong các rule đã match, vì vậy TUYỆT ĐỐI không được xuất bất kỳ fact case_exception nào.\n"
    )

    return (
        "Bạn là hệ thống trích xuất legal case facts. Chỉ trả về JSON, không giải thích.\n\n"
        f"Câu hỏi:\n{query}\n\n"
        f"Các rule liên quan:\n{rules_json}\n\n"
        f"{retrieved_chunk_block}"
        f"{subject_action_pair_block}"
        f"{subquery_coverage_block}"
        "Yêu cầu output — chỉ JSON object duy nhất, KHÔNG có text ngoài JSON:\n"
        "{\n"
        '  "matched_rule_ids": ["..."],\n'
        '  "facts": [\n'
        '    {"predicate": "case_subject_type", "args": ["user1", "..."]},\n'
        '    {"predicate": "case_action",       "args": ["user1", "..."]},\n'
        '    {"predicate": "case_exception",       "args": ["user1", "..."]} \n'
        "  ]\n"
        "}\n\n"
        "Quy tắc BẮT BUỘC:\n"
        '1. Mỗi fact PHẢI có đúng 2 key: "predicate" và "args"\n'
        '2. "args" PHẢI là mảng 2 phần tử: ["user1", "<giá trị>"]\n'
        '3. TUYỆT ĐỐI không dùng key "value", "answer", "question", "type"\n'
        "4. BƯỚC 1: Xác định matched_rule_ids dựa trên danh sách Cặp subject-action hợp lệ; mỗi rule_id được chọn khi và chỉ khi subject + action của rule đó thực sự khớp mệnh đề trong câu hỏi\n"
        "5. BƯỚC 1.1: TUYỆT ĐỐI không ghép chéo subject của rule này với action của rule khác\n"
        "6. BƯỚC 1.2: Nếu câu hỏi có nhiều hành vi thì matched_rule_ids PHẢI chứa đủ rule_id cho từng hành vi\n"
        "7. BƯỚC 2: facts PHẢI nhất quán với matched_rule_ids đã chọn; chỉ dùng subject/action/context lấy NGUYÊN VĂN từ các rule_id đó\n"
        "8. Sau khi chọn được subject và action, nếu câu hỏi chứa context giống với context của action đã chọn thì PHẢI thêm case_context tương ứng\n"
        "9. Việc rule có trường exception KHÔNG đồng nghĩa phải xuất case_exception\n"
        f"10. {exception_instruction}"
        "11. Nếu xuất case_exception thì giá trị exception PHẢI thuộc exception_ref của ÍT NHẤT MỘT rule_id trong matched_rule_ids\n"
        f"{query_specific_guidance}"
        "12. Chỉ xuất duy nhất JSON object, không thêm gì khác\n\n"
        f"{multi_violation_example}"
    )


def _extract_llm_matched_rule_ids(llm_output: str) -> list[str]:
    text = llm_output.strip()
    text = re.sub(r'<think>[\s\S]*?</think>', '', text).strip()

    fenced = re.search(r'```(?:json)?\s*([\s\S]+?)\s*```', text)
    if fenced:
        text = fenced.group(1).strip()

    candidates = _extract_json_candidates(text)
    candidates.append(text)

    for candidate in candidates:
        try:
            data = json.loads(candidate)
        except Exception:
            continue
        if not isinstance(data, dict):
            continue

        rule_ids = data.get("matched_rule_ids")
        if not isinstance(rule_ids, list):
            continue

        normalized: list[str] = []
        seen: set[str] = set()
        for rule_id in rule_ids:
            value = str(rule_id).strip()
            if not value or value in seen:
                continue
            seen.add(value)
            normalized.append(value)
        return normalized

    return []


# ── Step 3: Parse LLM JSON output ───────────────────────────────────────────

def _extract_json_candidates(text: str) -> list[str]:
    """
    Return all balanced-brace JSON object strings found in *text*,
    ordered from last occurrence to first (so callers try the last one first).
    """
    candidates: list[tuple[int, str]] = []
    i = 0
    while i < len(text):
        if text[i] == '{':
            depth = 0
            for j in range(i, len(text)):
                if text[j] == '{':
                    depth += 1
                elif text[j] == '}':
                    depth -= 1
                    if depth == 0:
                        candidates.append((i, text[i:j + 1]))
                        i = j + 1
                        break
            else:
                i += 1
        else:
            i += 1
    # reverse so we try the last (most likely final answer) first
    candidates.sort(key=lambda x: x[0], reverse=True)
    return [c for _, c in candidates]


def parse_llm_facts(llm_output: str) -> list[dict]:
    """
    Extract the facts list from the LLM response.
    Handles markdown code fences, <think> blocks, and multiple JSON objects.

    Supported LLM output formats:
      {"facts": [{"predicate": "driver_type", "args": ["case1", "pedestrian"]}, ...]}
      {"facts": [{"type": "subject", "value": "pedestrian"}, ...]}
      {"facts": ["driver_type(case1, pedestrian)", ...]}   ← raw ASP strings
    """
    text = llm_output.strip()

    # Strip <think>...</think> blocks (Qwen3 reasoning traces)
    text = re.sub(r'<think>[\s\S]*?</think>', '', text).strip()

    # If there is a fenced code block, prefer its content
    fenced = re.search(r'```(?:json)?\s*([\s\S]+?)\s*```', text)
    if fenced:
        text = fenced.group(1).strip()

    # Try each balanced-brace JSON candidate from last to first until one parses
    candidates = _extract_json_candidates(text)
    last_exc: Exception | None = None
    for candidate in candidates:
        try:
            data = json.loads(candidate)
            if isinstance(data, dict) and "facts" in data:
                facts = data["facts"]
                if not isinstance(facts, list):
                    raise ValueError(f"'facts' must be a list, got {type(facts)}")
                return facts
        except Exception as exc:
            last_exc = exc
            continue

    # Last resort: try the whole (stripped) text
    try:
        data = json.loads(text)
        facts = data.get("facts", [])
        if not isinstance(facts, list):
            raise ValueError(f"'facts' must be a list, got {type(facts)}")
        return facts
    except Exception as exc:
        raise ValueError(
            f"Cannot parse JSON facts from LLM output. "
            f"Last error: {last_exc or exc}. "
            f"Output (first 300 chars): {llm_output[:300]!r}"
        ) from exc


# ── Step 4: Convert facts → ASP ─────────────────────────────────────────────

def facts_to_asp(facts: list, entity: str = "case1") -> str:
    """
    Convert a list of fact dicts (or strings) to ASP predicate lines.

    Model outputs predicate names: case_subject_type, case_action,
    case_context, case_exception — these are normalized to names
    that reasoning.lp expects: driver_type, did_action, has_context,
    exception_applies.
    """
    _PRED_NORM = {
        "case_subject_type": "driver_type",
        "case_action":       "did_action",
        "case_context":      "has_context",
        "case_exception":    "exception_applies",
        # also accept reasoning.lp names directly
        "driver_type":       "driver_type",
        "did_action":        "did_action",
        "has_context":       "has_context",
        # shorthand type keys
        "subject":           "driver_type",
        "action":            "did_action",
        "context":           "has_context",
    }

    lines: list[str] = []

    for fact in facts:
        if isinstance(fact, str):
            atom = fact.strip().rstrip(".")
            lines.append(f"{atom}.")

        elif isinstance(fact, dict):
            # Format A: {"predicate": "...", "args": [...]}
            if "predicate" in fact and "args" in fact:
                pred = _PRED_NORM.get(fact["predicate"], fact["predicate"])
                args = [str(a) for a in fact["args"]]
                # Guarantee exactly 2 args: [entity, value]
                if len(args) == 0:
                    continue  # skip malformed
                elif len(args) == 1:
                    # model forgot entity — prepend it
                    args = [entity] + args
                elif args[0] != entity:
                    # model put value first — swap
                    args = [entity, args[0]] if len(args) == 1 else [entity] + args[1:]
                lines.append(f"{pred}({', '.join(args[:2])}).")

            # Format B: {"type": "subject", "value": "pedestrian"}
            elif "type" in fact and "value" in fact:
                pred = _PRED_NORM.get(fact["type"], fact["type"])
                lines.append(f"{pred}({entity}, {fact['value']}).")

            # Fallback
            else:
                for k, v in fact.items():
                    if isinstance(v, str):
                        pred = _PRED_NORM.get(k, k)
                        lines.append(f"{pred}({entity}, {v}).")

    return "\n".join(lines)


def _extract_fact_values(facts: list[dict], *predicates: str) -> set[str]:
    values: set[str] = set()
    accepted = set(predicates)

    for fact in facts:
        if not isinstance(fact, dict):
            continue
        if fact.get("predicate") not in accepted:
            continue
        args = fact.get("args")
        if isinstance(args, list) and len(args) >= 2 and args[1]:
            values.add(str(args[1]))

    return values


def _detect_exception_match(matched_rules: list[dict], facts_json: list[dict]) -> bool:
    case_exceptions = _extract_fact_values(facts_json, "case_exception", "exception_applies", "exception")
    if not case_exceptions:
        return False

    case_actions = _extract_fact_values(facts_json, "case_action", "did_action", "action")
    candidate_rules = matched_rules
    if case_actions:
        candidate_rules = [rule for rule in matched_rules if rule.get("action") in case_actions]

    for rule in candidate_rules:
        for exception_ref in rule.get("exception_ref", []):
            if exception_ref in case_exceptions:
                return True

    return False


def _build_final_answer(matched_rules: list[dict], facts_json: list[dict], reasoning_results: list[str]) -> str | None:
    if reasoning_results:
        return None
    if not matched_rules:
        return _INSUFFICIENT_INFO_MESSAGE
    if _detect_exception_match(matched_rules, facts_json):
        return _EXCEPTION_MESSAGE
    return _INSUFFICIENT_INFO_MESSAGE


_EXCEPTION_LABELS = {
    "emergency_patient_transport": "chở người bệnh đi cấp cứu",
    "child_under_12": "chở trẻ em dưới 12 tuổi",
    "elderly_person": "chở người già yếu",
    "disabled_person": "chở người khuyết tật",
    "escorting_law_violator": "áp giải người có hành vi vi phạm pháp luật",
    "priority_vehicle_on_duty": "xe ưu tiên đang làm nhiệm vụ",
    "priority_vehicle_on_emergency_duty": "xe ưu tiên làm nhiệm vụ khẩn cấp",
}


def _format_vnd(amount: int) -> str:
    return f"{amount:,}đ"


def _format_fine_range(fine_min: int, fine_max: int) -> str:
    if fine_min > 0 and fine_max > 0:
        return f"{_format_vnd(fine_min)} - {_format_vnd(fine_max)}"
    if fine_min > 0:
        return f"từ {_format_vnd(fine_min)}"
    if fine_max > 0:
        return f"đến {_format_vnd(fine_max)}"
    return "chưa có metadata mức phạt"


def _format_rule_citation(rule: dict) -> str:
    article = rule.get("article")
    clause = rule.get("clause")
    point = str(rule.get("point") or "").strip()

    parts: list[str] = []
    if point:
        parts.append(f"điểm {point}")
    if isinstance(clause, int) and clause > 0:
        parts.append(f"khoản {clause}")
    if isinstance(article, int) and article > 0:
        parts.append(f"Điều {article}")

    return " ".join(parts) if parts else str(rule.get("rule_id") or "")


def _format_rule_basis(rule: dict, fine_min: int | None = None, fine_max: int | None = None) -> str:
    rule_id = str(rule.get("rule_id") or "").strip()
    citation = _format_rule_citation(rule)
    min_value = fine_min if fine_min is not None else int(rule.get("fine_min") or 0)
    max_value = fine_max if fine_max is not None else int(rule.get("fine_max") or 0)
    fine_text = _format_fine_range(min_value, max_value)
    return f"{citation} (rule {rule_id}, khung phạt: {fine_text})"


def _format_rule_text(rule: dict) -> str:
    text = str(rule.get("original_vi_text") or "").strip()
    return text or "không có nội dung gốc trong metadata"


def _format_exception_values(exception_values: set[str]) -> str:
    if not exception_values:
        return "trường hợp ngoại lệ"
    labels = [_EXCEPTION_LABELS.get(value, value.replace("_", " ")) for value in sorted(exception_values)]
    return ", ".join(labels)


def _find_exception_rules(matched_rules: list[dict], facts_json: list[dict]) -> list[dict]:
    case_exceptions = _extract_fact_values(facts_json, "case_exception", "exception_applies", "exception")
    if not case_exceptions:
        return []

    case_actions = _extract_fact_values(facts_json, "case_action", "did_action", "action")
    candidate_rules = matched_rules
    if case_actions:
        candidate_rules = [rule for rule in matched_rules if rule.get("action") in case_actions]

    return [
        rule
        for rule in candidate_rules
        if any(exception_ref in case_exceptions for exception_ref in rule.get("exception_ref", []))
    ]


def _build_complete_answer(matched_rules: list[dict], facts_json: list[dict], reasoning_results: list[str]) -> str:
    rules_by_id = {
        str(rule.get("rule_id")): rule
        for rule in matched_rules
        if isinstance(rule, dict) and rule.get("rule_id")
    }

    violation_lines: list[str] = []
    for atom in reasoning_results:
        parsed = _parse_result_atom(atom)
        if not parsed:
            continue
        rule_id, fine_min, fine_max = parsed
        rule = rules_by_id.get(rule_id, {"rule_id": rule_id})
        violation_lines.append(
            "Căn cứ "
            f"{_format_rule_basis(rule, fine_min, fine_max)}, nội dung quy định: "
            f"\"{_format_rule_text(rule)}\". "
            f"Do đó tình huống này có vi phạm; mức phạt áp dụng là {_format_fine_range(fine_min, fine_max)}."
        )

    if violation_lines:
        return "\n\n".join(violation_lines)

    exception_rules = _find_exception_rules(matched_rules, facts_json)
    if exception_rules:
        case_exceptions = _extract_fact_values(facts_json, "case_exception", "exception_applies", "exception")
        exception_text = _format_exception_values(case_exceptions)
        return "\n\n".join(
            "Căn cứ "
            f"{_format_rule_basis(rule)}, nội dung quy định: "
            f"\"{_format_rule_text(rule)}\". "
            f"Tình huống thuộc ngoại lệ {exception_text}, nên không bị xử phạt theo rule này."
            for rule in exception_rules
        )

    return _INSUFFICIENT_INFO_MESSAGE


# ── Step 5: Run clingo ───────────────────────────────────────────────────────

def _escape_asp_string(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"')


def _build_matched_rules_lp(matched_rules: list[dict]) -> str:
    lines: list[str] = []

    for rule in matched_rules:
        rule_id = str(rule.get("rule_id") or "").strip()
        if not rule_id:
            continue

        lines.append(f"rule({rule_id}).")

        article = rule.get("article")
        if isinstance(article, int) and article > 0:
            lines.append(f"article({rule_id}, {article}).")

        clause = rule.get("clause")
        if isinstance(clause, int) and clause > 0:
            lines.append(f"clause({rule_id}, {clause}).")

        point = str(rule.get("point") or "").strip()
        if point:
            lines.append(f'point({rule_id}, "{_escape_asp_string(point)}").')

        subject = str(rule.get("subject") or "").strip()
        if subject:
            lines.append(f"subject({rule_id}, {subject}).")

        action = str(rule.get("action") or "").strip()
        if action:
            lines.append(f"action({rule_id}, {action}).")

        for context_value in rule.get("context") or []:
            context_atom = str(context_value).strip()
            if context_atom:
                lines.append(f"context({rule_id}, {context_atom}).")

        for exception_ref in rule.get("exception_ref") or []:
            exception_atom = str(exception_ref).strip()
            if exception_atom:
                lines.append(f"exception({rule_id}, {exception_atom}).")

        fine_min = rule.get("fine_min")
        if isinstance(fine_min, int) and fine_min > 0:
            lines.append(f"fine_min({rule_id}, {fine_min}).")

        fine_max = rule.get("fine_max")
        if isinstance(fine_max, int) and fine_max > 0:
            lines.append(f"fine_max({rule_id}, {fine_max}).")

    return "\n".join(lines)

def run_asp_reasoning(asp_facts: str, matched_rules: list[dict]) -> list[str]:
    """
    Load only the retrieved+matched ASP rules plus reasoning rules as text
    strings (via ctl.add) to avoid Unicode path issues on Windows, then add
    generated facts and run clingo.
    """
    try:
        import clingo
    except ImportError:
        raise RuntimeError(
            "clingo is not installed. Run:  pip install clingo"
        )

    ctl = clingo.Control()

    matched_rules_lp = _build_matched_rules_lp(matched_rules)
    if matched_rules_lp:
        ctl.add("base", [], matched_rules_lp)

    reasoning_content = Path(_REASONING_LP).read_text(encoding="utf-8")
    reasoning_content = _normalize_legacy_list_facts(reasoning_content)
    ctl.add("base", [], reasoning_content)

    ctl.add("base", [], asp_facts)

    ctl.ground([("base", [])])

    result_atoms: list[str] = []
    with ctl.solve(yield_=True) as handle:
        for model in handle:
            for atom in model.symbols(shown=True):
                result_atoms.append(str(atom))

    return result_atoms


# ── Orchestrator ─────────────────────────────────────────────────────────────

def run_asp_pipeline(query: str, top_k: int = 5) -> dict:
    """
    Run the full ASP pipeline and return a structured result dict:

        query             — original query
        retrieved_chunks  — list of retrieved Chroma chunks
        matched_rules     — list of matched ASP rule dicts
        llm_prompt        — prompt sent to the local LLM
        llm_raw           — raw text response from LLM
        facts_json        — parsed facts list
        asp_facts         — generated ASP fact predicates (.lp text)
        reasoning_results — list of result/3 atoms from clingo
        error             — error message string (only present on failure)
    """
    log = _get_logger()
    log.info("=" * 60)
    log.info(f"QUERY: {query}")
    log.info(f"top_k={top_k}")
    decomposed_queries = decompose_query(query)
    if len(decomposed_queries) > 1:
        log.info(f"decomposed into {len(decomposed_queries) - 1} sub-queries")
        for sub_query in decomposed_queries[1:]:
            log.debug(f"    sub-query: {sub_query}")

    # 1. Retrieve + match
    log.info("[STEP 1] Retrieving chunks + matching ASP rules ...")
    chunks, matched_rules = retrieve_and_match(query, top_k)
    log.info(f"  → {len(chunks)} chunks retrieved")
    for c in chunks:
        m = c["metadata"]
        log.debug(f"    chunk: dieu={m.get('dieu_num')} khoan={m.get('khoan_num')} "
                  f"diem={m.get('diem')} score={c['score']:.4f}  {m.get('dieu_title','')[:60]}")
    log.info(f"  → {len(matched_rules)} ASP rules matched")
    for r in matched_rules:
        log.debug(f"    rule: {r['rule_id']:25s}  subject={r['subject']:20s}  action={r['action']}")

    if not matched_rules:
        log.warning("  [DONE] Không đủ căn cứ để match rule")
        return {
            "query":             query,
            "decomposed_queries": decomposed_queries,
            "retrieved_chunks":  chunks,
            "matched_rules":     [],
            "extracted_rule_ids": [],
            "applied_rule_ids":   [],
            "llm_prompt":        "",
            "llm_raw":           "",
            "facts_json":        [],
            "asp_facts":         "",
            "reasoning_results": [],
            "final_answer":      _INSUFFICIENT_INFO_MESSAGE,
            "complete_answer":   _INSUFFICIENT_INFO_MESSAGE,
            "answer_status":     "insufficient_info",
        }

    # 2. Build prompt
    log.info("[STEP 2] Building LLM extraction prompt ...")
    prompt = build_extraction_prompt(query, matched_rules, chunks)
    log.debug(f"  PROMPT:\n{'-'*40}\n{prompt}\n{'-'*40}")

    # 3. Call local LLM
    log.info("[STEP 3] Calling local LLM (localhost:8000) ...")
    llm_raw = call_llm(prompt)
    log.debug(f"  LLM RAW OUTPUT:\n{'-'*40}\n{llm_raw}\n{'-'*40}")
    if not llm_raw:
        log.error("  [FAIL] LLM trả về rỗng")
        return {
            "query":             query,
            "decomposed_queries": decomposed_queries,
            "retrieved_chunks":  chunks,
            "matched_rules":     matched_rules,
            "extracted_rule_ids": [rule["rule_id"] for rule in matched_rules],
            "applied_rule_ids":   [],
            "llm_prompt":        prompt,
            "llm_raw":           "",
            "facts_json":        [],
            "asp_facts":         "",
            "reasoning_results": [],
            "error": "LLM không trả về kết quả — kiểm tra server trên cổng 8000.",
        }

    # 4. Parse facts
    log.info("[STEP 4] Parsing JSON facts from LLM output ...")
    try:
        llm_selected_rule_ids = _extract_llm_matched_rule_ids(llm_raw)
        if llm_selected_rule_ids:
            log.info(f"  → LLM matched_rule_ids: {llm_selected_rule_ids}")

        facts_json = parse_llm_facts(llm_raw)
        corrected_facts_json = _override_subject_type_from_query(query, facts_json)
        corrected_subjects = [
            f.get("args", [None, None])[1]
            for f in corrected_facts_json
            if isinstance(f, dict) and f.get("predicate") in {"case_subject_type", "driver_type", "subject_type"}
        ]
        original_subjects = [
            f.get("args", [None, None])[1]
            for f in facts_json
            if isinstance(f, dict) and f.get("predicate") in {"case_subject_type", "driver_type", "subject_type"}
        ]
        if corrected_subjects != original_subjects:
            log.info(f"  → corrected subject_type from {original_subjects} to {corrected_subjects} based on query keywords")
        facts_json = corrected_facts_json

        coerced_pair_facts_json, pair_corrections = _enforce_subject_action_pairs_from_matched_rules(query, facts_json, matched_rules)
        if pair_corrections:
            for correction in pair_corrections:
                log.info(
                    "  → corrected action for entity=%s subject=%s: %s -> %s (rule=%s)",
                    correction["entity"],
                    correction["subject"],
                    correction["old_action"],
                    correction["new_action"],
                    correction["rule_id"],
                )
        facts_json = coerced_pair_facts_json

        selected_rule_grounded_facts_json = _strip_action_facts_not_in_selected_rules(
            matched_rules,
            facts_json,
            set(llm_selected_rule_ids) if llm_selected_rule_ids else None,
        )
        if len(selected_rule_grounded_facts_json) != len(facts_json):
            log.info("  → removed case_action facts that are outside LLM-selected matched_rule_ids")
        facts_json = selected_rule_grounded_facts_json

        filtered_facts_json = _strip_unsupported_exception_facts(
            matched_rules,
            facts_json,
            set(llm_selected_rule_ids) if llm_selected_rule_ids else None,
        )
        if len(filtered_facts_json) != len(facts_json):
            log.info("  → removed unsupported case_exception facts that do not match exceptions of selected rules")
        facts_json = filtered_facts_json

        grounded_facts_json = _strip_exception_facts_if_not_mentioned_in_query(query, facts_json)
        if len(grounded_facts_json) != len(facts_json):
            log.info("  → removed case_exception facts because query does not mention exception/exemption/priority")
        facts_json = grounded_facts_json

        facts_json, added_priority_emergency_exception = _append_priority_vehicle_emergency_exception(
            query,
            matched_rules,
            facts_json,
            set(llm_selected_rule_ids) if llm_selected_rule_ids else None,
        )
        if added_priority_emergency_exception:
            log.info("  -> added case_exception priority_vehicle_on_emergency_duty from rule-based post-processing")

        log.info(f"  → {len(facts_json)} facts parsed")
        log.debug(f"  FACTS JSON: {json.dumps(facts_json, ensure_ascii=False)}")
    except (json.JSONDecodeError, ValueError) as e:
        log.error(f"  [FAIL] Parse error: {e}")
        log.error(f"  LLM raw was: {repr(llm_raw[:500])}")
        return {
            "query":             query,
            "decomposed_queries": decomposed_queries,
            "retrieved_chunks":  chunks,
            "matched_rules":     matched_rules,
            "extracted_rule_ids": [rule["rule_id"] for rule in matched_rules],
            "applied_rule_ids":   [],
            "llm_prompt":        prompt,
            "llm_raw":           llm_raw,
            "facts_json":        [],
            "asp_facts":         "",
            "reasoning_results": [],
            "error": f"Lỗi parse JSON từ LLM: {e}",
        }

    # 5. Convert to ASP
    log.info("[STEP 5] Converting facts to ASP predicates ...")
    asp_facts = facts_to_asp(facts_json)
    log.debug(f"  ASP FACTS:\n{asp_facts}")

    # 6. Run clingo
    log.info("[STEP 6] Running clingo reasoning ...")
    try:
        reasoning_results = run_asp_reasoning(asp_facts, matched_rules)
        deduped_reasoning_results = _deduplicate_sub_rules_within_same_point(query, matched_rules, facts_json, reasoning_results)
        if len(deduped_reasoning_results) != len(reasoning_results):
            log.info("  → removed duplicated sub-rules within the same legal point")
            removed = sorted(set(reasoning_results) - set(deduped_reasoning_results))
            for atom in removed:
                log.debug(f"    removed: {atom}")
        reasoning_results = deduped_reasoning_results
        error = None
        log.info(f"  → {len(reasoning_results)} result atoms")
        for atom in reasoning_results:
            log.debug(f"    {atom}")
    except Exception as e:
        reasoning_results = []
        error = str(e)
        log.error(f"  [FAIL] Clingo error: {e}")

    result = {
        "query":             query,
        "decomposed_queries": decomposed_queries,
        "retrieved_chunks":  chunks,
        "matched_rules":     matched_rules,
        "extracted_rule_ids": llm_selected_rule_ids or [rule["rule_id"] for rule in matched_rules],
        "applied_rule_ids":   _extract_applied_rule_ids(matched_rules, facts_json, reasoning_results),
        "llm_prompt":        prompt,
        "llm_raw":           llm_raw,
        "facts_json":        facts_json,
        "asp_facts":         asp_facts,
        "reasoning_results": reasoning_results,
        "complete_answer":   _build_complete_answer(matched_rules, facts_json, reasoning_results),
    }
    final_answer = _build_final_answer(matched_rules, facts_json, reasoning_results)
    if final_answer:
        result["final_answer"] = final_answer
        result["answer_status"] = "exception" if final_answer == _EXCEPTION_MESSAGE else "insufficient_info"
    elif reasoning_results:
        result["answer_status"] = "violation"
    if error:
        result["error"] = error
    log.info("[DONE] Pipeline hoàn thành" + (f" — có lỗi: {error}" if error else ""))
    log.info(f"Log file: {_LOG_FILE}")
    return result


# ── CLI ──────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="ASP legal reasoning pipeline.")
    parser.add_argument("--query", required=True)
    parser.add_argument("--top_k", type=int, default=5)
    parser.add_argument("--verbose", action="store_true",
                        help="Print intermediate steps (matched rules, prompt, facts).")
    args = parser.parse_args()

    result = run_asp_pipeline(args.query, args.top_k)

    if args.verbose:
        print("\n=== MATCHED ASP RULES ===")
        for r in result["matched_rules"]:
            ctx = ", ".join(r["context"]) or "—"
            print(f"  {r['rule_id']:25s}  subject={r['subject']:20s}  action={r['action']}")
            if r["context"]:
                print(f"  {'':25s}  context={ctx}")

        print("\n=== LLM PROMPT ===")
        print(result["llm_prompt"])

        print("\n=== LLM RAW OUTPUT ===")
        print(result.get("llm_raw", ""))

        print("\n=== ASP FACTS GENERATED ===")
        print(result.get("asp_facts", ""))

    if "error" in result:
        print(f"\n[ERROR] {result['error']}", file=sys.stderr)
        sys.exit(1)

    print("\n=== KẾT QUẢ REASONING (clingo) ===")
    if result["reasoning_results"]:
        for atom in result["reasoning_results"]:
            # result(rule_id, fine_min, fine_max)
            m = re.match(r'result\((\w+),(\d+),(\d+)\)', atom)
            if m:
                rid, fmin, fmax = m.group(1), int(m.group(2)), int(m.group(3))
                print(f"  Vi phạm: {rid}  →  phạt {fmin:,}đ – {fmax:,}đ")
            else:
                print(f"  {atom}")
    else:
        print("  (Không có vi phạm nào được xác định)")

    print("\n=== ASP FACTS ===")
    print(result["asp_facts"])
