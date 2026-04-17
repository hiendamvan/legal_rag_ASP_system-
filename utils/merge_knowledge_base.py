import glob
import os


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
KNOWLEDGE_BASE_DIR = os.path.join(BASE_DIR, "data", "knowlegde_base")
OUTPUT_FILE = os.path.join(BASE_DIR, "public_dataset", "merged_knowledge_base.lp")


def collect_lp_files(folder_path, output_file):
    pattern = os.path.join(folder_path, "*.lp")
    lp_files = sorted(glob.glob(pattern))
    return [path for path in lp_files if os.path.abspath(path) != os.path.abspath(output_file)]


def merge_lp_files(input_files, output_file):
    os.makedirs(os.path.dirname(output_file), exist_ok=True)

    with open(output_file, "w", encoding="utf-8") as destination:
        destination.write("% Auto-generated merged knowledge base\n")
        destination.write("% Source folder: data/knowlegde_base\n\n")

        for index, input_file in enumerate(input_files):
            file_name = os.path.basename(input_file)
            destination.write(f"% ===== BEGIN {file_name} =====\n")

            with open(input_file, "r", encoding="utf-8") as source:
                content = source.read().rstrip()
                if content:
                    destination.write(content)
                    destination.write("\n")

            destination.write(f"% ===== END {file_name} =====\n")
            if index < len(input_files) - 1:
                destination.write("\n")


def main():
    lp_files = collect_lp_files(KNOWLEDGE_BASE_DIR, OUTPUT_FILE)
    print(f"Tìm thấy {len(lp_files)} file .lp trong {KNOWLEDGE_BASE_DIR}:")
    for path in lp_files:
        print(f"  - {os.path.basename(path)}")

    merge_lp_files(lp_files, OUTPUT_FILE)
    print(f"\nĐã gộp xong vào: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()