# Legal RAG + ASP System — Nghị định 168/2024/NĐ-CP

Hệ thống hỏi đáp pháp luật giao thông đường bộ kết hợp hai pipeline độc lập:

- **Pipeline RAG**: Retrieve → LLM (Gemini / OpenAI) sinh câu trả lời tự nhiên
- **Pipeline ASP**: Retrieve → match rule → LLM trích xuất facts → clingo suy luận vi phạm & mức phạt

---

## Cấu trúc dự án

```
legal_rag_ASP_system-/
├── data/
│   └── nghidinh_168_2024.doc(x)     # Văn bản luật gốc
│
├── legal_knowlegde/
│   ├── nd168_kb.lp              # Knowledge base ASP (Chương II)
│   ├── reasoning.lp                 # Luật suy luận clingo
│   ├── case_fact.lp                 # Ví dụ case fact thủ công
│   ├── run_clingo.py                # Chạy clingo độc lập
│   └── asp_rule_loader.py           # Parse .lp → dict; match chunk → rules
│
├── model/
│   └── call_llm.py                  # Gọi LLM local (localhost:8000)
│
├── utils/
│   └── docx_loader.py               # Đọc .doc/.docx, chunk phân cấp Điều→Khoản→Điểm
│
├── embedder.py                      # Wrapper AITeamVN/Vietnamese_Embedding
├── index.py                         # Index văn bản vào ChromaDB
├── retrieve.py                      # Truy vấn ChromaDB
├── generate.py                      # Pipeline RAG (Gemini / OpenAI)
├── asp_pipeline.py                  # Pipeline ASP (retrieve → rules → LLM → clingo)
├── app.py                           # Giao diện Streamlit (2 tab)
│
├── llm_finetuning/                  # Script finetune Qwen3-1.7B
├── requirements.txt
├── .env.example
└── .env                             # Cấu hình (tự tạo từ .env.example)
```

---

## Cài đặt

```bash
pip install -r requirements.txt
cp .env.example .env
```

Chỉnh `.env`:

```env
# LLM cho pipeline RAG
LLM_PROVIDER=gemini          # hoặc openai
GEMINI_API_KEY=...
GEMINI_MODEL=gemini-2.0-flash

OPENAI_API_KEY=...
OPENAI_MODEL=gpt-4o-mini

# Embedding
EMBEDDING_MODEL=AITeamVN/Vietnamese_Embedding
EMBEDDING_MAX_SEQ_LENGTH=2048
EMBEDDING_NORMALIZE=true
HF_HOME=./hf_cache

# ChromaDB
CHROMA_DIR=./chroma_db
COLLECTION_NAME=legal_docs
```

> Pipeline ASP dùng model local `hdv2709/qwen_finetune` tại `localhost:8000` — không cần API key.

Link model on Hugging face: https://huggingface.co/hdv2709/qwen_finetune
---

## Sử dụng

### 1. Index văn bản (chạy 1 lần)

```bash
python index.py --file data/nghidinh_168_2024.doc
```

File `.doc` sẽ tự động chuyển sang `.docx` qua LibreOffice hoặc Microsoft Word (pywin32). Nếu chưa cài, hãy tự convert thủ công sang `.docx` trước.

### 2. Pipeline RAG (CLI)

```bash
# Retrieve thử
python retrieve.py --query "Chạy quá tốc độ bị phạt thế nào?" --top_k 5

# Sinh câu trả lời bằng Gemini
python generate.py --query "Vượt đèn đỏ phạt bao nhiêu tiền?"

# Dùng OpenAI thay thế
python generate.py --query "Vượt đèn đỏ phạt bao nhiêu tiền?" --provider openai
```

### 3. Pipeline ASP (CLI)

```bash
# Chạy pipeline đầy đủ
python asp_pipeline.py --query "Người đi bộ qua đường không bảo đảm an toàn?"

# Xem chi tiết từng bước (matched rules, LLM prompt, facts, ASP code)
python asp_pipeline.py --query "..." --verbose
```

### 4. Giao diện Streamlit

```bash
streamlit run app.py
```

Giao diện có 2 tab:
- **RAG Chat** — hỏi đáp tự nhiên, hiển thị điều luật nguồn
- **ASP Reasoning** — phân tích vi phạm, trả về mức phạt từ clingo

---

## Kiến trúc hệ thống

### Pipeline RAG

```
Câu hỏi
  → embed (AITeamVN/Vietnamese_Embedding)
  → ChromaDB query → top-k Điểm/Khoản
  → prompt + context → Gemini / OpenAI
  → Câu trả lời tự nhiên
```

### Pipeline ASP

```
Câu hỏi
  → embed → ChromaDB → top-k chunks
  → match chunk metadata → ASP rules (nd168_kb.lp)
  → build prompt (câu hỏi + rules JSON)
  → call_llm() → hdv2709/qwen_finetune (localhost:8000)
  → parse JSON facts
  → facts_to_asp() → driver_type / did_action / has_context
  → clingo (nd168_kb.lp + facts + reasoning.lp)
  → result(rule_id, fine_min, fine_max)
```

### Chunking phân cấp

Văn bản được chunk tại cấp **Điểm** (nhỏ nhất), giữ nguyên context đầy đủ:

```
Mục 1. VI PHẠM QUY TẮC GIAO THÔNG...
  Điều 6. Xử phạt người điều khiển xe ô tô...
    Khoản 1. Phạt tiền từ 400.000đ đến 600.000đ...
      → Chunk: Điểm a) Không chấp hành biển báo...
      → Chunk: Điểm b) Không có tín hiệu khi ra/vào...
      → Chunk: Điểm c) Không báo hiệu đèn khẩn cấp...
```

Mỗi chunk lưu đầy đủ metadata: `muc_num`, `dieu_num`, `khoan_num`, `diem`, `breadcrumb`, `diem_text`, `khoan_intro`.

---

## Mô hình sử dụng

| Thành phần | Model | Nguồn |
|---|---|---|
| Embedding | `AITeamVN/Vietnamese_Embedding` | Hugging Face (tự tải) |
| LLM RAG | `gemini-2.0-flash` hoặc `gpt-4o-mini` | Gemini / OpenAI API |
| LLM ASP | `hdv2709/qwen_finetune` | Local server :8000 |
| Reasoning | clingo (ASP solver) | `pip install clingo` |
| Vector DB | ChromaDB | Local persistent |

---

## Yêu cầu bổ sung

- **Chạy pipeline ASP**: cần server LLM local tại `localhost:8000` (OpenAI-compatible API), ví dụ chạy qua `vllm` hoặc `ollama`.
- **Convert .doc**: cần LibreOffice (`libreoffice --headless`) hoặc Microsoft Word + `pywin32`.
