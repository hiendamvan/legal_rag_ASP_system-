from datasets import load_dataset
from huggingface_hub import login
from dotenv import load_dotenv
load_dotenv()
import os 

HF_TOKEN = os.getenv("HF_TOKEN")
login(HF_TOKEN)

dataset = load_dataset("json", data_files="case_fact_chat_format.jsonl", split="train")
dataset = dataset.train_test_split(test_size=0.1)

dataset.push_to_hub("hdv2709/case_fact_legal_chat_format", private=False)