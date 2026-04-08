"""
index.py — Read a legal .doc/.docx, chunk at điểm level, embed, store in ChromaDB.

Usage:
    python index.py --file nghidinh_168_2024.doc
"""

import argparse
import os

import chromadb
from dotenv import load_dotenv

from embedder import embed
from utils.docx_loader import chunk_hierarchical, load_paragraphs

load_dotenv()

CHROMA_DIR = os.getenv("CHROMA_DIR", "./chroma_db")
COLLECTION_NAME = os.getenv("COLLECTION_NAME", "legal_docs")
BATCH_SIZE = 50


def index_file(file_path: str) -> None:
    print(f"[index] Loading '{file_path}' ...")
    paragraphs = load_paragraphs(file_path)
    print(f"[index] {len(paragraphs)} paragraphs loaded.")

    print("[index] Chunking hierarchically (Mục → Điều → Khoản → Điểm) ...")
    source_name = os.path.basename(file_path)
    chunks = chunk_hierarchical(paragraphs, source=source_name)
    print(f"[index] {len(chunks)} chunks found.")

    if not chunks:
        print("[index] No chunks found. Check the document format.")
        return

    # The document to embed = full contextual text (includes hierarchy context)
    documents = [c["full_text"] for c in chunks]

    # Unique IDs: dieu_0006_k01_da_i000
    ids = [
        f"dieu_{c['dieu_num']:04d}_k{c['khoan_num']:02d}_d{c['diem'] or '0'}_{i:04d}"
        for i, c in enumerate(chunks)
    ]

    # Flat metadata for ChromaDB (all values must be str / int / float / bool)
    metadatas = [
        {
            "muc_num":     c["muc_num"],
            "muc_title":   c["muc_title"],
            "dieu_num":    c["dieu_num"],
            "dieu_title":  c["dieu_title"],
            "khoan_num":   c["khoan_num"],
            "khoan_intro": c["khoan_intro"],
            "diem":        c["diem"],
            "diem_text":   c["diem_text"][:500],   # preview stored in metadata
            "breadcrumb":  c["breadcrumb"],
            "source":      c["source"],
        }
        for c in chunks
    ]

    print("[index] Embedding chunks ...")
    vectors = embed(documents)

    print(f"[index] Storing in ChromaDB at '{CHROMA_DIR}' ...")
    client = chromadb.PersistentClient(path=CHROMA_DIR)

    try:
        client.delete_collection(COLLECTION_NAME)
        print(f"[index] Dropped existing collection '{COLLECTION_NAME}'.")
    except Exception:
        pass

    collection = client.create_collection(
        name=COLLECTION_NAME,
        metadata={"hnsw:space": "cosine"},
    )

    for i in range(0, len(documents), BATCH_SIZE):
        sl = slice(i, i + BATCH_SIZE)
        collection.add(
            ids=ids[sl],
            documents=documents[sl],
            embeddings=vectors[sl],
            metadatas=metadatas[sl],
        )
        stored = min(i + BATCH_SIZE, len(documents))
        print(f"  {stored}/{len(documents)} chunks stored.")

    print("[index] Done.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Index a legal document into ChromaDB.")
    parser.add_argument("--file", default="nghidinh_168_2024.doc")
    args = parser.parse_args()
    index_file(args.file)
