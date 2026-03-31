"""
index.py — Read a legal .doc/.docx file, chunk by Điều, embed, and store in ChromaDB.

Usage:
    python index.py --file nghidinh_168_2024.doc
"""

import argparse
import os

import chromadb
from dotenv import load_dotenv

from embedder import embed
from utils.docx_loader import chunk_by_dieu, load_text

load_dotenv()

CHROMA_DIR = os.getenv("CHROMA_DIR", "./chroma_db")
COLLECTION_NAME = os.getenv("COLLECTION_NAME", "legal_docs")
BATCH_SIZE = 50


def index_file(file_path: str) -> None:
    print(f"[index] Loading '{file_path}' ...")
    text = load_text(file_path)

    print("[index] Chunking by Điều ...")
    chunks = chunk_by_dieu(text)
    print(f"[index] {len(chunks)} chunks found.")

    if not chunks:
        print("[index] No chunks found. Check the document format.")
        return

    texts = [c["text"] for c in chunks]
    # IDs must be unique — use article number + position index
    ids = [f"dieu_{c['article_num']:04d}_{i}" for i, c in enumerate(chunks)]
    metadatas = [
        {
            "article_num": c["article_num"],
            "title": c["title"],
            "source": os.path.basename(file_path),
        }
        for c in chunks
    ]

    print("[index] Embedding chunks ...")
    vectors = embed(texts)

    print(f"[index] Storing in ChromaDB at '{CHROMA_DIR}' ...")
    client = chromadb.PersistentClient(path=CHROMA_DIR)

    # Drop existing collection to allow re-indexing
    try:
        client.delete_collection(COLLECTION_NAME)
        print(f"[index] Dropped existing collection '{COLLECTION_NAME}'.")
    except Exception:
        pass

    collection = client.create_collection(
        name=COLLECTION_NAME,
        metadata={"hnsw:space": "cosine"},
    )

    for i in range(0, len(texts), BATCH_SIZE):
        sl = slice(i, i + BATCH_SIZE)
        collection.add(
            ids=ids[sl],
            documents=texts[sl],
            embeddings=vectors[sl],
            metadatas=metadatas[sl],
        )
        stored = min(i + BATCH_SIZE, len(texts))
        print(f"  {stored}/{len(texts)} chunks stored.")

    print("[index] Done.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Index a legal document into ChromaDB.")
    parser.add_argument(
        "--file",
        default="nghidinh_168_2024.doc",
        help="Path to the .doc or .docx file to index.",
    )
    args = parser.parse_args()
    index_file(args.file)
