"""
app.py — Streamlit chat interface for the Legal RAG system.

Run:
    streamlit run app.py
"""

import os

import streamlit as st
from dotenv import load_dotenv

load_dotenv()

# ---- Page config ----
st.set_page_config(
    page_title="Hỏi đáp Nghị định 168/2024",
    page_icon="⚖️",
    layout="wide",
)

# ---- Custom CSS ----
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
    </style>
    """,
    unsafe_allow_html=True,
)

# ---- Sidebar ----
with st.sidebar:
    st.title("⚖️ Cài đặt")
    top_k = st.slider("Số điều luật tham khảo (top_k)", min_value=1, max_value=10, value=5)

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
    active_model = _gemini_model if provider == "gemini" else _openai_model
    st.markdown(
        f"**Tài liệu:** Nghị định 168/2024/NĐ-CP  \n"
        f"**Embedding:** AITeamVN/Vietnamese_Embedding  \n"
        f"**LLM:** {provider.capitalize()} — `{active_model}`  \n"
        f"**Vector DB:** ChromaDB"
    )

    st.divider()
    if st.button("Xóa lịch sử hội thoại"):
        st.session_state.messages = []
        st.rerun()

# ---- Title ----
st.title("⚖️ Hỏi đáp Luật Giao thông — Nghị định 168/2024")
st.caption("Hệ thống RAG tra cứu và giải đáp các quy định xử phạt vi phạm giao thông đường bộ.")

# ---- Check index exists ----
chroma_dir = os.getenv("CHROMA_DIR", "./chroma_db")
if not os.path.exists(chroma_dir):
    st.warning(
        "Chưa có dữ liệu được index. Hãy chạy lệnh sau rồi khởi động lại:\n\n"
        "```bash\npython index.py --file nghidinh_168_2024.doc\n```",
        icon="⚠️",
    )

# ---- Session state ----
if "messages" not in st.session_state:
    st.session_state.messages = []

# ---- Render chat history ----
for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])
        if msg["role"] == "assistant" and show_sources and msg.get("sources"):
            with st.expander("Điều luật tham khảo"):
                for s in msg["sources"]:
                    score_pct = f"{s['score'] * 100:.1f}%"
                    title = s["metadata"]["title"]
                    preview = s["text"][:400] + ("..." if len(s["text"]) > 400 else "")
                    st.markdown(
                        f'<div class="source-box">'
                        f'<strong>{title}</strong>'
                        f'<span class="score-badge">relevance {score_pct}</span>'
                        f"<p style='margin-top:6px;white-space:pre-wrap'>{preview}</p>"
                        f"</div>",
                        unsafe_allow_html=True,
                    )

# ---- Chat input ----
if prompt := st.chat_input("Nhập câu hỏi về luật giao thông..."):
    # Show user message
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    # Generate answer
    with st.chat_message("assistant"):
        with st.spinner("Đang tra cứu và trả lời..."):
            try:
                from generate import generate

                answer, sources = generate(prompt, top_k=top_k, provider=provider)
            except Exception as e:
                answer = f"Lỗi: {e}"
                sources = []

        st.markdown(answer)

        if show_sources and sources:
            with st.expander("Điều luật tham khảo"):
                for s in sources:
                    score_pct = f"{s['score'] * 100:.1f}%"
                    title = s["metadata"]["title"]
                    preview = s["text"][:400] + ("..." if len(s["text"]) > 400 else "")
                    st.markdown(
                        f'<div class="source-box">'
                        f'<strong>{title}</strong>'
                        f'<span class="score-badge">relevance {score_pct}</span>'
                        f"<p style='margin-top:6px;white-space:pre-wrap'>{preview}</p>"
                        f"</div>",
                        unsafe_allow_html=True,
                    )

    st.session_state.messages.append(
        {"role": "assistant", "content": answer, "sources": sources}
    )
