import argparse
import json
import logging
import re
import sys
from datetime import datetime
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parent.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.append(str(PROJECT_ROOT))

from asp_pipeline import run_asp_pipeline


DEFAULT_INPUT_FILE = PROJECT_ROOT / "public_dataset" / "test.json"
DEFAULT_OUTPUT_ROOT = PROJECT_ROOT / "evaluation" / "batch_logs"


def ensure_serializable(value):
    if isinstance(value, dict):
        return {k: ensure_serializable(v) for k, v in value.items()}
    if isinstance(value, list):
        return [ensure_serializable(item) for item in value]
    return value


def format_currency(amount: int) -> str:
    return f"{amount:,}".replace(",", ".") + " đồng"


def extract_reasoning_results(reasoning_results: list[str]) -> list[dict]:
    penalties = []
    for atom in reasoning_results:
        match = re.match(r"result\(([^,]+),(\d+),(\d+)\)", atom)
        if not match:
            continue
        penalties.append(
            {
                "rule_id": match.group(1),
                "fine_min": int(match.group(2)),
                "fine_max": int(match.group(3)),
            }
        )
    return penalties


def build_text_answer(result: dict) -> str:
    if result.get("error"):
        return f"Lỗi pipeline: {result['error']}"

    penalties = extract_reasoning_results(result.get("reasoning_results", []))
    if penalties:
        if len(penalties) == 1:
            penalty = penalties[0]
            return (
                "Mức phạt áp dụng là từ "
                f"{format_currency(penalty['fine_min'])} đến {format_currency(penalty['fine_max'])}."
            )

        parts = []
        for index, penalty in enumerate(penalties, start=1):
            parts.append(
                f"Hành vi thứ {index} bị phạt từ {format_currency(penalty['fine_min'])} "
                f"đến {format_currency(penalty['fine_max'])}"
            )
        return "; ".join(parts) + "."

    llm_raw = (result.get("llm_raw") or "").strip()
    if llm_raw:
        return llm_raw

    return "Không xác định được vi phạm từ dữ liệu đầu vào."


def setup_logger(log_file: Path) -> logging.Logger:
    logger = logging.getLogger(f"run_test_dataset.{log_file}")
    logger.handlers.clear()
    logger.setLevel(logging.INFO)

    formatter = logging.Formatter("%(asctime)s [%(levelname)s] %(message)s")

    file_handler = logging.FileHandler(log_file, encoding="utf-8")
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)

    stream_handler = logging.StreamHandler(sys.stdout)
    stream_handler.setFormatter(formatter)
    logger.addHandler(stream_handler)

    return logger


def load_dataset(input_file: Path) -> list[dict]:
    with input_file.open("r", encoding="utf-8") as file:
        data = json.load(file)
    if not isinstance(data, list):
        raise ValueError("Expected test dataset to be a JSON array.")
    return data


def build_record(sample: dict, result: dict) -> dict:
    predicted_answer = build_text_answer(result)
    penalties = extract_reasoning_results(result.get("reasoning_results", []))
    return {
        "id": sample.get("id"),
        "level": sample.get("level"),
        "question_type": sample.get("question_type"),
        "instruction": sample.get("instruction"),
        "question": sample.get("input", {}).get("question", ""),
        "expected_output": sample.get("output", {}),
        "expected_text_answer": sample.get("text_answer", ""),
        "retrieved_chunks": ensure_serializable(result.get("retrieved_chunks", [])),
        "matched_rules": ensure_serializable(result.get("matched_rules", [])),
        "facts_extracted": ensure_serializable(result.get("facts_json", [])),
        "asp_facts": result.get("asp_facts", ""),
        "reasoning_results": result.get("reasoning_results", []),
        "penalties": penalties,
        "predicted_text_answer": predicted_answer,
        "llm_raw": result.get("llm_raw", ""),
        "llm_prompt": result.get("llm_prompt", ""),
        "error": result.get("error"),
    }


def write_json(path: Path, payload) -> None:
    with path.open("w", encoding="utf-8") as file:
        json.dump(payload, file, ensure_ascii=False, indent=2)


def write_jsonl(path: Path, records: list[dict]) -> None:
    with path.open("w", encoding="utf-8") as file:
        for record in records:
            file.write(json.dumps(record, ensure_ascii=False) + "\n")


def append_jsonl(path: Path, record: dict) -> None:
    with path.open("a", encoding="utf-8") as file:
        file.write(json.dumps(record, ensure_ascii=False) + "\n")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run the ASP pipeline on every question in public_dataset/test.json and save detailed logs."
    )
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT_FILE)
    parser.add_argument("--output-root", type=Path, default=DEFAULT_OUTPUT_ROOT)
    parser.add_argument("--top-k", type=int, default=10)
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Optional number of questions to run from the start of the dataset.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    input_file = args.input.resolve()
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    output_dir = args.output_root.resolve() / f"test_run_{timestamp}"
    output_dir.mkdir(parents=True, exist_ok=True)

    logger = setup_logger(output_dir / "run.log")
    logger.info("Input file: %s", input_file)
    logger.info("Output directory: %s", output_dir)
    logger.info("top_k=%s", args.top_k)

    dataset = load_dataset(input_file)
    if args.limit is not None:
        dataset = dataset[:args.limit]
    logger.info("Loaded %s questions", len(dataset))

    records = []
    error_count = 0
    results_jsonl_path = output_dir / "results.jsonl"
    partial_results_path = output_dir / "results.partial.json"

    if results_jsonl_path.exists():
        results_jsonl_path.unlink()

    for index, sample in enumerate(dataset, start=1):
        question = sample.get("input", {}).get("question", "").strip()
        sample_id = sample.get("id", f"sample_{index}")
        if not question:
            logger.warning("[%s/%s] %s skipped: missing input.question", index, len(dataset), sample_id)
            records.append(
                {
                    "id": sample_id,
                    "level": sample.get("level"),
                    "question_type": sample.get("question_type"),
                    "instruction": sample.get("instruction"),
                    "question": "",
                    "expected_output": sample.get("output", {}),
                    "expected_text_answer": sample.get("text_answer", ""),
                    "retrieved_chunks": [],
                    "matched_rules": [],
                    "facts_extracted": [],
                    "asp_facts": "",
                    "reasoning_results": [],
                    "penalties": [],
                    "predicted_text_answer": "",
                    "llm_raw": "",
                    "llm_prompt": "",
                    "error": "Missing input.question",
                }
            )
            append_jsonl(results_jsonl_path, records[-1])
            write_json(partial_results_path, records)
            error_count += 1
            continue

        logger.info("[%s/%s] Running %s", index, len(dataset), sample_id)
        logger.info("Question: %s", question)
        result = run_asp_pipeline(question, top_k=args.top_k)
        record = build_record(sample, result)
        records.append(record)
        append_jsonl(results_jsonl_path, record)
        write_json(partial_results_path, records)

        if record.get("error"):
            error_count += 1
            logger.error("[%s] Error: %s", sample_id, record["error"])
        else:
            logger.info(
                "[%s] chunks=%s rules=%s facts=%s penalties=%s",
                sample_id,
                len(record["retrieved_chunks"]),
                len(record["matched_rules"]),
                len(record["facts_extracted"]),
                len(record["penalties"]),
            )

    summary = {
        "input_file": str(input_file),
        "output_dir": str(output_dir),
        "question_count": len(records),
        "error_count": error_count,
        "success_count": len(records) - error_count,
        "top_k": args.top_k,
        "created_at": datetime.now().isoformat(timespec="seconds"),
    }

    write_json(output_dir / "results.json", records)
    write_json(output_dir / "summary.json", summary)

    logger.info("Saved results.json, results.jsonl, results.partial.json, summary.json")
    logger.info("Finished: success=%s error=%s", summary["success_count"], summary["error_count"])


if __name__ == "__main__":
    main()