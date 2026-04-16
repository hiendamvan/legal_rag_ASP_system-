import sys
import os
from pathlib import Path

# Change working directory to project root so relative paths (e.g. ./chroma_db) resolve correctly
PROJECT_ROOT = Path(__file__).resolve().parent.parent
os.chdir(PROJECT_ROOT)

# Add the project root to the Python path
sys.path.append(str(PROJECT_ROOT))

import json
from asp_pipeline import run_asp_pipeline

EVAL_DIR = Path(__file__).resolve().parent

def main():
    # Load questions from qa1.json (in evaluation folder)
    input_file = EVAL_DIR / "qa1.json"
    output_file = EVAL_DIR / "qa_results.json"

    with open(input_file, "r", encoding="utf-8") as f:
        questions = json.load(f)

    questions = questions.get("questions", [])
    results = []

    # Process each question
    for item in questions:
        question = item.get("question")
        if not question:
            continue

        # Run the ASP pipeline
        result = run_asp_pipeline(question)

        # Extract answer from reasoning results or llm_raw on failure
        reasoning = result.get("reasoning_results", [])
        answer = ", ".join(reasoning) if reasoning else result.get("llm_raw", "")

        # Extract legal references from matched rules
        matched_rules = result.get("matched_rules", [])
        legal_reference = [r.get("rule_id", "") for r in matched_rules]

        results.append({
            "question": question,
            "answer": answer,
            "legal_reference": legal_reference
        })

    # Save results to a JSON file
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(results, f, ensure_ascii=False, indent=4)

    print(f"Results saved to {output_file}")

if __name__ == "__main__":
    main()