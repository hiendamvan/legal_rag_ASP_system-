# Legal RAG System for Vietnamese Law Documents

Hệ thống gồm 4 phần chính:

- `index.py`: đọc file `.docx`, chunk theo `Điều x`, embedding và lưu vào ChromaDB.
- Hỗ trợ embedding trực tiếp từ Hugging Face bằng `sentence-transformers`, mặc định dùng `AITeamVN/Vietnamese_Embedding`.
- `retrieve.py`: nhận câu hỏi, embedding query và truy xuất các điều luật liên quan.
- `generate.py`: gọi `retrieve`, sau đó gửi câu hỏi + ngữ cảnh sang LLM để sinh câu trả lời.
- `app.py`: giao diện Streamlit hiện đại, thân thiện.

## 1. Cài đặt

```bash
pip install -r requirements.txt
cp .env.example .env
```

## 2. Cấu hình

### Cách A - dùng trực tiếp model trên Hugging Face

Mặc định project đã cấu hình để dùng model `AITeamVN/Vietnamese_Embedding` từ Hugging Face qua `sentence-transformers`. Theo model card, model này được fine-tune từ BGE-M3, có `max sequence length = 2048`, `output dimensionality = 1024`, và được thiết kế cho retrieval tiếng Việt. citeturn0view0

```env
EMBEDDING_PROVIDER=sentence_transformers
EMBEDDING_MODEL=AITeamVN/Vietnamese_Embedding
HF_HOME=./hf_cache
EMBEDDING_MAX_SEQ_LENGTH=2048
EMBEDDING_NORMALIZE=true
```

Lần chạy đầu tiên, model sẽ tự tải từ Hugging Face về cache local. Bạn cũng có thể tải sẵn về một thư mục rồi cấu hình:

```env
EMBEDDING_LOCAL_PATH=./models/AITeamVN_Vietnamese_Embedding
```

### Cách B - embedding server tự host

Nếu sau này bạn self-host model qua API kiểu OpenAI-compatible thì chỉ cần đổi lại:

```env
EMBEDDING_PROVIDER=openai_compatible
EMBEDDING_MODEL=AITeamVN/Vietnamese_Embedding
EMBEDDING_API_BASE=http://localhost:8000/v1
EMBEDDING_API_KEY=dummy
```

### LLM

LLM mặc định dùng Gemini qua `GEMINI_API_KEY`.

## 3. Index dữ liệu

```bash
python index.py --file /duong_dan/toi/van_ban_luat.docx
```

## 4. Retrieve thử

```bash
python retrieve.py --query "Chạy quá tốc độ từ 5 km/h đến dưới 10 km/h bị phạt thế nào?" --top_k 5
```

## 5. Generate câu trả lời

```bash
python generate.py --query "Chạy quá tốc độ từ 5 km/h đến dưới 10 km/h bị phạt thế nào?" --top_k 5
```

## 6. Chạy giao diện

```bash
streamlit run app.py
```

## 7. Mở rộng

### Đổi embedding provider
- Thêm client mới trong `embedding_clients/`
- Sửa `embedding_factory.py`

### Đổi LLM provider
- Thêm client mới trong `llm_clients/`
- Sửa `llm_factory.py`

## 8. Lưu ý về chunking

Code hiện chunk theo regex `Điều <số>`. Nếu văn bản của bạn có cấu trúc đặc biệt hơn như:
- `Điều 6.`
- `Điều 6:`
- `Điều 6a`
- `Điều 6/1`

thì regex hiện tại vẫn xử lý được phần lớn trường hợp. Với văn bản phức tạp hơn, bạn có thể mở rộng trong `utils/docx_loader.py`.

## 9. Ghi chú riêng cho AITeamVN/Vietnamese_Embedding

Model card của `AITeamVN/Vietnamese_Embedding` cho biết cách dùng chuẩn là nạp bằng `SentenceTransformer("AITeamVN/Vietnamese_Embedding")`. Model được gắn nhãn `sentence-transformers`, có kích thước đầu ra 1024 chiều và ví dụ sử dụng dùng phép nhân dot product giữa embedding query và document. citeturn0view0

Ví dụ test nhanh độc lập:

```python
from sentence_transformers import SentenceTransformer

model = SentenceTransformer("AITeamVN/Vietnamese_Embedding")
model.max_seq_length = 2048

emb_q = model.encode(["Chạy quá tốc độ bị phạt thế nào?"], normalize_embeddings=True)
emb_d = model.encode(["Điều 6. Phạt tiền từ 800.000 đồng đến 1.000.000 đồng ..."], normalize_embeddings=True)
print(emb_q.shape, emb_d.shape)
```


## Chunking văn bản luật

Hệ thống hiện chunk theo quy tắc:
- Ưu tiên tách theo `Điều X.`
- Nếu một điều ngắn hơn `CHUNK_MAX_CHARS` thì giữ nguyên cả điều
- Nếu điều quá dài thì tách tiếp theo `Khoản 1., 2., 3., ...`
- Nếu một khoản vẫn quá dài thì tiếp tục tách theo `điểm a), b), c)...`
- Hỗ trợ cả file `.docx` và `.doc` (file `.doc` sẽ được tự chuyển sang `.docx` bằng LibreOffice headless)
