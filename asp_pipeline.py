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


def decompose_query(query: str) -> list[str]:
    compact_query = re.sub(r"\s+", " ", query).strip()
    if not _query_mentions_multiple_violations(compact_query):
        return [compact_query]

    segments = re.split(r"\s*,?\s*(?:vừa|đồng thời|cùng lúc|kèm theo)\s+", compact_query, flags=re.IGNORECASE)
    if len(segments) < 3:
        return [compact_query]

    subject_prefix = segments[0].strip(" ,")
    raw_clauses = segments[1:]
    question_tail = _extract_question_tail(compact_query)

    sub_queries = [compact_query]
    seen: set[str] = {compact_query}
    for clause in raw_clauses:
        cleaned_clause = _strip_question_tail(clause)
        if not cleaned_clause:
            continue
        sub_query = f"{subject_prefix} {cleaned_clause} {question_tail}".strip()
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
        for chunk in retrieve(sub_query, top_k):
            meta = chunk["metadata"]
            chunk_key = (meta.get("breadcrumb", ""), chunk["text"])
            existing = chunk_map.get(chunk_key)
            if existing is None or chunk["score"] > existing["score"]:
                chunk_map[chunk_key] = chunk

    chunks = sorted(chunk_map.values(), key=lambda item: item["score"], reverse=True)

    for chunk in chunks:
        for rule in match_chunk_to_rules(chunk["metadata"], all_rules):
            if rule["rule_id"] not in seen:
                seen.add(rule["rule_id"])
                matched_rules.append(rule)

    return chunks, matched_rules


# ── Step 2: Build LLM prompt ────────────────────────────────────────────────

def _normalize_text(text: str) -> str:
    normalized = unicodedata.normalize("NFD", text.lower())
    normalized = "".join(ch for ch in normalized if unicodedata.category(ch) != "Mn")
    return re.sub(r"\s+", " ", normalized).strip()


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
    ]
    return any(cue in normalized_query for cue in exception_cues)


def _strip_unmentioned_exception_facts(query: str, facts: list[dict]) -> list[dict]:
    if _query_mentions_exception(query):
        return facts

    filtered_facts: list[dict] = []
    for fact in facts:
        if not isinstance(fact, dict):
            filtered_facts.append(fact)
            continue
        if fact.get("predicate") in {"case_exception", "exception_applies", "exception"}:
            continue
        filtered_facts.append(fact)

    return filtered_facts


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
        (["that day an toan", "day dai an toan"], ["seatbelt"], 12),
    ]
    for query_phrases, action_keywords, bonus in action_cue_map:
        if any(phrase in normalized_query for phrase in query_phrases) and any(
            keyword in normalized_action for keyword in action_keywords
        ):
            overlap += bonus

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

    if not guidance_lines:
        return ""
    return "\n".join(guidance_lines) + "\n"

def build_extraction_prompt(query: str, rules: list[dict]) -> str:
    prioritized_rules = _prioritize_rules_for_query(query, rules)
    query_mentions_exception = _query_mentions_exception(query)
    multi_violation_example = _build_multi_violation_example(query, prioritized_rules)
    query_specific_guidance = _build_query_specific_prompt_guidance(query, prioritized_rules)
    subquery_coverage_block = _build_subquery_coverage_block(query, prioritized_rules)
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

    # Prefer a context-bearing rule for the example and only include
    # exception facts when the user explicitly asks about an exception case.
    ex = (
        next((rule for rule in prioritized_rules if rule.get("context")), None)
        or next((rule for rule in prioritized_rules if rule.get("exception_ref")), None)
        or (prioritized_rules[0] if prioritized_rules else {})
    )
    ex_subject = ex.get("subject", "pedestrian")
    ex_action  = ex.get("action",  "cross_road_at_improper_location")
    ex_ctx     = ex.get("context", [])
    ex_exception = ex.get("exception_ref", [])
    ex_ctx_line = (
        f'    {{"predicate": "case_context", "args": ["user1", "{ex_ctx[0]}"]}}\n'
        if ex_ctx else ""
    )
    ex_exception_line = (
        f'    {{"predicate": "case_exception", "args": ["user1", "{ex_exception[0]}"]}}\n'
        if ex_exception and query_mentions_exception else ""
    )
    exception_instruction = (
        "Trong câu hỏi này có nhắc đến ngoại lệ hoặc trường hợp miễn trừ, chỉ khi thật sự khớp mới được xuất case_exception.\n"
        if query_mentions_exception else
        "Trong câu hỏi này KHÔNG có nhắc đến ngoại lệ hoặc trường hợp miễn trừ, vì vậy TUYỆT ĐỐI không được xuất bất kỳ fact case_exception nào.\n"
    )

    return (
        "Bạn là hệ thống trích xuất legal case facts. Chỉ trả về JSON, không giải thích.\n\n"
        f"Câu hỏi:\n{query}\n\n"
        f"Các rule liên quan:\n{rules_json}\n\n"
        f"{subquery_coverage_block}"
        "Yêu cầu output — chỉ JSON object duy nhất, KHÔNG có text ngoài JSON:\n"
        "{\n"
        '  "facts": [\n'
        f'    {{"predicate": "case_subject_type", "args": ["user1", "{ex_subject}"]}},\n'
        + f'    {{"predicate": "case_action",       "args": ["user1", "{ex_action}"]}}'
        + (f',\n{ex_ctx_line.rstrip()}' if ex_ctx_line else '')
        + (f',\n{ex_exception_line.rstrip()}' if ex_exception_line else '\n')
        + "  ]\n"
        "}\n\n"
        "Quy tắc BẮT BUỘC:\n"
        '1. Mỗi fact PHẢI có đúng 2 key: "predicate" và "args"\n'
        '2. "args" PHẢI là mảng 2 phần tử: ["user1", "<giá trị>"]\n'
        '3. TUYỆT ĐỐI không dùng key "value", "answer", "question", "type"\n'
        "4. Lấy giá trị subject/action/context NGUYÊN VĂN từ các rule trên\n"
        "5. Nếu câu hỏi nêu rõ tình huống, điều kiện hoặc hoàn cảnh của rule thì PHẢI thêm case_context tương ứng\n"
        "6. Chỉ được xuất case_exception khi chính câu hỏi người dùng nhắc rõ đến ngoại lệ, trường hợp được miễn trừ, hoặc cụm từ loại trừ như 'trừ', 'ngoại lệ', 'không bị phạt', 'xe ưu tiên', 'khẩn cấp'\n"
        "7. Việc rule có trường exception KHÔNG đồng nghĩa phải xuất case_exception\n"
        "8. Nếu câu hỏi nêu nhiều hành vi vi phạm thì PHẢI xuất đủ nhiều case_action, mỗi hành vi là một fact riêng\n"
        "9. Không được bỏ sót hành vi chỉ vì các hành vi cùng áp dụng cho một chủ thể\n"
        f"10. {exception_instruction}"
        f"{query_specific_guidance}"
        "11. Chỉ xuất duy nhất JSON object, không thêm gì khác\n\n"
        f"{multi_violation_example}"
    )


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


# ── Step 5: Run clingo ───────────────────────────────────────────────────────

def run_asp_reasoning(asp_facts: str) -> list[str]:
    """
    Load KB + reasoning rules as text strings (via ctl.add) to avoid Unicode
    path issues on Windows, then add generated facts and run clingo.
    """
    try:
        import clingo
    except ImportError:
        raise RuntimeError(
            "clingo is not installed. Run:  pip install clingo"
        )

    ctl = clingo.Control()

    # Read file contents and add as strings — never pass Unicode paths to clingo
    for lp_path in [_KB_LP, _REASONING_LP]:
        content = Path(lp_path).read_text(encoding="utf-8")
        content = _normalize_legacy_list_facts(content)
        ctl.add("base", [], content)

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
            "answer_status":     "insufficient_info",
        }

    # 2. Build prompt
    log.info("[STEP 2] Building LLM extraction prompt ...")
    prompt = build_extraction_prompt(query, matched_rules)
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
        facts_json = parse_llm_facts(llm_raw)
        filtered_facts_json = _strip_unmentioned_exception_facts(query, facts_json)
        if len(filtered_facts_json) != len(facts_json):
            log.info("  → removed case_exception facts because the query does not mention an exception")
        facts_json = filtered_facts_json
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
        reasoning_results = run_asp_reasoning(asp_facts)
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
        "extracted_rule_ids": [rule["rule_id"] for rule in matched_rules],
        "applied_rule_ids":   _extract_rule_ids_from_reasoning(reasoning_results),
        "llm_prompt":        prompt,
        "llm_raw":           llm_raw,
        "facts_json":        facts_json,
        "asp_facts":         asp_facts,
        "reasoning_results": reasoning_results,
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
