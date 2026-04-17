# Public Dataset — Nghị định 168/2024/NĐ-CP

Tập dữ liệu hỏi đáp pháp luật giao thông đường bộ được xây dựng từ **Nghị định 168/2024/NĐ-CP** về xử phạt vi phạm hành chính trong lĩnh vực giao thông đường bộ.

---

## Tổng quan

| | Train | Test | Tổng |
|---|---|---|---|
| **Số mẫu** | 1.000 | 206 | 1.206 |
| **Tỉ lệ** | ~83% | ~17% | 100% |

Dữ liệu được **shuffle ngẫu nhiên** (seed = 42) trước khi chia để đảm bảo phân phối đồng đều giữa hai tập.

---

## Cấu trúc mỗi mẫu

```json
{
  "id": 0,
  "question_type": "simple",
  "question": "...",
  "relevant_articles": ["d13_k1", "d13_k2_a"],
  "distractor_articles": ["d13_k3_b"],
  "expected_answer": "..."
}
```

| Trường | Mô tả |
|---|---|
| `id` | Chỉ số nguyên, đánh từ 0 |
| `question_type` | Loại câu hỏi (xem bên dưới) |
| `question` | Câu hỏi tình huống vi phạm |
| `relevant_articles` | Danh sách điều/khoản/điểm liên quan trực tiếp |
| `distractor_articles` | Điều/khoản dễ nhầm lẫn (dùng để đánh giá retrieval) |
| `expected_answer` | Câu trả lời chuẩn gồm kết luận vi phạm và mức phạt |

---

## Phân phối loại câu hỏi

| Loại câu hỏi | Mô tả | Train | Test |
|---|---|---|---|
| `simple` | Hỏi thẳng một hành vi vi phạm | 435 (43.5%) | 80 (38.8%) |
| `quantitative_context` | Hỏi về mức phạt, con số cụ thể | 173 (17.3%) | 27 (13.1%) |
| `complex_multi_hop` | Nhiều hành vi vi phạm cùng lúc | 138 (13.8%) | 36 (17.5%) |
| `exception_handling` | Tình huống có ngoại lệ, không vi phạm | 133 (13.3%) | 32 (15.5%) |
| `insufficient_info` | Thiếu thông tin, không đủ cơ sở pháp lý | 121 (12.1%) | 31 (15.0%) |

---

## Phân phối điều luật (Top 10 — Train)

| Điều | Số lượt xuất hiện (train) |
|---|---|
| Điều 7 (xe mô tô, xe gắn máy) | 192 |
| Điều 32 (chủ phương tiện) | 136 |
| Điều 13 (điều kiện xe ô tô) | 122 |
| Điều 9 (xe đạp, xe thô sơ) | 91 |
| Điều 39 (đào tạo, sát hạch lái xe) | 77 |
| Điều 6 (quy tắc xe ô tô) | 69 |
| Điều 18 (vận tải hành khách) | 55 |
| Điều 20 (xe khách, xe buýt) | 50 |
| Điều 8 (xe máy chuyên dùng) | 49 |
| Điều 26 (vận tải hàng hóa) | 48 |

---

## Nguồn gốc dữ liệu

- Tổng hợp từ **17 file JSON** trong thư mục `data/test_data/`
- Bao phủ các điều từ **Điều 6 đến Điều 40** của Nghị định 168/2024/NĐ-CP
- Câu hỏi và đáp án được sinh tự động có kiểm duyệt, bám sát nội dung văn bản pháp luật

---

## Sử dụng

```python
import json

with open("train.json", encoding="utf-8") as f:
    train_data = json.load(f)

with open("test.json", encoding="utf-8") as f:
    test_data = json.load(f)
```
