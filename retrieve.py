"""
retrieve.py — Embed a query and retrieve the most relevant legal articles from ChromaDB.

Usage:
    python retrieve.py --query "Chạy quá tốc độ bị phạt thế nào?" --top_k 5
"""

import argparse
import os

import chromadb
from dotenv import load_dotenv

from embedder import embed

load_dotenv()

CHROMA_DIR = os.getenv("CHROMA_DIR", "./chroma_db")
COLLECTION_NAME = os.getenv("COLLECTION_NAME", "legal_docs")


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

    (query_vec,) = embed([query])

    results = collection.query(
        query_embeddings=[query_vec],
        n_results=top_k,
        include=["documents", "metadatas", "distances"],
    )

    chunks = []
    for doc, meta, dist in zip(
        results["documents"][0],
        results["metadatas"][0],
        results["distances"][0],
    ):
        chunks.append(
            {
                "text": doc,
                "metadata": meta,
                # ChromaDB cosine distance is in [0, 2]; convert to similarity
                "score": 1.0 - dist,
            }
        )

    return chunks


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Retrieve relevant legal articles.")
    parser.add_argument("--query", required=True, help="Question in Vietnamese.")
    parser.add_argument("--top_k", type=int, default=5)
    args = parser.parse_args()

    results = retrieve(args.query, args.top_k)
    for i, r in enumerate(results, 1):
        preview = r["text"][:300] + ("..." if len(r["text"]) > 300 else "")
        print(f"\n--- Kết quả {i} | score={r['score']:.4f} ---")
        print(f"Tiêu đề: {r['metadata']['title']}")
        print(preview)
