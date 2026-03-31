"""
generate.py — Retrieve relevant articles then generate an answer via Gemini.

Usage:
    python generate.py --query "Chạy quá tốc độ từ 5–10 km/h bị phạt thế nào?" --top_k 5
"""

import argparse
import os

from dotenv import load_dotenv

from retrieve import retrieve

load_dotenv()

GEMINI_API_KEY = os.getenv("GEMINI_API_KEY", "")
GEMINI_MODEL = os.getenv("GEMINI_MODEL", "gemini-2.0-flash")


def _build_prompt(query: str, chunks: list[dict]) -> str:
    context_parts = []
    for c in chunks:
        context_parts.append(f"[{c['metadata']['title']}]\n{c['text']}")
    context = "\n\n---\n\n".join(context_parts)

    return f"""Bạn là trợ lý pháp lý chuyên về Nghị định 168/2024/NĐ-CP về xử phạt vi phạm giao thông đường bộ của Việt Nam.

Dưới đây là các điều luật liên quan được trích từ văn bản:

{context}

---

Câu hỏi: {query}

Hãy trả lời câu hỏi dựa trên các điều luật trên. Trích dẫn rõ số điều, khoản nếu có. Nếu thông tin không đủ để trả lời, hãy nói rõ điều đó và không suy diễn thêm."""


def generate(query: str, top_k: int = 5) -> tuple[str, list[dict]]:
    """
    Returns (answer_text, source_chunks).
    """
    if not GEMINI_API_KEY:
        raise ValueError(
            "GEMINI_API_KEY is not set. Please add it to your .env file."
        )

    chunks = retrieve(query, top_k)
    if not chunks:
        return "Không tìm thấy thông tin liên quan trong cơ sở dữ liệu.", []

    prompt = _build_prompt(query, chunks)

    from google import genai  # google-genai package

    client = genai.Client(api_key=GEMINI_API_KEY)
    response = client.models.generate_content(
        model=GEMINI_MODEL,
        contents=prompt,
    )

    return response.text, chunks


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Answer a legal question using RAG.")
    parser.add_argument("--query", required=True)
    parser.add_argument("--top_k", type=int, default=5)
    args = parser.parse_args()

    answer, sources = generate(args.query, args.top_k)

    print("\n" + "=" * 60)
    print("CÂU TRẢ LỜI")
    print("=" * 60)
    print(answer)

    print("\n" + "=" * 60)
    print("NGUỒN THAM KHẢO")
    print("=" * 60)
    for s in sources:
        print(f"  - {s['metadata']['title']} (score={s['score']:.4f})")
