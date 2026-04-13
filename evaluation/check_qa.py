# Manual check of the QA dataset. We will check 10 questions and their answers, and compare them with the legal references provided.
with open('qa_gemini.json', 'r', encoding="utf-8") as f:
    data = f.read()
    
import json
qa_data = json.loads(data)
qa_data = qa_data['questions']

checked_question = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
for item in checked_question:
    print(f"Question {item}: {qa_data[item]['question']}")
    print(f"Answer: {qa_data[item]['answer']}")
    print(f"Reference: {qa_data[item]['legal_reference']}")
    print("-" * 50)
    
# True reference: 0, 10, 20, 30, 40, 50, 60, 70, 80, 90
# False reference: 