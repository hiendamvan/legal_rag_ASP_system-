from datasets import load_dataset, DatasetDict
from huggingface_hub import login
from dotenv import load_dotenv
import os

# Load env
load_dotenv()
HF_TOKEN = os.getenv("HF_TOKEN")
login(HF_TOKEN)

# Load từng file riêng
train_dataset = load_dataset("json", data_files="./data_finetune/train_chat_format.jsonl", split="train")
test_dataset = load_dataset("json", data_files="./data_finetune/test_chat_format.jsonl", split="train")

# Gộp lại thành DatasetDict (chuẩn HF)
dataset = DatasetDict({
    "train": train_dataset,
    "test": test_dataset
})

# Push lên hub
dataset.push_to_hub("hdv2709/case_fact_legal_chat_format", private=False)