import requests

URL = "http://localhost:8000/v1/chat/completions"

def call_llm(user_input):
    payload = {
        "model": "hdv2709/qwen_finetune",
        "temperature": 0,
        "messages": [
            {
                "role": "system",
                "content": "Bạn là hệ thống trích xuất legal case facts. Chỉ trả về JSON."
            },
            {
                "role": "user",
                "content": user_input
            }
        ]
    }

    response = requests.post(URL, json=payload)

    if response.status_code != 200:
        print("Error:", response.status_code, response.text)
        return None

    data = response.json()
    return data["choices"][0]["message"]["content"]


if __name__ == "__main__":
    while True:
        user_input = input("User: ")
        if user_input.lower() in ["exit", "quit"]:
            break

        output = call_llm(user_input)
        print("Assistant:", output)
        print("-" * 50)