from datasets import load_dataset
import json

# Thay bằng tên dataset bạn muốn
dataset_name = "hdv2709/case_fact_legal_chat_format"   # ví dụ

# Load chỉ split test
dataset = load_dataset(dataset_name, split="test")

# Convert sang list (dict)
data_list = list(dataset)

# Lưu thành file JSON
output_file = "test_dataset.json"
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(data_list, f, ensure_ascii=False, indent=2)

print(f"Saved {len(data_list)} samples to {output_file}")