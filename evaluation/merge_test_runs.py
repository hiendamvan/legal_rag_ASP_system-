import argparse
import json
import logging
import sys
from datetime import datetime
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_OUTPUT_ROOT = PROJECT_ROOT / "evaluation" / "batch_logs"


def setup_logger(log_file: Path) -> logging.Logger:
    logger = logging.getLogger(f"merge_test_runs.{log_file}")
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


def load_json(file_path: Path):
    with file_path.open("r", encoding="utf-8") as file:
        return json.load(file)


def write_json(file_path: Path, payload) -> None:
    file_path.parent.mkdir(parents=True, exist_ok=True)
    with file_path.open("w", encoding="utf-8") as file:
        json.dump(payload, file, ensure_ascii=False, indent=2)


def write_jsonl(file_path: Path, records: list[dict]) -> None:
    file_path.parent.mkdir(parents=True, exist_ok=True)
    with file_path.open("w", encoding="utf-8") as file:
        for record in records:
            file.write(json.dumps(record, ensure_ascii=False) + "\n")


def load_results(run_dir: Path) -> list[dict]:
    results_path = run_dir / "results.json"
    records = load_json(results_path)
    if not isinstance(records, list):
        raise ValueError(f"Expected a JSON array in {results_path}")
    return records


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Merge a full test-set run with a rerun of failed samples. "
            "Records from the rerun replace matching ids from the base run."
        )
    )
    parser.add_argument(
        "base_run_dir",
        type=Path,
        help="Directory of the original full test-set run",
    )
    parser.add_argument(
        "rerun_dir",
        type=Path,
        help="Directory of the rerun that contains the failed sample ids",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=None,
        help="Directory to write the merged run. Defaults to evaluation/batch_logs/merged_<timestamp>",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    base_run_dir = args.base_run_dir.resolve()
    rerun_dir = args.rerun_dir.resolve()

    output_dir = args.output_dir
    if output_dir is None:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        output_dir = DEFAULT_OUTPUT_ROOT / f"merged_run_{timestamp}"
    output_dir = output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    logger = setup_logger(output_dir / "run.log")
    logger.info("Base run: %s", base_run_dir)
    logger.info("Rerun: %s", rerun_dir)
    logger.info("Output directory: %s", output_dir)

    base_summary = load_json(base_run_dir / "summary.json")
    rerun_summary = load_json(rerun_dir / "summary.json")
    base_records = load_results(base_run_dir)
    rerun_records = load_results(rerun_dir)

    base_ids = [record.get("id") for record in base_records]
    rerun_ids = [record.get("id") for record in rerun_records]

    if len(base_ids) != len(set(base_ids)):
        raise ValueError("Base run contains duplicate ids; cannot merge deterministically.")
    if len(rerun_ids) != len(set(rerun_ids)):
        raise ValueError("Rerun contains duplicate ids; cannot merge deterministically.")

    missing_in_base = [sample_id for sample_id in rerun_ids if sample_id not in set(base_ids)]
    if missing_in_base:
        raise ValueError(
            "Rerun contains ids that do not exist in the base run: " + ", ".join(missing_in_base)
        )

    rerun_map = {record.get("id"): record for record in rerun_records}
    merged_records = [rerun_map.get(record.get("id"), record) for record in base_records]

    replaced_ids = [sample_id for sample_id in base_ids if sample_id in rerun_map]
    error_count = sum(1 for record in merged_records if record.get("error"))

    summary = {
        "input_file": base_summary.get("input_file"),
        "output_dir": str(output_dir),
        "question_count": len(merged_records),
        "error_count": error_count,
        "success_count": len(merged_records) - error_count,
        "top_k": base_summary.get("top_k"),
        "created_at": datetime.now().isoformat(timespec="seconds"),
        "base_run_dir": str(base_run_dir),
        "rerun_dir": str(rerun_dir),
        "replaced_count": len(replaced_ids),
        "replaced_ids": replaced_ids,
        "rerun_error_count": rerun_summary.get("error_count"),
    }

    write_json(output_dir / "results.json", merged_records)
    write_json(output_dir / "results.partial.json", merged_records)
    write_jsonl(output_dir / "results.jsonl", merged_records)
    write_json(output_dir / "summary.json", summary)

    logger.info("Merged %s records", len(merged_records))
    logger.info("Replaced %s records from rerun", len(replaced_ids))
    logger.info("Final result: success=%s error=%s", summary["success_count"], summary["error_count"])


if __name__ == "__main__":
    main()