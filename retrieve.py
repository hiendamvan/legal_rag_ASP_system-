"""
retrieve.py — Embed a query and retrieve the most relevant legal articles from ChromaDB.

Usage:
    python retrieve.py --query "Chạy quá tốc độ bị phạt thế nào?" --top_k 5
"""

import argparse
import json
import os
import re
import sqlite3
import unicodedata
from functools import lru_cache

import chromadb
from dotenv import load_dotenv

try:
    from chromadb.api.configuration import CollectionConfigurationInternal
except ImportError:
    CollectionConfigurationInternal = None

from embedder import embed
from legal_knowlegde.asp_rule_loader import load_rules, match_chunk_to_rules

load_dotenv()

CHROMA_DIR = os.getenv("CHROMA_DIR", "./chroma_db")
COLLECTION_NAME = os.getenv("COLLECTION_NAME", "legal_docs")


# Ordered: more specific vehicle types must be checked before broader buckets.
_SUBJECT_KEYWORD_MAP: list[tuple[list[str], str]] = [
    (["xe mo to ba banh", "xe may ba banh", "moto ba banh"], "three_wheel_motorbike"),
    (["xe dap dien", "xe dap may"], "electric_bicycle"),
    (["xe dap"], "bicycle"),
    (["xe xich lo"], "cyclo"),
    (["xe tho so khac", "xe tho so"], "rudimentary_vehicle"),
    (["phuong tien khong dong co", "phuong tien tho so"], "non_motorized_vehicle"),
    (["xe may", "mo to", "xe gan may", "xe may 2 banh"], "motorbike"),
    (["o to", "xe o to", "xe hoi", "xe con", "xe 4 cho", "xe tai", "xe khach"], "car"),
    (["xe 4 banh gan dong co", "xe bon banh gan dong co"], "four_wheeled_motor_vehicle"),
    (["nguoi di bo"], "pedestrian"),
    (["hanh khach", "nguoi ngoi tren xe", "nguoi ngoi sau"], "passenger"),
    (["xe uu tien"], "priority_vehicle"),
]

_SUBJECT_PARENT_MAP: dict[str, str] = {
    "electric_bicycle": "bicycle",
    "bicycle": "non_motorized_vehicle",
    "cyclo": "rudimentary_vehicle",
    "rudimentary_vehicle": "non_motorized_vehicle",
}


def _normalize_text(text: str) -> str:
    normalized = text.lower().replace("đ", "d")
    normalized = unicodedata.normalize("NFD", normalized)
    normalized = "".join(ch for ch in normalized if unicodedata.category(ch) != "Mn")
    return re.sub(r"\s+", " ", normalized).strip()


@lru_cache(maxsize=1)
def _get_all_rules() -> dict[str, dict]:
    """Cache ASP rules so retrieve can map chunk -> rule subject quickly."""
    return load_rules()


@lru_cache(maxsize=1)
def _build_subject_text_matchers() -> dict[str, list[str]]:
    """Build subject -> text matcher list from LP subjects, then enrich with Vietnamese aliases."""
    rules = _get_all_rules()
    subjects = {
        str(rule.get("subject") or "").strip()
        for rule in rules.values()
        if str(rule.get("subject") or "").strip()
    }

    matchers: dict[str, list[str]] = {
        subject: [subject.replace("_", " ")]
        for subject in subjects
    }

    alias_map: dict[str, list[str]] = {
        "motorbike": ["xe may", "mo to", "xe gan may", "xe may 2 banh"],
        "three_wheel_motorbike": ["xe mo to ba banh", "xe may ba banh", "moto ba banh"],
        "electric_bicycle": ["xe dap dien", "xe dap may"],
        "bicycle": ["xe dap"],
        "cyclo": ["xe xich lo"],
        "rudimentary_vehicle": ["xe tho so khac", "xe tho so"],
        "non_motorized_vehicle": ["phuong tien khong dong co", "phuong tien tho so"],
        "car": ["o to", "xe o to", "xe hoi", "xe con", "xe 4 cho", "xe tai", "xe khach"],
        "four_wheeled_motor_vehicle": ["xe 4 banh gan dong co", "xe bon banh gan dong co"],
        "pedestrian": ["nguoi di bo"],
        "passenger": ["hanh khach", "nguoi ngoi tren xe", "nguoi ngoi sau"],
        "priority_vehicle": ["xe uu tien"],
    }

    for subject, aliases in alias_map.items():
        if subject in matchers:
            matchers[subject].extend(aliases)

    # Normalize + dedupe
    normalized_matchers: dict[str, list[str]] = {}
    for subject, patterns in matchers.items():
        seen: set[str] = set()
        cleaned: list[str] = []
        for pattern in patterns:
            norm = _normalize_text(pattern)
            if norm and norm not in seen:
                seen.add(norm)
                cleaned.append(norm)
        normalized_matchers[subject] = cleaned

    return normalized_matchers


def _infer_subject_type_from_query(query: str, rules: dict[str, dict]) -> str | None:
    """Infer subject from query by LP-driven text matcher list, fallback to rule-overlap scoring."""
    normalized_query = _normalize_text(query)

    # Step 1: deterministic direct matcher hit, ordered from specific to broad.
    for patterns, subject in _SUBJECT_KEYWORD_MAP:
        if any(_normalize_text(pattern) in normalized_query for pattern in patterns):
            return subject

    subject_matchers = _build_subject_text_matchers()

    # Step 2: LP-driven subject matcher fallback.
    for subject, patterns in subject_matchers.items():
        if any(pattern in normalized_query for pattern in patterns):
            return subject

    # Step 3: fallback when query doesn't explicitly mention vehicle label.
    query_tokens = {
        token
        for token in re.findall(r"\w+", normalized_query)
        if len(token) >= 3
    }
    if not query_tokens:
        return None

    subject_bags: dict[str, str] = {}
    for rule in rules.values():
        subject = str(rule.get("subject") or "").strip()
        if not subject:
            continue
        action_text = str(rule.get("action") or "").replace("_", " ")
        vi_text = str(rule.get("original_vi_text") or "")
        subject_bags.setdefault(subject, "")
        subject_bags[subject] += f" {action_text} {vi_text}"

    best_subject: str | None = None
    best_score = 0
    for subject, bag_text in subject_bags.items():
        normalized_bag = _normalize_text(bag_text)
        score = sum(1 for token in query_tokens if token in normalized_bag)
        if score > best_score:
            best_score = score
            best_subject = subject

    return best_subject if best_score > 0 else None


def _subject_matches_rule_subject(actual_subject: str, rule_subject: str) -> bool:
    """Return True when the detected subject is equal to or narrower than the rule subject."""
    current = actual_subject
    while current:
        if current == rule_subject:
            return True
        current = _SUBJECT_PARENT_MAP.get(current, "")
    return False


def _filter_chunks_by_subject(chunks: list[dict], subject_type: str, rules: dict[str, dict]) -> list[dict]:
    """Keep only chunks whose matched rules contain the inferred subject."""
    filtered: list[dict] = []
    for chunk in chunks:
        chunk_meta = chunk.get("metadata") or {}
        matched_rules = match_chunk_to_rules(chunk_meta, rules)
        if any(
            _subject_matches_rule_subject(subject_type, str(rule.get("subject") or ""))
            for rule in matched_rules
        ):
            filtered.append(chunk)
    return filtered


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

    variants = [canonical]

    if "xe may" in normalized_query or "mo to" in normalized_query:
        variants.extend([
            f"xe máy {canonical} bị phạt bao nhiêu",
            f"người điều khiển xe máy {canonical} bị phạt bao nhiêu",
        ])

    if "o to" in normalized_query or "xe hoi" in normalized_query:
        variants.extend([
            f"ô tô {canonical} bị phạt bao nhiêu",
            f"người lái ô tô {canonical} thì bị phạt bao nhiêu",
        ])

    if len(variants) == 1:
        variants.extend([
            f"xe cơ giới {canonical} bị phạt bao nhiêu",
            f"người điều khiển phương tiện {canonical} bị phạt bao nhiêu",
        ])

    return variants


def _build_lighting_query_variants(query: str) -> list[str]:
    normalized_query = _normalize_text(query)
    light_cues = ["bat den", "khong bat den", "khong su dung den", "den chieu sang", "ban dem"]
    if not any(cue in normalized_query for cue in light_cues):
        return []

    canonical = "không sử dụng đèn chiếu sáng trong thời gian từ 18 giờ ngày hôm trước đến 06 giờ ngày hôm sau"

    variants = [canonical]
    if "xe may" in normalized_query or "mo to" in normalized_query:
        variants.extend([
            f"người điều khiển xe máy {canonical} bị phạt bao nhiêu",
            f"xe máy không bật đèn ban đêm bị phạt bao nhiêu",
        ])
    else:
        variants.extend([
            f"phương tiện không bật đèn ban đêm bị phạt bao nhiêu",
            f"không sử dụng đèn chiếu sáng ban đêm bị xử phạt thế nào",
        ])

    return variants


def _build_query_variants(query: str) -> list[str]:
    variants = [query.strip()]
    variants.extend(_build_alcohol_query_variants(query))
    variants.extend(_build_speed_query_variants(query))
    variants.extend(_build_lighting_query_variants(query))

    deduped: list[str] = []
    seen: set[str] = set()
    for variant in variants:
        cleaned = re.sub(r"\s+", " ", variant).strip()
        if cleaned and cleaned not in seen:
            seen.add(cleaned)
            deduped.append(cleaned)
    return deduped


def _repair_chroma_collection_configs(chroma_dir: str) -> None:
    """Backfill missing collection config JSON for older local Chroma databases."""
    if CollectionConfigurationInternal is None:
        return

    sqlite_path = os.path.join(chroma_dir, "chroma.sqlite3")
    if not os.path.exists(sqlite_path):
        return

    default_config_json = CollectionConfigurationInternal().to_json_str()

    with sqlite3.connect(sqlite_path) as connection:
        cursor = connection.cursor()
        cursor.execute("SELECT id, config_json_str FROM collections")
        pending_updates: list[tuple[str, str]] = []

        for collection_id, config_json_str in cursor.fetchall():
            if not config_json_str or not config_json_str.strip():
                pending_updates.append((default_config_json, collection_id))
                continue

            try:
                parsed = json.loads(config_json_str)
            except json.JSONDecodeError:
                pending_updates.append((default_config_json, collection_id))
                continue

            if not isinstance(parsed, dict) or "_type" not in parsed:
                pending_updates.append((default_config_json, collection_id))

        if pending_updates:
            cursor.executemany(
                "UPDATE collections SET config_json_str = ? WHERE id = ?",
                pending_updates,
            )
            connection.commit()


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
    _repair_chroma_collection_configs(CHROMA_DIR)
    client = chromadb.PersistentClient(path=CHROMA_DIR)
    collection = client.get_collection(COLLECTION_NAME)

    query_variants = _build_query_variants(query)
    query_vectors = embed(query_variants)

    # Retrieve a wider candidate pool first, then filter by inferred vehicle/subject type.
    candidate_k = max(top_k * 4, top_k)
    results = collection.query(
        query_embeddings=query_vectors,
        n_results=candidate_k,
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

    ranked_chunks = sorted(merged.values(), key=lambda item: item["score"], reverse=True)

    all_rules = _get_all_rules()
    inferred_subject = _infer_subject_type_from_query(query, all_rules)
    if inferred_subject:
        subject_chunks = _filter_chunks_by_subject(ranked_chunks, inferred_subject, all_rules)
        if subject_chunks:
            return subject_chunks[:top_k]

    return ranked_chunks[:top_k]


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
