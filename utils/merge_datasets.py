import json
import os
import glob
import random

# Đường dẫn gốc dự án (thư mục cha của utils/)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TEST_DATA_DIR = os.path.join(BASE_DIR, "data", "test_data")
OUTPUT_DIR = os.path.join(BASE_DIR, "public_dataset")
TRAIN_SIZE = 1000
RANDOM_SEED = 42


def load_all_json(folder_path):
    """Đọc và gộp tất cả file JSON trong folder (bỏ qua file merged cũ)."""
    merged = []
    skip_names = {"dataset_merged_all.json"}
    json_files = sorted(glob.glob(os.path.join(folder_path, "*.json")))
    json_files = [f for f in json_files if os.path.basename(f) not in skip_names]

    print(f"Tìm thấy {len(json_files)} file JSON:")
    for f in json_files:
        print(f"  - {os.path.basename(f)}")

    for filepath in json_files:
        with open(filepath, "r", encoding="utf-8") as f:
            data = json.load(f)
        if isinstance(data, list):
            merged.extend(data)
        elif isinstance(data, dict):
            merged.append(data)
        else:
            print(f"  [WARN] {os.path.basename(filepath)} có định dạng không hỗ trợ, bỏ qua.")

    return merged


def reindex(data, start=0):
    """Đánh lại id từ start."""
    for i, item in enumerate(data):
        item["id"] = start + i
    return data


def split_and_save(data, train_size, output_dir):
    """Shuffle, split train/test, đánh lại id, lưu ra output_dir."""
    os.makedirs(output_dir, exist_ok=True)

    random.seed(RANDOM_SEED)
    shuffled = data[:]
    random.shuffle(shuffled)

    if train_size > len(shuffled):
        raise ValueError(
            f"Yêu cầu train_size={train_size} nhưng chỉ có {len(shuffled)} mẫu."
        )

    train_data = shuffled[:train_size]
    test_data = shuffled[train_size:]

    train_data = reindex(train_data)
    test_data = reindex(test_data)

    train_path = os.path.join(output_dir, "train.json")
    test_path = os.path.join(output_dir, "test.json")

    with open(train_path, "w", encoding="utf-8") as f:
        json.dump(train_data, f, ensure_ascii=False, indent=2)

    with open(test_path, "w", encoding="utf-8") as f:
        json.dump(test_data, f, ensure_ascii=False, indent=2)

    print(f"\nTổng số mẫu  : {len(data)}")
    print(f"Train ({len(train_data)} mẫu) → {train_path}")
    print(f"Test  ({len(test_data)} mẫu) → {test_path}")


if __name__ == "__main__":
    all_data = load_all_json(TEST_DATA_DIR)
    split_and_save(all_data, TRAIN_SIZE, OUTPUT_DIR)

