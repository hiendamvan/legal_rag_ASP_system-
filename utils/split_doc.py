"""
Chia nghị định thành các Điều để phục vụ quá trình xây knowlegde base và quá trình tạo data finetuneing, test set. 
Chương 2: Các quy định xử phạt, từ Điều 6 -> Điều 40. 
"""
import re

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


# ===== test =====
with open("../data/nghidinh_168_2024.md", "r", encoding="utf-8") as f:
    text = f.read()

chunks = split_md_law(text)

for c in chunks:
    print("-----")
    print(c[:200])
    print(len(c))
print(f"Total chunks: {len(chunks)}")