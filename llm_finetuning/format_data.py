import json

input_path = "case_fact_official_dataset_1500.jsonl"
output_path = "case_fact_chat_format.jsonl"

def build_user_prompt(sample):
    question = sample["input"]["question"]
    rules = sample["input"]["retrieved_rules"]

    rules_str = json.dumps(rules, ensure_ascii=False, indent=2)

    prompt = f"""Bạn là hệ thống trích xuất legal case facts.

Nhiệm vụ:
- Đọc câu hỏi người dùng
- Chỉ sử dụng các rule được cung cấp
- Trích xuất case facts chuẩn hóa
- KHÔNG suy luận mức phạt

Câu hỏi:
{question}

Các rule liên quan:
{rules_str}

Trả về JSON với format:
{{
  "facts": [...]
}}
"""

    return prompt.strip()


def build_assistant_output(sample):
    return json.dumps(sample["output"], ensure_ascii=False)


with open(input_path, "r", encoding="utf-8") as f_in, \
     open(output_path, "w", encoding="utf-8") as f_out:

    for line in f_in:
        sample = json.loads(line)

        chat_sample = {
            "conversations": [
                {
                    "role": "user",
                    "content": build_user_prompt(sample)
                },
                {
                    "role": "assistant",
                    "content": build_assistant_output(sample)
                }
            ]
        }

        f_out.write(json.dumps(chat_sample, ensure_ascii=False) + "\n")

print("✅ Done convert to chat format")