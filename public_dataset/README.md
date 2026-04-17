# Public Dataset — Nghị định 168/2024/NĐ-CP

Tập dữ liệu hỏi đáp pháp luật giao thông đường bộ được xây dựng từ **Nghị định 168/2024/NĐ-CP** về xử phạt vi phạm hành chính trong lĩnh vực giao thông đường bộ.

---

## Tổng quan

| | Train | Test | Tổng |
|---|---|---|---|
| **Số mẫu** | 1.000 | 200 | 1.200 |
| **Tỉ lệ** | ~83% | ~17% | 100% |

Dữ liệu được **shuffle ngẫu nhiên** (seed = 42) trước khi chia để đảm bảo phân phối đồng đều giữa hai tập.

---

## Cấu trúc mỗi mẫu

```json
{
  "id": "official_00001",
  "question_type": "simple",
  "instruction": "...",
  "input": {
    "question": "...",
    "retrieved_rules": [
      {
        "rule_id": "d7_k5_c",
        "subject": "motorbike",
        "action": "fail_to_yield_when_turning",
        "context": [],
        "exception": [],
        "fine_min": 800000,
        "fine_max": 1000000
      }
    ]
  },
  "output": {
    "facts": [
      {
        "predicate": "case_subject_type",
        "args": ["user1", "motorbike"]
      },
      {
        "predicate": "case_action",
        "args": ["user1", "fail_to_yield_when_turning"]
      }
    ]
  },
  "text_answer": "Người điều khiển xe mô tô rẽ xe không nhường đường sẽ bị phạt từ 800.000 đồng đến 1.000.000 đồng."
}
```

| Trường | Mô tả |
|---|---|
| `id` | Chỉ số mẫu |
| `question_type` | Loại câu hỏi |
| `input.question` | Câu hỏi tình huống vi phạm |
| `input.retrieved_rules` | Tập luật gồm rule đúng + nhiễu |
| `output.facts` | Fact trích xuất |
| `text_answer` | Câu trả lời cuối cùng |

---

## Phân phối loại câu hỏi

| Loại câu hỏi | Mô tả | Train | Test |
|---|---|---|---|
| `simple` | Hỏi thẳng một hành vi vi phạm | 300 | 60 |
| `quantitative_context` | Hỏi về mức phạt, con số cụ thể | 250 | 50 |
| `complex_multi_hop` | Nhiều hành vi vi phạm cùng lúc | 220 | 40 |
| `exception_handling` | Tình huống có ngoại lệ, không vi phạm | 180 | 30 |
| `insufficient_info` | Thiếu thông tin, không đủ cơ sở pháp lý | 50 | 20 |

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

- Tổng hợp từ các file JSON
- Bao phủ các điều từ **Điều 6 đến Điều 40** của Nghị định 168/2024/NĐ-CP
- Câu hỏi và đáp án được sinh tự động có kiểm duyệt

---

## Sử dụng

```python
import json

with open("train.json", encoding="utf-8") as f:
    train_data = json.load(f)

with open("test.json", encoding="utf-8") as f:
    test_data = json.load(f)
```
