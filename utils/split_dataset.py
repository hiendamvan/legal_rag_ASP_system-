import json
import random
from collections import defaultdict

# ===== CONFIG =====
INPUT_FILE = "../public_dataset/fact_extraction_train_1200.json"
TRAIN_SIZE = 1000
TEST_SIZE = 200
OUTPUT_TRAIN = "../public_dataset/train.json"
OUTPUT_TEST = "../public_dataset/test.json"

# ===== LOAD DATA =====
with open(INPUT_FILE, "r", encoding="utf-8") as f:
    data = json.load(f)

# ===== GROUP BY QUESTION TYPE =====
grouped = defaultdict(list)
for sample in data:
    grouped[sample["question_type"]].append(sample)

# ===== SHUFFLE EACH GROUP =====
for k in grouped:
    random.shuffle(grouped[k])

# ===== CALCULATE SPLIT PER TYPE =====
train_data = []
test_data = []

for qtype, samples in grouped.items():
    n = len(samples)
    
    # tỷ lệ split theo global ratio
    train_n = int(n * TRAIN_SIZE / (TRAIN_SIZE + TEST_SIZE))
    
    # đảm bảo mỗi tập có ít nhất 1 sample mỗi loại
    train_n = max(1, train_n)
    test_n = n - train_n
    
    # split
    train_data.extend(samples[:train_n])
    test_data.extend(samples[train_n:])

# ===== FINAL SHUFFLE =====
random.shuffle(train_data)
random.shuffle(test_data)

# ===== ADJUST SIZE IF NEEDED =====
train_data = train_data[:TRAIN_SIZE]
test_data = test_data[:TEST_SIZE]

# ===== SAVE =====
with open(OUTPUT_TRAIN, "w", encoding="utf-8") as f:
    json.dump(train_data, f, ensure_ascii=False, indent=2)

with open(OUTPUT_TEST, "w", encoding="utf-8") as f:
    json.dump(test_data, f, ensure_ascii=False, indent=2)

print("Done!")
print(f"Train size: {len(train_data)}")
print(f"Test size: {len(test_data)}")

# ===== CHECK DISTRIBUTION =====
def count_types(dataset):
    counter = defaultdict(int)
    for s in dataset:
        counter[s["question_type"]] += 1
    return dict(counter)

print("\nTrain distribution:")
print(count_types(train_data))

print("\nTest distribution:")
print(count_types(test_data))