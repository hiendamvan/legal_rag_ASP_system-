import argparse
import json
from pathlib import Path

from dataset_rule_ids import enrich_dataset_with_rule_ids


PROJECT_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_DATASET = PROJECT_ROOT / "public_dataset" / "test.json"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Backfill output.rule_id for a dataset JSON file.")
    parser.add_argument("--input", type=Path, default=DEFAULT_DATASET)
    parser.add_argument("--output", type=Path, default=None)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    input_path = args.input.resolve()
    output_path = args.output.resolve() if args.output else input_path

    with input_path.open("r", encoding="utf-8") as file:
        dataset = json.load(file)

    enriched_dataset = enrich_dataset_with_rule_ids(dataset)

    with output_path.open("w", encoding="utf-8") as file:
        json.dump(enriched_dataset, file, ensure_ascii=False, indent=2)

    print(f"Updated rule_id for {len(enriched_dataset)} samples -> {output_path}")


if __name__ == "__main__":
    main()