"""Load and chunk Vietnamese legal documents by article (Điều)."""

import re
import shutil
import subprocess
import tempfile
from pathlib import Path


def _convert_doc_to_docx(doc_path: Path) -> str:
    """Convert a .doc file to .docx. Returns path to the converted file."""
    out_dir = tempfile.mkdtemp()

    # Try LibreOffice headless (cross-platform)
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

    # Try win32com on Windows (requires pywin32)
    try:
        import win32com.client  # type: ignore
        out_path = str(Path(out_dir) / (doc_path.stem + ".docx"))
        word = win32com.client.Dispatch("Word.Application")
        word.Visible = False
        document = word.Documents.Open(str(doc_path.resolve()))
        document.SaveAs2(out_path, FileFormat=16)  # 16 = wdFormatXMLDocument
        document.Close()
        word.Quit()
        return out_path
    except ImportError:
        pass

    raise RuntimeError(
        f"Cannot convert '{doc_path.name}' from .doc to .docx.\n"
        "Please install LibreOffice (https://www.libreoffice.org/) or pywin32 "
        "(pip install pywin32), or manually convert the file to .docx first."
    )


def load_text(file_path: str) -> str:
    """Return the full plain text of a .doc or .docx file."""
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
    paragraphs = [para.text for para in doc.paragraphs]
    return "\n".join(paragraphs)


def chunk_by_dieu(text: str) -> list[dict]:
    """
    Split text into chunks, one per article (Điều).

    Each chunk is a dict:
        {
            "article_num": int,   # 0 for preamble
            "title": str,         # e.g. "Điều 6"
            "text": str,          # full text of that article
        }

    Splitting strategy:
      1. Split on 'Điều <number>' boundaries.
      2. If the article title line has additional text (the article heading)
         it is preserved as-is.
    """
    # Lookahead split so the delimiter stays at the start of each chunk
    pattern = r'(?=Điều\s+\d+[\.:\s])'
    parts = re.split(pattern, text)

    chunks: list[dict] = []
    for part in parts:
        part = part.strip()
        if not part:
            continue

        match = re.match(r'Điều\s+(\d+)', part)
        if match:
            article_num = int(match.group(1))
            # Extract heading: first line of the chunk
            first_line = part.split("\n")[0].strip()
            chunks.append({
                "article_num": article_num,
                "title": first_line or f"Điều {article_num}",
                "text": part,
            })
        else:
            # Preamble / non-article sections
            chunks.append({
                "article_num": 0,
                "title": "Phần mở đầu",
                "text": part,
            })

    return chunks
