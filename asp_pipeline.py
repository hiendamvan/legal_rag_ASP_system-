"""
asp_pipeline.py — ASP-based legal reasoning pipeline.

Pipeline:
    1. Retrieve relevant chunks from ChromaDB  (reuses retrieve.py)
    2. Match chunks to ASP rules in nd168_kb.lp
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
from pathlib import Path

from retrieve import retrieve
from legal_knowlegde.asp_rule_loader import load_rules, match_chunk_to_rules
from model.call_llm import call_llm

_KB_DIR       = Path(__file__).parent / "legal_knowlegde"
_KB_LP        = str(_KB_DIR / "nd168_kb.lp")
_REASONING_LP = str(_KB_DIR / "reasoning.lp")
_LOG_FILE     = Path(__file__).parent / "pipeline_debug.log"

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


# ── Step 1: Retrieve + match ────────────────────────────────────────────────

def retrieve_and_match(query: str, top_k: int = 10) -> tuple[list[dict], list[dict]]:
    """Return (retrieved_chunks, deduplicated_matched_asp_rules)."""
    chunks    = retrieve(query, top_k)
    all_rules = load_rules()

    seen: set[str] = set()
    matched_rules: list[dict] = []
    for chunk in chunks:
        for rule in match_chunk_to_rules(chunk["metadata"], all_rules):
            if rule["rule_id"] not in seen:
                seen.add(rule["rule_id"])
                matched_rules.append(rule)

    return chunks, matched_rules


# ── Step 2: Build LLM prompt ────────────────────────────────────────────────

def build_extraction_prompt(query: str, rules: list[dict]) -> str:
    rules_json = json.dumps(
        [
            {
                "rule_id": r["rule_id"],
                "subject": r["subject"],
                "action":  r["action"],
                "context": r["context"],
                **({"exception": r["exception_ref"]} if r["exception_ref"] else {}),
            }
            for r in rules
        ],
        ensure_ascii=False,
        indent=1,
    )

    # Build a concrete example from the first matched rule so the LLM
    # sees exactly which values to copy and which key names to use.
    ex = rules[0] if rules else {}
    ex_subject = ex.get("subject", "pedestrian")
    ex_action  = ex.get("action",  "cross_road_at_improper_location")
    ex_ctx     = ex.get("context", [])
    ex_ctx_line = (
        f'    {{"predicate": "case_context", "args": ["user1", "{ex_ctx[0]}"]}}\n'
        if ex_ctx else ""
    )

    return (
        "Bạn là hệ thống trích xuất legal case facts. Chỉ trả về JSON, không giải thích.\n\n"
        f"Câu hỏi:\n{query}\n\n"
        f"Các rule liên quan:\n{rules_json}\n\n"
        "Yêu cầu output — chỉ JSON object duy nhất, KHÔNG có text ngoài JSON:\n"
        "{\n"
        '  "facts": [\n'
        f'    {{"predicate": "case_subject_type", "args": ["user1", "{ex_subject}"]}},\n'
        f'    {{"predicate": "case_action",       "args": ["user1", "{ex_action}"]}}'
        + (f',\n{ex_ctx_line}' if ex_ctx_line else '\n') +
        "  ]\n"
        "}\n\n"
        "Quy tắc BẮT BUỘC:\n"
        '1. Mỗi fact PHẢI có đúng 2 key: "predicate" và "args"\n'
        '2. "args" PHẢI là mảng 2 phần tử: ["user1", "<giá trị>"]\n'
        '3. TUYỆT ĐỐI không dùng key "value", "answer", "question", "type"\n'
        "4. Lấy giá trị subject/action/context NGUYÊN VĂN từ các rule trên\n"
        "5. Chỉ thêm case_context nếu rule có context\n"
        "6. Chỉ thêm case_exception nếu có exception áp dụng\n"
        "7. Chỉ xuất duy nhất JSON object, không thêm gì khác"
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
        log.warning("  [FAIL] Không tìm thấy ASP rule phù hợp")
        return {
            "query":             query,
            "retrieved_chunks":  [],
            "matched_rules":     [],
            "llm_prompt":        "",
            "llm_raw":           "",
            "facts_json":        [],
            "asp_facts":         "",
            "reasoning_results": [],
            "error": (
                "Không tìm thấy ASP rule phù hợp với các điều khoản được retrieve.\n"
                "Kiểm tra lại nd168_kb.lp hoặc tăng top_k."
            ),
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
            "retrieved_chunks":  chunks,
            "matched_rules":     matched_rules,
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
        log.info(f"  → {len(facts_json)} facts parsed")
        log.debug(f"  FACTS JSON: {json.dumps(facts_json, ensure_ascii=False)}")
    except (json.JSONDecodeError, ValueError) as e:
        log.error(f"  [FAIL] Parse error: {e}")
        log.error(f"  LLM raw was: {repr(llm_raw[:500])}")
        return {
            "query":             query,
            "retrieved_chunks":  chunks,
            "matched_rules":     matched_rules,
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
        "retrieved_chunks":  chunks,
        "matched_rules":     matched_rules,
        "llm_prompt":        prompt,
        "llm_raw":           llm_raw,
        "facts_json":        facts_json,
        "asp_facts":         asp_facts,
        "reasoning_results": reasoning_results,
    }
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
