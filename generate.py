"""
generate.py — Retrieve relevant articles then generate an answer via Gemini or OpenAI.

Usage:
    python generate.py --query "Chạy quá tốc độ từ 5–10 km/h bị phạt thế nào?" --top_k 5

Set LLM_PROVIDER=gemini (default) or LLM_PROVIDER=openai in your .env file.
"""

import argparse
import os

from dotenv import load_dotenv

from retrieve import retrieve

load_dotenv()

# ---- LLM config ----
LLM_PROVIDER = os.getenv("LLM_PROVIDER", "gemini").lower()  # "gemini" | "openai"

GEMINI_API_KEY = os.getenv("GEMINI_API_KEY", "")
GEMINI_MODEL = os.getenv("GEMINI_MODEL", "gemini-2.0-flash")

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY", "")
OPENAI_MODEL = os.getenv("OPENAI_MODEL", "gpt-4o-mini")


def _build_prompt(query: str, chunks: list[dict]) -> str:
    context_parts = []
    for c in chunks:
        m = c["metadata"]
        label = m.get("breadcrumb") or m.get("dieu_title") or f"Điều {m.get('dieu_num', '')}"
        # Prefer diem_text for the actual content; fall back to full stored document
        body = m.get("diem_text") or c["text"]
        ki = m.get("khoan_intro", "")
        block = f"[{label}]"
        if ki:
            block += f"\nBối cảnh khoản: {ki}"
        block += f"\n{body}"
        context_parts.append(block)
    context = "\n\n---\n\n".join(context_parts)

    return f"""Bạn là trợ lý pháp lý chuyên về Nghị định 168/2024/NĐ-CP về xử phạt vi phạm giao thông đường bộ của Việt Nam.

Dưới đây là các điều luật liên quan được trích từ văn bản:

{context}

---

Câu hỏi: {query}

Hãy trả lời câu hỏi dựa trên các điều luật trên. Trích dẫn rõ số điều, khoản nếu có. Nếu thông tin không đủ để trả lời, hãy nói rõ điều đó và không suy diễn thêm."""


def _call_gemini(prompt: str) -> str:
    if not GEMINI_API_KEY:
        raise ValueError("GEMINI_API_KEY is not set in .env file.")
    from google import genai
    client = genai.Client(api_key=GEMINI_API_KEY)
    response = client.models.generate_content(
        model=GEMINI_MODEL,
        contents=prompt,
    )
    return response.text


def _call_openai(prompt: str) -> str:
    if not OPENAI_API_KEY:
        raise ValueError("OPENAI_API_KEY is not set in .env file.")
    from openai import OpenAI
    client = OpenAI(api_key=OPENAI_API_KEY)
    response = client.chat.completions.create(
        model=OPENAI_MODEL,
        messages=[{"role": "user", "content": prompt}],
    )
    return response.choices[0].message.content


def generate(query: str, top_k: int = 5, provider: str | None = None) -> tuple[str, list[dict]]:
    """
    Returns (answer_text, source_chunks).

    provider: "gemini" or "openai". Defaults to LLM_PROVIDER env var.
    """
    used_provider = (provider or LLM_PROVIDER).lower()

    chunks = retrieve(query, top_k)
    if not chunks:
        return "Không tìm thấy thông tin liên quan trong cơ sở dữ liệu.", []

    prompt = _build_prompt(query, chunks)

    if used_provider == "openai":
        answer = _call_openai(prompt)
    else:
        answer = _call_gemini(prompt)

    return answer, chunks


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Answer a legal question using RAG.")
    parser.add_argument("--query", required=True)
    parser.add_argument("--top_k", type=int, default=5)
    parser.add_argument(
        "--provider",
        choices=["gemini", "openai"],
        default=None,
        help="LLM provider to use (overrides LLM_PROVIDER env var).",
    )
    args = parser.parse_args()

    answer, sources = generate(args.query, args.top_k, args.provider)

    print("\n" + "=" * 60)
    print("CÂU TRẢ LỜI")
    print("=" * 60)
    print(answer)

    print("\n" + "=" * 60)
    print("NGUỒN THAM KHẢO")
    print("=" * 60)
    for s in sources:
        m = s["metadata"]
        label = m.get("breadcrumb") or m.get("dieu_title") or f"Điều {m.get('dieu_num', '')}"
        print(f"  - {label} (score={s['score']:.4f})")
