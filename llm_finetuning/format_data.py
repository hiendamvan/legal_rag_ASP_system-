import argparse
import json
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
DEFAULT_DATASET_DIR = BASE_DIR.parent / "public_dataset"
DEFAULT_OUTPUT_DIR = BASE_DIR / "data_finetune"

def build_user_prompt(sample):
    question = sample["input"]["question"]
    rules = sample["input"]["retrieved_rules"]

    rules_str = json.dumps(rules, ensure_ascii=False, indent=2)

    prompt = f"""Bạn là hệ thống trích xuất legal case facts.

Nhiệm vụ:
- Đọc câu hỏi người dùng
- Chỉ sử dụng các rule được cung cấp
- Trích xuất case facts chuẩn hóa
- KHÔNG suy luận mức phạt

Câu hỏi:
{question}

Các rule liên quan:
{rules_str}

Trả về JSON với format:
{{
  "facts": [...]
}}
"""

    return prompt.strip()


def build_assistant_output(sample):
    return json.dumps(sample["output"], ensure_ascii=False)


def convert_dataset(input_path, output_path):
    with input_path.open("r", encoding="utf-8") as f_in:
        data = json.load(f_in)

    with output_path.open("w", encoding="utf-8") as f_out:
        for sample in data:
            chat_sample = {
                "conversations": [
                    {
                        "role": "user",
                        "content": build_user_prompt(sample),
                    },
                    {
                        "role": "assistant",
                        "content": build_assistant_output(sample),
                    },
                ]
            }

            f_out.write(json.dumps(chat_sample, ensure_ascii=False) + "\n")


def parse_args():
    parser = argparse.ArgumentParser(
        description="Convert public train/test datasets into chat-format JSONL."
    )
    parser.add_argument(
        "--dataset-dir",
        type=Path,
        default=DEFAULT_DATASET_DIR,
        help="Directory containing train.json and test.json",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_OUTPUT_DIR,
        help="Directory where converted JSONL files will be written",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    dataset_dir = args.dataset_dir.resolve()
    output_dir = args.output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    dataset_files = ("train.json", "test.json")

    for dataset_name in dataset_files:
        input_path = dataset_dir / dataset_name
        output_path = output_dir / f"{input_path.stem}_chat_format.jsonl"

        if not input_path.exists():
            raise FileNotFoundError(f"Dataset file not found: {input_path}")

        convert_dataset(input_path, output_path)
        print(f"Converted {input_path.name} -> {output_path.name}")


if __name__ == "__main__":
    main()