"""Load and chunk Vietnamese legal documents at the điểm (point) level."""

import re
import shutil
import subprocess
import tempfile
from pathlib import Path


# ---------------------------------------------------------------------------
# File loading
# ---------------------------------------------------------------------------

def _convert_doc_to_docx(doc_path: Path) -> str:
    """Convert a .doc file to .docx. Returns path to the converted file."""
    out_dir = tempfile.mkdtemp()

    for exe in ("libreoffice", "soffice"):
        libreoffice = shutil.which(exe)
        if libreoffice:
            result = subprocess.run(
                [libreoffice, "--headless", "--convert-to", "docx",
                 "--outdir", out_dir, str(doc_path)],
                capture_output=True, text=True,
            )
            if result.returncode == 0:
                out_file = Path(out_dir) / (doc_path.stem + ".docx")
                if out_file.exists():
                    return str(out_file)

    try:
        import win32com.client  # type: ignore
        out_path = str(Path(out_dir) / (doc_path.stem + ".docx"))
        word = win32com.client.Dispatch("Word.Application")
        word.Visible = False
        document = word.Documents.Open(str(doc_path.resolve()))
        document.SaveAs2(out_path, FileFormat=16)
        document.Close()
        word.Quit()
        return out_path
    except ImportError:
        pass

    raise RuntimeError(
        f"Cannot convert '{doc_path.name}' from .doc to .docx.\n"
        "Install LibreOffice or pywin32, or manually save the file as .docx first."
    )


def load_paragraphs(file_path: str) -> list[str]:
    """Return non-empty paragraphs from a .doc or .docx file."""
    from docx import Document  # python-docx

    path = Path(file_path)
    if not path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")

    if path.suffix.lower() == ".doc":
        docx_path = _convert_doc_to_docx(path)
    elif path.suffix.lower() == ".docx":
        docx_path = str(path)
    else:
        raise ValueError(f"Unsupported file type: {path.suffix}")

    doc = Document(docx_path)
    return [p.text.strip() for p in doc.paragraphs if p.text.strip()]


def load_text(file_path: str) -> str:
    """Return full plain text of a .doc or .docx file (paragraphs joined by newline)."""
    return "\n".join(load_paragraphs(file_path))


# ---------------------------------------------------------------------------
# Hierarchical chunker: Mục → Điều → Khoản → Điểm
# ---------------------------------------------------------------------------

# Patterns
_RE_MUC   = re.compile(r'^Mục\s+(\d+)[\.:]?\s*(.*)')
_RE_DIEU  = re.compile(r'^Điều\s+(\d+)[\.:\s](.*)')
_RE_KHOAN = re.compile(r'^(\d+)\.\s+(.*)')
# Điểm: a), b), c) ... đ), e) ...  (Vietnamese includes đ)
_RE_DIEM  = re.compile(r'^([a-zđ])\)\s+(.*)')


def chunk_hierarchical(paragraphs: list[str], source: str = "") -> list[dict]:
    """
    Parse a list of paragraphs into fine-grained chunks at the điểm level.

    Hierarchy:  Mục → Điều → Khoản → Điểm

    Each chunk dict contains:
        muc_num      int    — Mục number (0 if none)
        muc_title    str    — Mục title text
        dieu_num     int    — Điều number
        dieu_title   str    — Full Điều heading line
        khoan_num    int    — Khoản number (0 if unnumbered intro khoản)
        khoan_intro  str    — Intro sentence of the khoản (≤ 300 chars stored)
        diem         str    — Point letter: "a", "b", "c", ... ("" for khoản-level chunks)
        diem_text    str    — Text of the điểm (or full khoản text for khoản-level chunks)
        breadcrumb   str    — "Mục 1 > Điều 6 > Khoản 1 > Điểm c)"
        source       str    — Source filename
        full_text    str    — Complete contextual text used for embedding and LLM
    """
    chunks: list[dict] = []

    # --- current hierarchy context ---
    muc_num, muc_title  = 0, ""
    dieu_num, dieu_title = 0, ""
    khoan_num           = 0
    khoan_intro_parts: list[str] = []

    # --- current điểm accumulator ---
    cur_diem: str | None = None   # letter, or None when no active điểm
    cur_diem_parts: list[str] = []
    khoan_had_diem = False        # did this khoản produce any điểm chunks?

    # ---- helpers ----

    def _khoan_intro() -> str:
        return " ".join(khoan_intro_parts).strip()

    def _build_full_text(letter: str, body: str) -> str:
        parts = []
        if muc_num:
            parts.append(f"Mục {muc_num}. {muc_title}")
        if dieu_num:
            parts.append(dieu_title or f"Điều {dieu_num}.")
        ki = _khoan_intro()
        if ki:
            prefix = f"{khoan_num}. " if khoan_num else ""
            parts.append(f"{prefix}{ki}")
        if letter:
            parts.append(f"{letter}) {body}")
        else:
            # khoản-level chunk: body IS the khoản intro, already added above
            if not ki:
                parts.append(body)
        return "\n".join(parts)

    def _build_breadcrumb(letter: str) -> str:
        parts = []
        if muc_num:
            parts.append(f"Mục {muc_num}")
        if dieu_num:
            parts.append(f"Điều {dieu_num}")
        if khoan_num:
            parts.append(f"Khoản {khoan_num}")
        if letter:
            parts.append(f"Điểm {letter})")
        return " > ".join(parts)

    def _emit(letter: str, body: str) -> None:
        body = body.strip()
        if not body:
            return
        chunks.append({
            "muc_num":     muc_num,
            "muc_title":   muc_title,
            "dieu_num":    dieu_num,
            "dieu_title":  (dieu_title or f"Điều {dieu_num}.")[:300],
            "khoan_num":   khoan_num,
            "khoan_intro": _khoan_intro()[:300],
            "diem":        letter,
            "diem_text":   body,
            "breadcrumb":  _build_breadcrumb(letter),
            "source":      source,
            "full_text":   _build_full_text(letter, body),
        })

    def flush_diem() -> None:
        nonlocal cur_diem, cur_diem_parts, khoan_had_diem
        if cur_diem_parts:
            _emit(cur_diem or "", " ".join(cur_diem_parts))
            if cur_diem:
                khoan_had_diem = True
        cur_diem = None
        cur_diem_parts = []

    def flush_khoan_if_standalone() -> None:
        """Emit the khoản intro as a chunk only if no điểm items were produced."""
        nonlocal khoan_intro_parts, khoan_had_diem
        if khoan_intro_parts and not khoan_had_diem:
            _emit("", _khoan_intro())
        khoan_intro_parts = []
        khoan_had_diem = False

    def reset_khoan(num: int, intro_first_line: str) -> None:
        nonlocal khoan_num, khoan_intro_parts, khoan_had_diem
        flush_diem()
        flush_khoan_if_standalone()
        khoan_num = num
        khoan_intro_parts = [intro_first_line] if intro_first_line else []
        khoan_had_diem = False

    # ---- main loop ----

    for para in paragraphs:
        # ── Mục ──────────────────────────────────────────────────────────
        m = _RE_MUC.match(para)
        if m:
            flush_diem()
            flush_khoan_if_standalone()
            muc_num   = int(m.group(1))
            muc_title = m.group(2).strip()
            dieu_num, dieu_title = 0, ""
            khoan_num = 0
            khoan_intro_parts = []
            khoan_had_diem = False
            cur_diem = None
            cur_diem_parts = []
            continue

        # ── Điều ─────────────────────────────────────────────────────────
        m = _RE_DIEU.match(para)
        if m:
            flush_diem()
            flush_khoan_if_standalone()
            dieu_num   = int(m.group(1))
            dieu_title = para               # full heading in one paragraph
            khoan_num  = 0
            khoan_intro_parts = []
            khoan_had_diem = False
            cur_diem = None
            cur_diem_parts = []
            continue

        # ── Khoản (numbered) ─────────────────────────────────────────────
        m = _RE_KHOAN.match(para)
        if m:
            reset_khoan(int(m.group(1)), m.group(2).strip())
            continue

        # ── Điểm  ────────────────────────────────────────────────────────
        m = _RE_DIEM.match(para)
        if m:
            flush_diem()
            cur_diem       = m.group(1)
            cur_diem_parts = [m.group(2).strip()]
            continue

        # ── Continuation / intro text ────────────────────────────────────
        if cur_diem is not None:
            # Multi-line điểm text
            cur_diem_parts.append(para)
        elif dieu_num:
            # Text between Điều header and first khoản/điểm → khoản intro
            khoan_intro_parts.append(para)
        # else: preamble before first Điều — skip

    # Flush whatever remains
    flush_diem()
    flush_khoan_if_standalone()

    return chunks


def chunk_by_dieu(paragraphs_or_text, source: str = "") -> list[dict]:
    """
    Compatibility wrapper — delegates to chunk_hierarchical.
    Accepts either a list of paragraph strings or a single joined string.
    """
    if isinstance(paragraphs_or_text, str):
        paras = [p.strip() for p in paragraphs_or_text.split("\n") if p.strip()]
    else:
        paras = paragraphs_or_text
    return chunk_hierarchical(paras, source=source)
