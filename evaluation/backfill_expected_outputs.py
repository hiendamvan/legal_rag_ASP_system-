import argparse
import json
import re
from pathlib import Path


def load_json(path: Path):
    with path.open("r", encoding="utf-8") as file:
        return json.load(file)


def write_json(path: Path, payload) -> None:
    with path.open("w", encoding="utf-8") as file:
        json.dump(payload, file, ensure_ascii=False, indent=2)


def write_jsonl(path: Path, records: list[dict]) -> None:
    with path.open("w", encoding="utf-8") as file:
        for record in records:
            file.write(json.dumps(record, ensure_ascii=False) + "\n")


def unique_preserve_order(values: list[str]) -> list[str]:
    seen = set()
    output = []
    for value in values:
        if not value or value in seen:
            continue
        seen.add(value)
        output.append(value)
    return output


def extract_rule_ids_from_related_rule(sample: dict) -> list[str]:
    related_rule = sample.get("related_rule", [])
    if not isinstance(related_rule, list):
        return []

    rule_ids = []
    for item in related_rule:
        if not isinstance(item, str):
            continue
        match = re.match(r"\s*rule\(([^)]+)\)\.", item)
        if match:
            rule_ids.append(match.group(1).strip())
    return unique_preserve_order(rule_ids)


def infer_rule_ids_from_facts_and_rules(facts: list, matched_rules: list) -> list[str]:
    if not isinstance(facts, list) or not isinstance(matched_rules, list):
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

    inferred_rule_ids = []
    for action in action_order:
        candidates = []
        for rule in matched_rules:
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


def build_expected_output(sample: dict) -> dict:
    expected_output = sample.get("output", {})
    if isinstance(expected_output, dict):
        rule_ids = expected_output.get("rule_id")
        if isinstance(rule_ids, list) and rule_ids:
            return {"rule_id": unique_preserve_order([str(rule_id) for rule_id in rule_ids])}
        if isinstance(rule_ids, str) and rule_ids:
            return {"rule_id": [rule_ids]}

    related_rule_ids = extract_rule_ids_from_related_rule(sample)
    if related_rule_ids:
        return {"rule_id": related_rule_ids}
    return {}


def backfill_records(records: list[dict], samples_by_id: dict[str, dict]) -> int:
    updated_count = 0
    for record in records:
        sample = samples_by_id.get(str(record.get("id")))
        if not sample:
            continue

        new_expected_output = build_expected_output(sample)
        new_rule_id_extracted = infer_rule_ids_from_facts_and_rules(
            record.get("facts_extracted", []),
            record.get("matched_rules", []),
        )

        record_updated = False
        if record.get("expected_output") != new_expected_output:
            record["expected_output"] = new_expected_output
            record_updated = True

        if record.get("rule_id_extracted") != new_rule_id_extracted:
            record["rule_id_extracted"] = new_rule_id_extracted
            record_updated = True

        if record_updated:
            updated_count += 1
    return updated_count


def main() -> None:
    parser = argparse.ArgumentParser(description="Backfill expected_output.rule_id in evaluation run files from test2.json")
    parser.add_argument("run_dir", type=Path, help="Run directory containing results.json")
    parser.add_argument("--dataset", type=Path, required=True, help="Dataset JSON file, e.g. evaluation/test2.json")
    args = parser.parse_args()

    run_dir = args.run_dir.resolve()
    dataset = load_json(args.dataset.resolve())
    if not isinstance(dataset, list):
        raise ValueError("Dataset must be a JSON array")

    samples_by_id = {
        str(sample.get("id")): sample for sample in dataset if isinstance(sample, dict) and sample.get("id") is not None
    }

    results_path = run_dir / "results.json"
    results = load_json(results_path)
    if not isinstance(results, list):
        raise ValueError("results.json must be a JSON array")

    updated_count = backfill_records(results, samples_by_id)
    write_json(results_path, results)

    results_jsonl_path = run_dir / "results.jsonl"
    if results_jsonl_path.exists():
        write_jsonl(results_jsonl_path, results)

    partial_results_path = run_dir / "results.partial.json"
    if partial_results_path.exists():
        write_json(partial_results_path, results)

    print(json.dumps({"updated_records": updated_count, "run_dir": str(run_dir)}, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()