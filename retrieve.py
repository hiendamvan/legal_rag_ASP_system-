"""
retrieve.py — Embed a query and retrieve the most relevant legal articles from ChromaDB.

Usage:
    python retrieve.py --query "Chạy quá tốc độ bị phạt thế nào?" --top_k 5
"""

import argparse
import os
import re
import unicodedata

import chromadb
from dotenv import load_dotenv

from embedder import embed

load_dotenv()

CHROMA_DIR = os.getenv("CHROMA_DIR", "./chroma_db")
COLLECTION_NAME = os.getenv("COLLECTION_NAME", "legal_docs")


def _normalize_text(text: str) -> str:
    normalized = text.lower().replace("đ", "d")
    normalized = unicodedata.normalize("NFD", normalized)
    normalized = "".join(ch for ch in normalized if unicodedata.category(ch) != "Mn")
    return re.sub(r"\s+", " ", normalized).strip()


def _extract_decimal_value(query: str, unit_pattern: str) -> float | None:
    normalized_query = _normalize_text(query)
    match = re.search(rf"(\d+(?:[\.,]\d+)?)\s*{unit_pattern}", normalized_query)
    if not match:
        return None
    return float(match.group(1).replace(",", "."))


def _build_alcohol_query_variants(query: str) -> list[str]:
    normalized_query = _normalize_text(query)
    if "nong do con" not in normalized_query:
        return []

    variants: list[str] = []
    breath_value = _extract_decimal_value(query, r"mg\s*/\s*l")
    if breath_value is None:
        breath_value = _extract_decimal_value(query, r"miligam\s*/\s*1\s*lit")

    if breath_value is None:
        return variants

    if breath_value <= 0.25:
        canonical = "nồng độ cồn chưa vượt quá 0,25 miligam/1 lít khí thở"
    elif breath_value <= 0.4:
        canonical = "nồng độ cồn vượt quá 0,25 miligam đến 0,4 miligam/1 lít khí thở"
    else:
        canonical = "nồng độ cồn vượt quá 0,4 miligam/1 lít khí thở"

    variants.extend([
        canonical,
        f"người lái ô tô có {canonical} bị phạt bao nhiêu",
        f"điều khiển xe ô tô trên đường mà trong hơi thở có {canonical} bị phạt bao nhiêu",
    ])
    return variants


def _build_speed_query_variants(query: str) -> list[str]:
    normalized_query = _normalize_text(query)
    if "qua toc do" not in normalized_query:
        return []

    speed_value = _extract_decimal_value(query, r"km\s*/\s*h")
    if speed_value is None:
        return []

    if 5 <= speed_value < 10:
        canonical = "chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h"
    elif 10 <= speed_value <= 20:
        canonical = "chạy quá tốc độ quy định từ 10 km/h đến 20 km/h"
    elif 20 < speed_value <= 35:
        canonical = "chạy quá tốc độ quy định trên 20 km/h đến 35 km/h"
    elif speed_value > 35:
        canonical = "chạy quá tốc độ quy định trên 35 km/h"
    else:
        return []

    return [
        canonical,
        f"ô tô {canonical} bị phạt bao nhiêu",
        f"người lái ô tô {canonical} thì bị phạt bao nhiêu",
    ]


def _build_query_variants(query: str) -> list[str]:
    variants = [query.strip()]
    variants.extend(_build_alcohol_query_variants(query))
    variants.extend(_build_speed_query_variants(query))

    deduped: list[str] = []
    seen: set[str] = set()
    for variant in variants:
        cleaned = re.sub(r"\s+", " ", variant).strip()
        if cleaned and cleaned not in seen:
            seen.add(cleaned)
            deduped.append(cleaned)
    return deduped


def retrieve(query: str, top_k: int = 5) -> list[dict]:
    """
    Return the top_k most relevant chunks for the query.

    Each result dict:
        {
            "text": str,
            "metadata": {"article_num": int, "title": str, "source": str},
            "score": float,  # cosine similarity in [0, 1]
        }
    """
    client = chromadb.PersistentClient(path=CHROMA_DIR)
    collection = client.get_collection(COLLECTION_NAME)

    query_variants = _build_query_variants(query)
    query_vectors = embed(query_variants)

    results = collection.query(
        query_embeddings=query_vectors,
        n_results=top_k,
        include=["documents", "metadatas", "distances"],
    )

    merged: dict[tuple[str, str], dict] = {}
    for documents, metadatas, distances in zip(
        results["documents"],
        results["metadatas"],
        results["distances"],
    ):
        for doc, meta, dist in zip(documents, metadatas, distances):
            key = (meta.get("breadcrumb", ""), doc)
            score = 1.0 - dist
            existing = merged.get(key)
            if existing is None or score > existing["score"]:
                merged[key] = {
                    "text": doc,
                    "metadata": meta,
                    # ChromaDB cosine distance is in [0, 2]; convert to similarity
                    "score": score,
                }

    return sorted(merged.values(), key=lambda item: item["score"], reverse=True)[:top_k]


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Retrieve relevant legal articles.")
    parser.add_argument("--query", required=True, help="Question in Vietnamese.")
    parser.add_argument("--top_k", type=int, default=5)
    args = parser.parse_args()

    results = retrieve(args.query, args.top_k)
    for i, r in enumerate(results, 1):
        m = r["metadata"]
        print(f"\n--- Kết quả {i} | score={r['score']:.4f} ---")
        print(f"Vị trí : {m.get('breadcrumb', '')}")
        print(f"Điều   : {m.get('dieu_title', '')[:80]}")
        if m.get("khoan_intro"):
            print(f"Khoản  : {m['khoan_intro'][:80]}...")
        if m.get("diem"):
            print(f"Điểm   : {m['diem']}) {m.get('diem_text', '')[:120]}...")
        print()
