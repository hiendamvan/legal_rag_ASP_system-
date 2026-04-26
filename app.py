"""
app.py — Streamlit interface for the Legal RAG system.
Two pipelines available via tabs:
  • Tab 1 — RAG Chat   : retrieve → Gemini/OpenAI answer
  • Tab 2 — ASP Reason : retrieve → match rules → local LLM → clingo

Run:
    streamlit run app.py
"""

import warnings
warnings.filterwarnings("ignore", message="Accessing `__path__` from")

import os
import re

import streamlit as st
from dotenv import load_dotenv

load_dotenv()

# ── Page config ──────────────────────────────────────────────────────────────
st.set_page_config(
    page_title="Hỏi đáp Nghị định 168/2024",
    page_icon="⚖️",
    layout="wide",
)

# ── CSS ──────────────────────────────────────────────────────────────────────
st.markdown(
    """
    <style>
    .source-box {
        background: #f0f2f6;
        border-left: 4px solid #4a90e2;
        padding: 10px 16px;
        border-radius: 4px;
        margin-bottom: 8px;
        font-size: 0.88rem;
    }
    .score-badge {
        background: #4a90e2;
        color: white;
        border-radius: 12px;
        padding: 2px 8px;
        font-size: 0.75rem;
        margin-left: 8px;
    }
    .rule-box {
        background: #f6fff0;
        border-left: 4px solid #2ecc71;
        padding: 10px 16px;
        border-radius: 4px;
        margin-bottom: 6px;
        font-size: 0.88rem;
        font-family: monospace;
    }
    .asp-box {
        background: #1e1e2e;
        color: #cdd6f4;
        padding: 12px 16px;
        border-radius: 6px;
        font-family: monospace;
        font-size: 0.85rem;
        white-space: pre-wrap;
    }
    .violation-box {
        background: #fff3cd;
        border-left: 4px solid #f39c12;
        padding: 10px 16px;
        border-radius: 4px;
        margin-bottom: 6px;
        font-size: 0.95rem;
    }
    </style>
    """,
    unsafe_allow_html=True,
)

# ── Sidebar ──────────────────────────────────────────────────────────────────
with st.sidebar:
    st.title("⚖️ Cài đặt")
    top_k = st.slider("Số điều luật tham khảo (top_k)", min_value=1, max_value=10, value=5)

    # RAG pipeline options
    st.subheader("RAG Pipeline")
    default_provider = os.getenv("LLM_PROVIDER", "gemini").lower()
    provider = st.selectbox(
        "LLM Provider",
        options=["gemini", "openai"],
        index=0 if default_provider == "gemini" else 1,
    )
    show_sources = st.checkbox("Hiển thị điều luật nguồn", value=True)

    st.divider()
    _gemini_model = os.getenv("GEMINI_MODEL", "gemini-2.0-flash")
    _openai_model = os.getenv("OPENAI_MODEL", "gpt-4o-mini")
    active_model  = _gemini_model if provider == "gemini" else _openai_model
    st.markdown(
        f"**Tài liệu:** Nghị định 168/2024/NĐ-CP  \n"
        f"**Embedding:** AITeamVN/Vietnamese_Embedding  \n"
        f"**RAG LLM:** {provider.capitalize()} — `{active_model}`  \n"
        f"**ASP LLM:** Local `hdv2709/qwen_finetune` :8000  \n"
        f"**Vector DB:** ChromaDB"
    )

    st.divider()
    if st.button("Xóa lịch sử hội thoại (RAG)"):
        st.session_state.messages = []
        st.rerun()

# ── Title ────────────────────────────────────────────────────────────────────
st.title("⚖️ Hỏi đáp Luật Giao thông — Nghị định 168/2024")

chroma_dir = os.getenv("CHROMA_DIR", "./chroma_db")
if not os.path.exists(chroma_dir):
    st.warning(
        "Chưa có dữ liệu được index. Hãy chạy:\n\n"
        "```bash\npython index.py --file nghidinh_168_2024.doc\n```",
        icon="⚠️",
    )

# ── Tabs ─────────────────────────────────────────────────────────────────────
tab_rag, tab_asp = st.tabs(["💬 RAG Chat", "🧠 ASP Reasoning"])


# ════════════════════════════════════════════════════════════════════════════
# TAB 1 — RAG Chat (existing pipeline)
# ════════════════════════════════════════════════════════════════════════════
with tab_rag:
    if "messages" not in st.session_state:
        st.session_state.messages = []

    def _render_sources(sources: list[dict]) -> None:
        for s in sources:
            m           = s["metadata"]
            breadcrumb  = m.get("breadcrumb", m.get("dieu_title", ""))
            diem_text   = m.get("diem_text", s["text"])
            khoan_intro = m.get("khoan_intro", "")
            score_pct   = f"{s['score'] * 100:.1f}%"
            preview     = diem_text[:400] + ("..." if len(diem_text) > 400 else "")
            ctx_line    = (
                f"<em style='color:#666'>{khoan_intro[:120]}...</em><br>"
                if khoan_intro else ""
            )
            st.markdown(
                f'<div class="source-box">'
                f'<strong>{breadcrumb}</strong>'
                f'<span class="score-badge">relevance {score_pct}</span>'
                f"<p style='margin-top:6px'>{ctx_line}"
                f"<span style='white-space:pre-wrap'>{preview}</span></p>"
                f"</div>",
                unsafe_allow_html=True,
            )

    # Render history
    for msg in st.session_state.messages:
        with st.chat_message(msg["role"]):
            st.markdown(msg["content"])
            if msg["role"] == "assistant" and show_sources and msg.get("sources"):
                with st.expander("Điều luật tham khảo"):
                    _render_sources(msg["sources"])

    # Chat input
    if prompt := st.chat_input("Nhập câu hỏi về luật giao thông...", key="rag_input"):
        st.session_state.messages.append({"role": "user", "content": prompt})
        with st.chat_message("user"):
            st.markdown(prompt)

        with st.chat_message("assistant"):
            with st.spinner("Đang tra cứu và trả lời..."):
                try:
                    from generate import generate
                    answer, sources = generate(prompt, top_k=top_k, provider=provider)
                except Exception as e:
                    answer  = f"Lỗi: {e}"
                    sources = []

            st.markdown(answer)
            if show_sources and sources:
                with st.expander("Điều luật tham khảo"):
                    _render_sources(sources)

        st.session_state.messages.append(
            {"role": "assistant", "content": answer, "sources": sources}
        )


# ════════════════════════════════════════════════════════════════════════════
# TAB 2 — ASP Reasoning pipeline
# ════════════════════════════════════════════════════════════════════════════
with tab_asp:
    st.caption(
        "Retrieve điều khoản liên quan → match ASP rules → "
        "LLM trích xuất case facts → clingo suy luận vi phạm & mức phạt."
    )

    asp_query = st.text_area(
        "Nhập tình huống vi phạm:",
        placeholder="Ví dụ: Người đi bộ qua đường không bảo đảm an toàn thì xử lý thế nào?",
        height=100,
        key="asp_query",
    )
    show_debug = st.checkbox("Hiển thị chi tiết trung gian (rules, facts, ASP code)", value=False)
    run_btn    = st.button("Phân tích vi phạm", type="primary")

    if run_btn and asp_query.strip():
        with st.spinner("Đang chạy pipeline ASP..."):
            try:
                from asp_pipeline import run_asp_pipeline
                result = run_asp_pipeline(asp_query.strip(), top_k=top_k)
            except Exception as e:
                st.error(f"Lỗi pipeline: {e}")
                result = None

        if result:
            # ── Error ──
            if "error" in result:
                st.error(result["error"])

            # ── Kết quả vi phạm ──
            st.subheader("Kết quả suy luận")
            if result["reasoning_results"]:
                for atom in result["reasoning_results"]:
                    m = re.match(r'result\((\w+),(\d+),(\d+)\)', atom)
                    if m:
                        rid  = m.group(1)
                        fmin = int(m.group(2))
                        fmax = int(m.group(3))
                        st.markdown(
                            f'<div class="violation-box">'
                            f"<strong>Vi phạm:</strong> <code>{rid}</code> &nbsp;→&nbsp; "
                            f"Phạt <strong>{fmin:,}đ – {fmax:,}đ</strong>"
                            f"</div>",
                            unsafe_allow_html=True,
                        )
                    else:
                        st.code(atom)
            else:
                st.info("Không xác định được vi phạm từ tình huống trên.")

            # ── Debug info ──
            if show_debug:
                with st.expander("ASP Rules được match"):
                    for r in result["matched_rules"]:
                        ctx = ", ".join(r["context"]) or "—"
                        st.markdown(
                            f'<div class="rule-box">'
                            f"<strong>{r['rule_id']}</strong> &nbsp;|&nbsp; "
                            f"subject=<em>{r['subject']}</em> &nbsp; "
                            f"action=<em>{r['action']}</em> &nbsp; "
                            f"context=<em>{ctx}</em>"
                            f"</div>",
                            unsafe_allow_html=True,
                        )

                with st.expander("LLM Raw Output"):
                    st.text(result.get("llm_raw", ""))

                with st.expander("Case Facts JSON"):
                    st.json(result.get("facts_json", []))

                with st.expander("ASP Facts (.lp) được sinh"):
                    st.markdown(
                        f'<div class="asp-box">{result.get("asp_facts", "")}</div>',
                        unsafe_allow_html=True,
                    )

                with st.expander("LLM Prompt đầy đủ"):
                    st.text(result.get("llm_prompt", ""))
