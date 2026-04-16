prompt = """
You are a legal expert evaluating a model answer for a Vietnamese traffic law question.

The question may involve MULTIPLE violations. Evaluate whether the model correctly identifies and answers ALL violations.

Evaluate the model answer compared to the ground truth using four binary criteria.

Return 1 if the criterion is satisfied, otherwise return 0.

Criteria:

1. Relevance
- The answer must address ALL violations mentioned in the question.
- Missing any violation → 0

2. Legal citation
- Must include correct and specific legal references (Điều, Khoản, Điểm).
- Partial or missing citations for any violation → 0

3. Reasoning accuracy
- The answer must correctly map each violation to the corresponding legal rule.
- No hallucinated rules.
- Each violation must be matched to the correct legal basis.

4. Conclusion accuracy
- The penalties (fine ranges, sanctions) must be correct for EACH violation.
- If any penalty is incorrect or missing → 0

Important rules:
- The ground truth is the reference standard.
- The model answer does NOT need to match wording exactly.
- Focus on correctness, completeness, and legal grounding.
- If the answer merges multiple violations incorrectly → 0

Return ONLY JSON in this format:
{
  "relevance": 0 or 1,
  "legal_citation": 0 or 1,
  "reasoning_accuracy": 0 or 1,
  "conclusion_accuracy": 0 or 1
}

Question:
{question}

Model Answer:
{prediction}

Ground Truth:
{ground_truth}
"""