prompt = """
Bạn là một Chuyên gia Pháp lý và Kỹ sư AI (Neuro-Symbolic AI). Nhiệm vụ của bạn là tạo ra một tập dữ liệu kiểm thử (Evaluation Dataset) chất lượng cao nhằm so sánh hiệu năng giữa hệ thống "RAG Truyền thống" và hệ thống "RAG + LLM ASP (Trí tuệ nhân tạo có khả năng giải thích)".

Tôi sẽ cung cấp cho bạn [NỘI DUNG MỘT HOẶC NHIỀU ĐIỀU LUẬT]. Dựa vào đó, hãy sinh ra các mẫu dữ liệu (samples) tuân thủ nghiêm ngặt các tiêu chí sau:

### 1. YÊU CẦU VỀ LOẠI CÂU HỎI (Bắt buộc phải có đủ 5 loại):
1. "simple": Truy xuất trực tiếp, câu hỏi khớp 1-1 với văn bản luật (Chỉ cần 1 điều luật).
2. "complex_multi_hop": Câu hỏi phức tạp, đòi hỏi phải gom điều kiện từ ít nhất 2 khoản/điểm hoặc 2 điều luật khác nhau mới kết luận được.
3. "quantitative_context": Câu hỏi có yếu tố định lượng toán học (ví dụ: vận tốc vượt bao nhiêu, thời gian từ mấy giờ, kích thước bao nhiêu) để kiểm tra khả năng xử lý phép tính của hệ thống.
4. "insufficient_info": Tình huống đưa ra cố tình thiếu đi một dữ kiện cốt lõi (ví dụ: có hành vi nhưng không nói rõ loại xe). Câu trả lời phải là "Không đủ cơ sở pháp lý".
5. "exception_handling": Tình huống vi phạm một lỗi rõ ràng, nhưng cố tình chèn thêm một tình tiết rơi vào "Ngoại lệ" (trường hợp loại trừ) của luật.

### 2. YÊU CẦU VỀ ĐIỀU LUẬT GÂY NHIỄU (Distractors):
Mỗi sample phải cung cấp 3 điều luật "gây nhiễu". Đây KHÔNG PHẢI là các điều luật ngẫu nhiên, mà phải là các điều luật có chung từ khóa (keyword) với câu hỏi nhưng KHÔNG áp dụng cho tình huống đó (dùng để bẫy các hệ thống tìm kiếm vector RAG thông thường).

### 3. CẤU TRÚC ĐẦU RA (Output Format):
BẮT BUỘC chỉ trả về 1 mảng JSON duy nhất, mỗi điểm luật đều phải có sample không kèm giải thích độ dòng. Cấu trúc mỗi object như sau:

[
  {
    "id": "Tạo một mã ID duy nhất, ví dụ: test_ruleX_001",
    "question_type": "Điền 1 trong 5 loại câu hỏi ở trên",
    "question": "Nội dung câu hỏi của người dùng (tự nhiên, thực tế)",
    "relevant_articles": ["Trích dẫn chính xác Điều/Khoản/Điểm áp dụng cho câu hỏi này, ví dụ: d6_k5_dd, d7_k4_a, ... (dd là điểm đ)"],
    "distractor_articles": [
      "Trích dẫn nhiễu 1", (ví dụ d6_k2_b)
      "Trích dẫn nhiễu 2", (ví dụ d7_k3_c)
      "Trích dẫn nhiễu 3" (ví dụ d8_k1_a)
    ],
    "expected_answer": "Câu trả lời kết luận cuối cùng (Có vi phạm không? Phạt bao nhiêu? Dựa trên cơ sở nào?)"
  }
] 
"""
