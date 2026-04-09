"""
asp_rule_loader.py — Parse chuong2_full.lp into a Python dict of rule objects,
and match retrieved chunk metadata to those rules.
"""

import re
from pathlib import Path

_DEFAULT_LP = Path(__file__).parent / "chuong2_full.lp"


# ---------------------------------------------------------------------------
# Parser
# ---------------------------------------------------------------------------

def load_rules(lp_path: str | None = None) -> dict[str, dict]:
    """
    Parse an ASP knowledge-base .lp file and return:
        { rule_id: { rule_id, article, clause, point,
                     subject, action, context, exception_ref,
                     fine_min, fine_max, original_vi_text } }
    """
    path = Path(lp_path) if lp_path else _DEFAULT_LP
    lines = path.read_text(encoding="utf-8").splitlines()

    rules: dict[str, dict] = {}

    for raw in lines:
        line = raw.strip()
        if not line or line.startswith("%"):
            continue

        # rule(id).
        m = re.fullmatch(r'rule\((\w+)\)\.', line)
        if m:
            rid = m.group(1)
            rules.setdefault(rid, _empty_rule(rid))
            continue

        # article(id, N).
        m = re.fullmatch(r'article\((\w+),(\d+)\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["article"] = int(m.group(2))
            continue

        # clause(id, N).
        m = re.fullmatch(r'clause\((\w+),(\d+)\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["clause"] = int(m.group(2))
            continue

        # point(id, "x").
        m = re.fullmatch(r'point\((\w+),"([^"]+)"\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["point"] = m.group(2)
            continue

        # subject(id, val).
        m = re.fullmatch(r'subject\((\w+),(\w+)\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["subject"] = m.group(2)
            continue

        # action(id, val).
        m = re.fullmatch(r'action\((\w+),(\w+)\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["action"] = m.group(2)
            continue

        # context(id, ctx).
        m = re.fullmatch(r'context\((\w+),(\w+)\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["context"].append(m.group(2))
            continue

        # exception_ref(id, art, clause, "point").
        m = re.match(r'exception_ref\((\w+),(.+)\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["exception_ref"].append(m.group(2).strip())
            continue

        # fine_min(id, N).
        m = re.fullmatch(r'fine_min\((\w+),(\d+)\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["fine_min"] = int(m.group(2))
            continue

        # fine_max(id, N).
        m = re.fullmatch(r'fine_max\((\w+),(\d+)\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["fine_max"] = int(m.group(2))
            continue

        # original_vi_text(id, "...").  — value may contain commas/quotes
        m = re.match(r'original_vi_text\((\w+),"(.+)"\)\.', line)
        if m and m.group(1) in rules:
            rules[m.group(1)]["original_vi_text"] = m.group(2)
            continue

    return rules


def _empty_rule(rid: str) -> dict:
    return {
        "rule_id":          rid,
        "article":          0,
        "clause":           0,
        "point":            "",
        "subject":          "",
        "action":           "",
        "context":          [],
        "exception_ref":    [],
        "fine_min":         0,
        "fine_max":         0,
        "original_vi_text": "",
    }


# ---------------------------------------------------------------------------
# Matcher: chunk metadata → ASP rules
# ---------------------------------------------------------------------------

def _normalize_diem(diem: str) -> str:
    """Map Vietnamese điểm letter to the point label used in the ASP file."""
    # "đ" in Vietnamese → stored as "dd" in the .lp point field
    return "dd" if diem == "đ" else diem.lower()


def match_chunk_to_rules(chunk_meta: dict, all_rules: dict) -> list[dict]:
    """
    Given a chunk's metadata dict (dieu_num, khoan_num, diem),
    return all ASP rules that cover the same article/clause/point.

    Matching logic:
      - article must equal dieu_num
      - if khoan_num > 0: clause must match
      - if diem is set: point must match (after normalization)
      - if diem is "" (khoản-level chunk): return all rules under that khoản
    """
    dieu_num  = int(chunk_meta.get("dieu_num") or 0)
    khoan_num = int(chunk_meta.get("khoan_num") or 0)
    diem      = str(chunk_meta.get("diem") or "")
    diem_norm = _normalize_diem(diem) if diem else ""

    matched = []
    for rule in all_rules.values():
        if rule["article"] != dieu_num:
            continue
        if khoan_num and rule["clause"] != khoan_num:
            continue
        if diem_norm:
            rule_point = rule["point"].lower()
            # Some rules share a point but have a sub-index (_1, _2) in their ID
            # e.g. d6_k2_d_1, d6_k2_d_2 both have point "d"
            if rule_point != diem_norm:
                continue
        matched.append(rule)

    return matched
