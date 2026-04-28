import argparse
import json
import sys
from collections import defaultdict
from pathlib import Path
import re


PROJECT_ROOT = Path(__file__).resolve().parent.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from legal_knowlegde.asp_rule_loader import load_rules  # noqa: E402


PREDICATE_ALIASES = {
    "case_subject_type": "case_subject_type",
    "driver_type": "case_subject_type",
    "subject": "case_subject_type",
    "case_action": "case_action",
    "did_action": "case_action",
    "action": "case_action",
    "case_context": "case_context",
    "has_context": "case_context",
    "context": "case_context",
    "case_exception": "case_exception",
    "exception_applies": "case_exception",
    "exception": "case_exception",
}


def unique_preserve_order(values: list[str]) -> list[str]:
    seen = set()
    output = []
    for value in values:
        if not value or value in seen:
            continue
        seen.add(value)
        output.append(value)
    return output


def normalize_point(value: str | None) -> str:
    if value is None:
        return ""
    text = str(value).strip().lower().strip(").,;: ")
    if text in {"đ", "dd"}:
        return "dd"
    return text


def normalize_fact(fact) -> tuple[str, tuple[str, ...]] | None:
    if isinstance(fact, str):
        match = re.fullmatch(r"\s*([a-zA-Z_][\w]*)\((.*)\)\.?\s*", fact)
        if not match:
            return None
        predicate = PREDICATE_ALIASES.get(match.group(1), match.group(1))
        args = [part.strip().strip('"') for part in match.group(2).split(",")]
    elif isinstance(fact, dict):
        predicate = PREDICATE_ALIASES.get(str(fact.get("predicate") or fact.get("type") or ""), "")
        args = fact.get("args")
        if not isinstance(args, list):
            value = fact.get("value")
            args = ["_", value] if value is not None else []
    else:
        return None

    if not predicate or not args:
        return None

    normalized_args: list[str] = []
    for index, arg in enumerate(args):
        text = str(arg).strip()
        if index == 0 and len(args) >= 2:
            normalized_args.append("_")
        else:
            normalized_args.append(text)
    return predicate, tuple(normalized_args)


def normalize_fact_list(facts) -> set[tuple[str, tuple[str, ...]]]:
    if not isinstance(facts, list):
        return set()
    normalized = set()
    for fact in facts:
        normalized_fact = normalize_fact(fact)
        if normalized_fact is not None:
            normalized.add(normalized_fact)
    return normalized


def infer_rule_ids_from_sample(sample: dict) -> list[str]:
    expected_output = sample.get("output", {})
    if not isinstance(expected_output, dict):
        return []

    facts = expected_output.get("facts", [])
    if not isinstance(facts, list):
        return []

    subject_type = None
    action_order = []
    case_contexts = set()
    case_exceptions = set()

    for fact in facts:
        if not isinstance(fact, dict):
            continue
        args = fact.get("args", [])
        if not isinstance(args, list) or len(args) != 2:
            continue
        predicate = fact.get("predicate")
        value = args[1]
        if predicate == "case_subject_type":
            subject_type = value
        elif predicate == "case_action":
            action_order.append(value)
        elif predicate == "case_context":
            case_contexts.add(value)
        elif predicate == "case_exception":
            case_exceptions.add(value)

    retrieved_rules = sample.get("input", {}).get("retrieved_rules", [])
    if not isinstance(retrieved_rules, list):
        return []

    inferred_rule_ids = []
    for action in action_order:
        candidates = []
        for rule in retrieved_rules:
            if not isinstance(rule, dict):
                continue
            if rule.get("action") != action:
                continue

            rule_subject = rule.get("subject")
            if subject_type and rule_subject and rule_subject != subject_type:
                continue

            rule_context = set(rule.get("context") or [])
            rule_exception = set(rule.get("exception") or rule.get("exception_ref") or [])
            if rule_context and not rule_context.issubset(case_contexts):
                continue
            if rule_exception and not rule_exception.issubset(case_exceptions):
                continue

            specificity = len(rule_context) + len(rule_exception)
            candidates.append((specificity, rule.get("rule_id")))

        if not candidates:
            continue

        max_specificity = max(item[0] for item in candidates)
        for specificity, rule_id in candidates:
            if specificity == max_specificity and rule_id:
                inferred_rule_ids.append(rule_id)

    return unique_preserve_order(inferred_rule_ids)


def parse_rule_id_fallback(rule_id: str) -> tuple[int, int, str] | None:
    match = re.match(r"d(\d+)_k(\d+)(?:_([a-z]+))?", rule_id)
    if not match:
        return None
    article = int(match.group(1))
    clause = int(match.group(2))
    point = normalize_point(match.group(3) or "")
    return article, clause, point


def rule_id_to_reference(rule_id: str, rules: dict[str, dict]) -> tuple[int, int, str] | None:
    rule = rules.get(rule_id)
    if rule:
        return int(rule.get("article") or 0), int(rule.get("clause") or 0), normalize_point(rule.get("point"))
    return parse_rule_id_fallback(rule_id)


def get_rule_ids_from_record(record: dict, sample_by_id: dict[str, dict]) -> list[str]:
    expected_output = record.get("expected_output", {})
    if isinstance(expected_output, dict):
        rule_ids = expected_output.get("rule_id")
        if isinstance(rule_ids, list) and rule_ids:
            return unique_preserve_order([str(rule_id) for rule_id in rule_ids])
        if isinstance(rule_ids, str) and rule_ids:
            return [rule_ids]

    sample = sample_by_id.get(str(record.get("id")))
    if not sample:
        return []

    output = sample.get("output", {})
    if isinstance(output, dict):
        rule_ids = output.get("rule_id")
        if isinstance(rule_ids, list) and rule_ids:
            return unique_preserve_order([str(rule_id) for rule_id in rule_ids])
        if isinstance(rule_ids, str) and rule_ids:
            return [rule_ids]

    return infer_rule_ids_from_sample(sample)


def chunk_matches_reference(chunk_metadata: dict, reference: tuple[int, int, str]) -> bool:
    article, clause, point = reference
    chunk_article = int(chunk_metadata.get("dieu_num") or 0)
    chunk_clause = int(chunk_metadata.get("khoan_num") or 0)
    chunk_point = normalize_point(chunk_metadata.get("diem") or "")

    if chunk_article != article:
        return False
    if clause and chunk_clause != clause:
        return False
    if not point:
        return True
    return chunk_point in {"", point}


def extract_gold_references(rule_ids: list[str], rules: dict[str, dict]) -> list[tuple[int, int, str]]:
    references = []
    for rule_id in rule_ids:
        reference = rule_id_to_reference(rule_id, rules)
        if reference is not None and reference[0] and reference[1]:
            references.append(reference)
    return list(dict.fromkeys(references))


def extract_gold_articles(references: list[tuple[int, int, str]]) -> set[int]:
    return {article for article, _, _ in references if article}


def extract_citations(text: str) -> set[tuple[int, int, str]]:
    if not text:
        return set()

    normalized = re.sub(r"\s+", " ", text.lower())
    citations: set[tuple[int, int, str]] = set()

    patterns = [
        re.compile(r"điểm\s+([a-zđ])\s*,?\s*khoản\s+(\d+)\s*,?\s*điều\s+(\d+)"),
        re.compile(r"khoản\s+(\d+)\s*,?\s*điều\s+(\d+)\s*,?\s*điểm\s+([a-zđ])"),
        re.compile(r"điều\s+(\d+)\s*,?\s*khoản\s+(\d+)\s*,?\s*điểm\s+([a-zđ])"),
        re.compile(r"điều\s+(\d+)\s*,?\s*khoản\s+(\d+)"),
        re.compile(r"khoản\s+(\d+)\s*,?\s*điều\s+(\d+)"),
        re.compile(r"điều\s+(\d+)"),
    ]

    for pattern in patterns:
        for match in pattern.finditer(normalized):
            groups = match.groups()
            if len(groups) == 3:
                if pattern.pattern.startswith("điểm"):
                    point, clause, article = groups
                elif pattern.pattern.startswith("khoản"):
                    clause, article, point = groups
                else:
                    article, clause, point = groups
                citations.add((int(article), int(clause), normalize_point(point)))
            elif len(groups) == 2:
                if pattern.pattern.startswith("điều"):
                    article, clause = groups
                else:
                    clause, article = groups
                citations.add((int(article), int(clause), ""))
            else:
                citations.add((int(groups[0]), 0, ""))

    return citations


def citation_matches_gold(citation: tuple[int, int, str], gold_references: list[tuple[int, int, str]]) -> bool:
    article, clause, point = citation
    for gold_article, gold_clause, gold_point in gold_references:
        if article != gold_article:
            continue
        if clause == 0:
            return True
        if clause != gold_clause:
            continue
        if not point or not gold_point:
            return True
        if point == gold_point:
            return True
    return False


def safe_divide(numerator: float, denominator: float) -> float:
    if not denominator:
        return 0.0
    return numerator / denominator


def round_metrics(payload: dict) -> dict:
    rounded = {}
    for key, value in payload.items():
        if isinstance(value, float):
            rounded[key] = round(value, 4)
        elif isinstance(value, dict):
            rounded[key] = round_metrics(value)
        else:
            rounded[key] = value
    return rounded


def compute_metrics(records: list[dict], sample_by_id: dict[str, dict], rules: dict[str, dict], ks: list[int]) -> tuple[dict, list[dict]]:
    overall = {
        "sample_count": 0,
        "error_count": 0,
        "retriever_total": 0,
        "retriever_hits": {k: 0 for k in ks},
        "parser_exact_match": 0,
        "parser_tp": 0,
        "parser_fp": 0,
        "parser_fn": 0,
        "citation_total": 0,
        "citation_with_any": 0,
        "citation_article_hit": 0,
        "citation_reference_hit": 0,
        "citation_tp": 0,
        "citation_predicted_total": 0,
    }
    by_question_type = defaultdict(
        lambda: {
            "sample_count": 0,
            "retriever_total": 0,
            "retriever_hits": {k: 0 for k in ks},
            "parser_exact_match": 0,
            "parser_tp": 0,
            "parser_fp": 0,
            "parser_fn": 0,
            "citation_total": 0,
            "citation_with_any": 0,
            "citation_article_hit": 0,
            "citation_reference_hit": 0,
            "citation_tp": 0,
            "citation_predicted_total": 0,
        }
    )
    per_sample = []

    for record in records:
        question_type = str(record.get("question_type") or "unknown")
        counters = by_question_type[question_type]
        overall["sample_count"] += 1
        counters["sample_count"] += 1
        if record.get("error"):
            overall["error_count"] += 1

        gold_rule_ids = get_rule_ids_from_record(record, sample_by_id)
        gold_references = extract_gold_references(gold_rule_ids, rules)
        gold_articles = extract_gold_articles(gold_references)

        retrieved_chunks = record.get("retrieved_chunks")
        retrieved_chunks = retrieved_chunks if isinstance(retrieved_chunks, list) else []
        hit_at_k = {}
        if gold_references:
            overall["retriever_total"] += 1
            counters["retriever_total"] += 1
            for k in ks:
                top_chunks = retrieved_chunks[:k]
                hit = any(
                    isinstance(chunk, dict)
                    and isinstance(chunk.get("metadata"), dict)
                    and any(chunk_matches_reference(chunk["metadata"], reference) for reference in gold_references)
                    for chunk in top_chunks
                )
                hit_at_k[f"hit@{k}"] = hit
                if hit:
                    overall["retriever_hits"][k] += 1
                    counters["retriever_hits"][k] += 1
        else:
            for k in ks:
                hit_at_k[f"hit@{k}"] = False

        gold_facts = normalize_fact_list(record.get("expected_output", {}).get("facts", []))
        predicted_facts = normalize_fact_list(record.get("facts_extracted", []))
        parser_tp = len(predicted_facts & gold_facts)
        parser_fp = len(predicted_facts - gold_facts)
        parser_fn = len(gold_facts - predicted_facts)
        parser_exact = predicted_facts == gold_facts

        overall["parser_tp"] += parser_tp
        overall["parser_fp"] += parser_fp
        overall["parser_fn"] += parser_fn
        counters["parser_tp"] += parser_tp
        counters["parser_fp"] += parser_fp
        counters["parser_fn"] += parser_fn
        if parser_exact:
            overall["parser_exact_match"] += 1
            counters["parser_exact_match"] += 1

        citations = extract_citations(str(record.get("predicted_text_answer") or ""))
        article_hit = bool(gold_articles and any(article == gold_article for article, _, _ in citations for gold_article in gold_articles))
        reference_hit = bool(gold_references and any(citation_matches_gold(citation, gold_references) for citation in citations))
        citation_tp = sum(1 for citation in citations if citation_matches_gold(citation, gold_references))

        overall["citation_total"] += 1
        counters["citation_total"] += 1
        if citations:
            overall["citation_with_any"] += 1
            counters["citation_with_any"] += 1
        if article_hit:
            overall["citation_article_hit"] += 1
            counters["citation_article_hit"] += 1
        if reference_hit:
            overall["citation_reference_hit"] += 1
            counters["citation_reference_hit"] += 1
        overall["citation_tp"] += citation_tp
        counters["citation_tp"] += citation_tp
        overall["citation_predicted_total"] += len(citations)
        counters["citation_predicted_total"] += len(citations)

        per_sample.append(
            {
                "id": record.get("id"),
                "question_type": question_type,
                "gold_rule_ids": gold_rule_ids,
                "gold_references": [
                    {"article": article, "clause": clause, "point": point}
                    for article, clause, point in gold_references
                ],
                **hit_at_k,
                "parser_exact_match": parser_exact,
                "parser_tp": parser_tp,
                "parser_fp": parser_fp,
                "parser_fn": parser_fn,
                "citations_found": [
                    {"article": article, "clause": clause, "point": point}
                    for article, clause, point in sorted(citations)
                ],
                "citation_article_hit": article_hit,
                "citation_reference_hit": reference_hit,
            }
        )

    summary = {
        "overall": finalize_metric_block(overall, ks),
        "by_question_type": {
            question_type: finalize_metric_block(counters, ks)
            for question_type, counters in sorted(by_question_type.items())
        },
    }
    return round_metrics(summary), per_sample


def finalize_metric_block(counters: dict, ks: list[int]) -> dict:
    parser_precision = safe_divide(counters["parser_tp"], counters["parser_tp"] + counters["parser_fp"])
    parser_recall = safe_divide(counters["parser_tp"], counters["parser_tp"] + counters["parser_fn"])
    parser_f1 = safe_divide(2 * parser_precision * parser_recall, parser_precision + parser_recall)

    citation_precision = safe_divide(counters["citation_tp"], counters["citation_predicted_total"])

    return {
        "sample_count": counters["sample_count"],
        "error_count": counters.get("error_count", 0),
        "retriever": {
            **{f"hit@{k}": safe_divide(counters["retriever_hits"][k], counters["retriever_total"]) for k in ks},
            "evaluated_samples": counters["retriever_total"],
        },
        "parser": {
            "exact_match_accuracy": safe_divide(counters["parser_exact_match"], counters["sample_count"]),
            "fact_precision": parser_precision,
            "fact_recall": parser_recall,
            "fact_f1": parser_f1,
            "tp": counters["parser_tp"],
            "fp": counters["parser_fp"],
            "fn": counters["parser_fn"],
        },
        "citation": {
            "citation_presence_rate": safe_divide(counters["citation_with_any"], counters["citation_total"]),
            "article_hit_accuracy": safe_divide(counters["citation_article_hit"], counters["citation_total"]),
            "reference_hit_accuracy": safe_divide(counters["citation_reference_hit"], counters["citation_total"]),
            "citation_precision": citation_precision,
            "evaluated_samples": counters["citation_total"],
            "predicted_citation_count": counters["citation_predicted_total"],
        },
    }


def load_json(file_path: Path):
    with file_path.open("r", encoding="utf-8") as file:
        return json.load(file)


def write_json(file_path: Path, payload) -> None:
    file_path.parent.mkdir(parents=True, exist_ok=True)
    with file_path.open("w", encoding="utf-8") as file:
        json.dump(payload, file, ensure_ascii=False, indent=2)


def write_jsonl(file_path: Path, rows: list[dict]) -> None:
    file_path.parent.mkdir(parents=True, exist_ok=True)
    with file_path.open("w", encoding="utf-8") as file:
        for row in rows:
            file.write(json.dumps(row, ensure_ascii=False) + "\n")


def resolve_paths(args: argparse.Namespace) -> tuple[Path, Path, Path, Path]:
    run_dir = args.run_dir.resolve()
    results_path = (run_dir / "results.json").resolve()
    summary_path = (run_dir / "summary.json").resolve()

    if args.dataset:
        dataset_path = args.dataset.resolve()
    elif summary_path.exists():
        summary = load_json(summary_path)
        dataset_value = summary.get("input_file")
        dataset_path = Path(dataset_value).resolve() if dataset_value else (PROJECT_ROOT / "public_dataset" / "test.json")
    else:
        dataset_path = (PROJECT_ROOT / "public_dataset" / "test.json").resolve()

    output_path = args.output.resolve() if args.output else (run_dir / "metrics_summary.json").resolve()
    return run_dir, results_path, dataset_path, output_path


def build_sample_index(dataset: list[dict]) -> dict[str, dict]:
    return {str(sample.get("id")): sample for sample in dataset if isinstance(sample, dict) and sample.get("id")}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Score retrieval, parser, and citation metrics from an evaluation run.")
    parser.add_argument("run_dir", type=Path, help="Directory containing results.json and summary.json")
    parser.add_argument(
        "--dataset",
        type=Path,
        default=None,
        help="Optional dataset path. Defaults to summary.json input_file or public_dataset/test.json",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Optional output JSON path. Defaults to <run_dir>/metrics_summary.json",
    )
    parser.add_argument(
        "--details-output",
        type=Path,
        default=None,
        help="Optional per-sample JSONL output. Defaults to <run_dir>/metrics_details.jsonl",
    )
    parser.add_argument(
        "--ks",
        nargs="+",
        type=int,
        default=[1, 3, 5, 10],
        help="Hit@k values to compute",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    run_dir, results_path, dataset_path, output_path = resolve_paths(args)
    details_output = args.details_output.resolve() if args.details_output else (run_dir / "metrics_details.jsonl").resolve()
    ks = sorted({k for k in args.ks if k > 0})

    records = load_json(results_path)
    dataset = load_json(dataset_path)
    if not isinstance(records, list):
        raise ValueError(f"Expected a JSON array in {results_path}")
    if not isinstance(dataset, list):
        raise ValueError(f"Expected a JSON array in {dataset_path}")

    sample_by_id = build_sample_index(dataset)
    rules = load_rules()

    summary, details = compute_metrics(records, sample_by_id, rules, ks)
    summary["run_dir"] = str(run_dir)
    summary["results_path"] = str(results_path)
    summary["dataset_path"] = str(dataset_path)

    write_json(output_path, summary)
    write_jsonl(details_output, details)

    print(json.dumps(summary, ensure_ascii=False, indent=2))
    print(f"\nSaved summary to: {output_path}")
    print(f"Saved details to: {details_output}")


if __name__ == "__main__":
    main()