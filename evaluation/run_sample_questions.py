import argparse
import csv
import json
import os
import re
import sys
from datetime import datetime
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parent.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.append(str(PROJECT_ROOT))

from asp_pipeline import run_asp_pipeline


DEFAULT_TOP_K = 10
DEFAULT_OUTPUT_DIR = PROJECT_ROOT / "evaluation" / "batch_logs"

# Default sample questions transcribed from the shared sheet screenshot.
DEFAULT_SAMPLE_QUESTIONS = [
    "Người điều khiển xe máy vừa không đội mũ và chở người không đội mũ bị xử phạt thế nào?",
    "Người điều khiển xe máy vượt xe không tín hiệu và gây tai nạn thì bị xử phạt thế nào?",
    "Người điều khiển xe máy đi ngược chiều và gây tai nạn bị xử phạt thế nào?",
    "Người điều khiển xe máy vừa sử dụng điện thoại vừa không quan sát gây tai nạn bị xử phạt thế nào?",
    "Người điều khiển xe máy chở 2 người nhưng chở người bệnh đi cấp cứu có vi phạm không?",
    "Người điều khiển xe máy sử dụng còi ban đêm nhưng là xe ưu tiên có vi phạm không?",
    "Người điều khiển xe máy đi vào đường cấm nhưng là xe ưu tiên có vi phạm không?",
    "Người điều khiển xe máy không nhường đường nhưng là xe ưu tiên có vi phạm không?",
    "Người điều khiển xe máy chở trẻ em dưới 6 tuổi không đội mũ có vi phạm không?",
    "Người điều khiển xe máy chạy nhanh có bị phạt không?",
    "Người điều khiển xe máy bật đèn không đúng có bị phạt không?",
    "Người điều khiển xe máy có uống rượu có bị phạt không?",
    "Người điều khiển xe máy gây tai nạn có bị phạt không?",
    "Người điều khiển xe máy chở người có vi phạm không?",
    "Người điều khiển xe máy không chấp hành đèn giao thông có vi phạm không?",
    "Người điều khiển xe máy đi trên vỉa hè có vi phạm không?",
    "Người điều khiển xe máy không giữ khoảng cách gây va chạm bị phạt bao nhiêu?",
    "Người điều khiển xe máy vừa vượt đèn đỏ vừa gây tai nạn bị xử phạt thế nào?",
    "Người điều khiển xe máy đi vào vỉa hè để vào nhà có vi phạm không?",
]


def _format_currency(amount: int) -> str:
    return f"{amount:,}".replace(",", ".") + " đồng"


def _extract_penalties(reasoning_results: list[str]) -> list[dict]:
    penalties: list[dict] = []
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


def _build_pred_answer(result: dict) -> str:
    if result.get("error"):
        return f"Lỗi pipeline: {result['error']}"

    final_answer = result.get("final_answer")
    if isinstance(final_answer, str) and final_answer.strip():
        return final_answer.strip()

    penalties = _extract_penalties(result.get("reasoning_results", []))
    if penalties:
        if len(penalties) == 1:
            p = penalties[0]
            return (
                "Mức phạt áp dụng từ "
                f"{_format_currency(p['fine_min'])} đến {_format_currency(p['fine_max'])}."
            )

        parts = []
        for idx, p in enumerate(penalties, start=1):
            parts.append(
                f"Hành vi {idx}: {_format_currency(p['fine_min'])} đến {_format_currency(p['fine_max'])}"
            )
        return "; ".join(parts) + "."

    llm_raw = result.get("llm_raw")
    if isinstance(llm_raw, str) and llm_raw.strip():
        return llm_raw.strip()

    return "Không đủ cơ sở pháp lí để trả lời"


def _unique_keep_order(values: list[str]) -> list[str]:
    seen = set()
    out = []
    for value in values:
        if not value or value in seen:
            continue
        seen.add(value)
        out.append(value)
    return out


def _extract_question(item) -> str:
    if isinstance(item, str):
        return item.strip()
    if isinstance(item, dict):
        question = item.get("question")
        if isinstance(question, str) and question.strip():
            return question.strip()
        input_payload = item.get("input")
        if isinstance(input_payload, dict):
            q2 = input_payload.get("question")
            if isinstance(q2, str) and q2.strip():
                return q2.strip()
    return ""


def load_questions(questions_file: Path | None) -> list[str]:
    if questions_file is None:
        return DEFAULT_SAMPLE_QUESTIONS

    if questions_file.suffix.lower() == ".txt":
        lines = questions_file.read_text(encoding="utf-8").splitlines()
        questions = [line.strip() for line in lines if line.strip()]
        return questions

    if questions_file.suffix.lower() == ".json":
        data = json.loads(questions_file.read_text(encoding="utf-8"))
        if not isinstance(data, list):
            raise ValueError("JSON input must be a list of strings or objects with question field")
        questions = [_extract_question(item) for item in data]
        return [q for q in questions if q]

    raise ValueError("Unsupported input file. Use .txt or .json")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run sample legal questions and export Retrieved_id, Pred_related_id, Pred_Answer"
    )
    parser.add_argument(
        "--questions-file",
        type=Path,
        default=None,
        help="Optional .txt or .json file containing sample questions. If omitted, built-in samples are used.",
    )
    parser.add_argument("--top-k", type=int, default=DEFAULT_TOP_K)
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Optional output CSV path. Default: evaluation/batch_logs/sample_questions_<timestamp>.csv",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    questions_file = args.questions_file.resolve() if args.questions_file else None
    questions = load_questions(questions_file)

    # Ensure relative paths in retrieve/index (e.g., CHROMA_DIR=./chroma_db) resolve from project root.
    os.chdir(PROJECT_ROOT)

    if not questions:
        raise ValueError("No valid questions found.")

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    if args.output is None:
        output_path = DEFAULT_OUTPUT_DIR / f"sample_questions_{timestamp}.csv"
    else:
        output_path = args.output.resolve()

    output_path.parent.mkdir(parents=True, exist_ok=True)
    json_output_path = output_path.with_suffix(".json")

    rows: list[dict] = []

    print(f"Total questions: {len(questions)}")
    print(f"top_k: {args.top_k}")
    if questions_file:
        print(f"Questions source: {questions_file}")

    for index, question in enumerate(questions, start=1):
        print(f"[{index}/{len(questions)}] {question}")
        try:
            result = run_asp_pipeline(question, top_k=args.top_k)
        except Exception as exc:
            result = {
                "query": question,
                "extracted_rule_ids": [],
                "applied_rule_ids": [],
                "reasoning_results": [],
                "llm_raw": "",
                "error": f"Unhandled pipeline error: {exc}",
            }

        retrieved_ids = _unique_keep_order(result.get("extracted_rule_ids", []))
        pred_related_ids = _unique_keep_order(result.get("applied_rule_ids", []))
        pred_answer = _build_pred_answer(result)

        row = {
            "Index": index,
            "Question": question,
            "Retrieved_id": retrieved_ids,
            "Pred_related_id": pred_related_ids,
            "Pred_Answer": pred_answer,
        }
        if result.get("error"):
            row["Error"] = result["error"]

        rows.append(row)

    with output_path.open("w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(
            file,
            fieldnames=["Index", "Question", "Retrieved_id", "Pred_related_id", "Pred_Answer", "Error"],
        )
        writer.writeheader()
        for row in rows:
            writer.writerow(
                {
                    "Index": row.get("Index", ""),
                    "Question": row.get("Question", ""),
                    "Retrieved_id": "; ".join(row.get("Retrieved_id", [])),
                    "Pred_related_id": "; ".join(row.get("Pred_related_id", [])),
                    "Pred_Answer": row.get("Pred_Answer", ""),
                    "Error": row.get("Error", ""),
                }
            )

    with json_output_path.open("w", encoding="utf-8") as file:
        json.dump(rows, file, ensure_ascii=False, indent=2)

    print(f"Saved CSV: {output_path}")
    print(f"Saved JSON: {json_output_path}")


if __name__ == "__main__":
    main()