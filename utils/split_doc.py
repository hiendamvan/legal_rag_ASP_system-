"""
Chia nghị định thành các Điều để phục vụ quá trình xây knowlegde base và quá trình tạo data finetuneing, test set. 
Chương 2: Các quy định xử phạt, từ Điều 6 -> Điều 40. 
"""
import re
import os

def split_md_law(text):
    # match: **Điều 4. ...**
    pattern = r"\*\*Điều\s+\d+\..*?\*\*"
    
    matches = list(re.finditer(pattern, text, re.DOTALL))
    results = []
    
    for i in range(len(matches)):
        start = matches[i].start()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(text)
        
        chunk = text[start:end].strip()
        results.append(chunk)
    
    return results

def save_chunks_to_files(chunks, output_dir):
    """
    Save each chunk to a separate Markdown file in the specified output directory.
    """
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    for i, chunk in enumerate(chunks, start=1):
        file_path = os.path.join(output_dir, f"dieu_{i}.md")
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(chunk)

# ===== test =====
with open("../data/nghidinh_168_2024.md", "r", encoding="utf-8") as f:
    text = f.read()

chunks = split_md_law(text)

# Save chunks to files
output_directory = "../data/dieus"
save_chunks_to_files(chunks, output_directory)

for c in chunks:
    print("-----")
    print(c[:200])
    print(len(c))
print(f"Total chunks: {len(chunks)}")