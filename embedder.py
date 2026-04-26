"""Embedding helper — wraps AITeamVN/Vietnamese_Embedding via sentence-transformers."""

import os
import warnings
from dotenv import load_dotenv

load_dotenv()

_model = None


def _get_model():
    global _model
    if _model is None:
        from sentence_transformers import SentenceTransformer

        model_name = os.getenv("EMBEDDING_MODEL", "AITeamVN/Vietnamese_Embedding")
        local_path = os.getenv("EMBEDDING_LOCAL_PATH", "").strip()
        source = local_path if local_path and os.path.exists(local_path) else model_name

        print(f"[embedder] Loading model from: {source}")
        _model = SentenceTransformer(source)

        max_seq = int(os.getenv("EMBEDDING_MAX_SEQ_LENGTH", "2048"))
        _model.max_seq_length = max_seq

    return _model


def embed(texts: list[str]) -> list[list[float]]:
    """Embed a list of strings. Returns list of float vectors."""
    model = _get_model()
    normalize = os.getenv("EMBEDDING_NORMALIZE", "true").lower() == "true"
    vecs = model.encode(texts, normalize_embeddings=normalize, show_progress_bar=True)
    return vecs.tolist()
