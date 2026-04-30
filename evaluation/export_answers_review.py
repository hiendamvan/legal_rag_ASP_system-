from __future__ import annotations

import argparse
import csv
import html
import json
from pathlib import Path


BASE_COLUMNS = [
    "id",
    "question_type",
    "question",
    "expected_text_answer",
    "predicted_text_answer",
    "error",
]

HTML_EXTRA_COLUMNS = [
    "retrieved_chunks",
    "matched_rules",
    "facts_extracted",
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Export answer review files from a batch run.")
    parser.add_argument("run_dir", type=Path, help="Directory containing results.json")
    return parser.parse_args()


def load_rows(run_dir: Path) -> list[dict]:
    results_path = run_dir / "results.json"
    with results_path.open("r", encoding="utf-8") as file:
        return json.load(file)


def write_csv(run_dir: Path, rows: list[dict]) -> Path:
    csv_path = run_dir / "answers_review.csv"
    with csv_path.open("w", encoding="utf-8-sig", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=BASE_COLUMNS)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row.get(key) for key in BASE_COLUMNS})
    return csv_path


def to_markdown_text(value) -> str:
    if value is None:
        return ""
    return str(value).replace("\r\n", "\n").replace("\r", "\n").replace("\n", " <br> ").replace("|", "\\|")


def write_markdown(run_dir: Path, rows: list[dict]) -> Path:
    md_path = run_dir / "answers_review.md"
    lines = [
        "| id | question_type | question | expected_text_answer | predicted_text_answer | error |",
        "| --- | --- | --- | --- | --- | --- |",
    ]
    for row in rows:
        values = [to_markdown_text(row.get(key)) for key in BASE_COLUMNS]
        lines.append(
            f"| {values[0]} | {values[1]} | {values[2]} | {values[3]} | {values[4]} | {values[5]} |"
        )
    md_path.write_text("\n".join(lines) + "\n", encoding="utf-8-sig")
    return md_path


def to_html_text(value) -> str:
    if value is None:
        return ""
    return html.escape(str(value)).replace("\r\n", "\n").replace("\r", "\n").replace("\n", "<br>")


def to_pretty_json(value) -> str:
    if not value:
        return "[]"
    return json.dumps(value, ensure_ascii=False, indent=2)


def render_extra_cell(value) -> str:
    pretty_json = html.escape(to_pretty_json(value))
    if not value:
        return '<td><span class="muted">[]</span></td>'
    return (
        '<td>'
        '<details>'
        '<summary>View</summary>'
        f'<pre>{pretty_json}</pre>'
        '</details>'
        '</td>'
    )


def write_html(run_dir: Path, rows: list[dict]) -> Path:
    html_path = run_dir / "answers_review.html"
    html_rows: list[str] = []
    for row in rows:
        base_cells = "".join(f"<td>{to_html_text(row.get(key))}</td>" for key in BASE_COLUMNS)
        extra_cells = "".join(render_extra_cell(row.get(key)) for key in HTML_EXTRA_COLUMNS)
        html_rows.append(f"<tr>{base_cells}{extra_cells}</tr>")

    html_doc = "".join(
        [
            "<!DOCTYPE html>",
            '<html><head><meta charset="utf-8"><title>Answers Review</title>',
            "<style>",
            "body{font-family:Segoe UI,Arial,sans-serif;margin:24px}",
            "table{border-collapse:collapse;width:100%;table-layout:fixed}",
            "th,td{border:1px solid #ccc;padding:8px;vertical-align:top;text-align:left;word-wrap:break-word}",
            "th{background:#f3f3f3;position:sticky;top:0;z-index:1}",
            "td:nth-child(1),td:nth-child(2){width:80px}",
            "td:nth-child(3){width:18%}",
            "td:nth-child(4),td:nth-child(5){width:18%}",
            "td:nth-child(6){width:14%;color:#a33}",
            "td:nth-child(7),td:nth-child(8),td:nth-child(9){width:17%}",
            "pre{margin:8px 0 0;white-space:pre-wrap;word-break:break-word;font-size:12px;line-height:1.4}",
            "summary{cursor:pointer;color:#0b57d0}",
            ".muted{color:#666}",
            "</style>",
            "</head><body>",
            "<h1>Expected vs Predicted Answers</h1>",
            "<table><thead><tr>",
            "<th>id</th><th>question_type</th><th>question</th><th>expected_text_answer</th><th>predicted_text_answer</th><th>error</th>",
            "<th>retrieved_chunks</th><th>matched_rules</th><th>facts_extracted</th>",
            "</tr></thead><tbody>",
            "".join(html_rows),
            "</tbody></table></body></html>",
        ]
    )
    html_path.write_text(html_doc, encoding="utf-8-sig")
    return html_path


def main() -> None:
    args = parse_args()
    rows = load_rows(args.run_dir)
    csv_path = write_csv(args.run_dir, rows)
    md_path = write_markdown(args.run_dir, rows)
    html_path = write_html(args.run_dir, rows)
    print(f"csv={csv_path}")
    print(f"md={md_path}")
    print(f"html={html_path}")
    print(f"rows={len(rows)}")


if __name__ == "__main__":
    main()