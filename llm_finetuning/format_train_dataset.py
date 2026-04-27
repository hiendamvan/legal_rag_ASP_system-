"""
Format train.json + merged_knowledge_base.lp into case fact extraction dataset.
Output format matches the fine-tuning schema with retrieved_rules and case facts.
"""

import json
import re
import random
import sys
from pathlib import Path
from collections import defaultdict

UTILS_DIR = Path(__file__).resolve().parent.parent / "utils"
if str(UTILS_DIR) not in sys.path:
    sys.path.append(str(UTILS_DIR))

from dataset_rule_ids import infer_rule_ids_from_output

KB_PATH = r"../legal_knowlegde/merged_knowledge_base.lp"
TRAIN_PATH = r"../public_dataset/train.json"
OUTPUT_PATH = r"data_finetune/case_fact_train_dataset.json"

# --- Parse knowledge base ---

def parse_knowledge_base(path):
    """Parse merged_knowledge_base.lp into a dict of rule_id -> {subject, action, context, ...}"""
    rules = {}
    
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
    
    # Extract all rule IDs
    for m in re.finditer(r'^rule\((\w+)\)\.\s*$', content, re.MULTILINE):
        rid = m.group(1)
        rules[rid] = {
            "rule_id": rid,
            "subject": None,
            "action": None,
            "context": [],
            "article": None,
            "clause": None,
            "point": None,
            "fine_min": None,
            "fine_max": None,
        }
    
    # Parse attributes
    patterns = {
        "subject": re.compile(r'^subject\((\w+),\s*(\w+)\)\.\s*$', re.MULTILINE),
        "action": re.compile(r'^action\((\w+),\s*(\w+)\)\.\s*$', re.MULTILINE),
        "context": re.compile(r'^context\((\w+),\s*(\w+)\)\.\s*$', re.MULTILINE),
        "article": re.compile(r'^article\((\w+),\s*(\d+)\)\.\s*$', re.MULTILINE),
        "clause": re.compile(r'^clause\((\w+),\s*(\d+)\)\.\s*$', re.MULTILINE),
        "point": re.compile(r'^point\((\w+),\s*"([^"]*)"\)\.\s*$', re.MULTILINE),
        "fine_min": re.compile(r'^fine_min\((\w+),\s*(\d+)\)\.\s*$', re.MULTILINE),
        "fine_max": re.compile(r'^fine_max\((\w+),\s*(\d+)\)\.\s*$', re.MULTILINE),
    }
    
    for attr, pat in patterns.items():
        for m in pat.finditer(content):
            rid, val = m.group(1), m.group(2)
            if rid in rules:
                if attr == "context":
                    rules[rid]["context"].append(val)
                elif attr in ("article", "clause", "fine_min", "fine_max"):
                    rules[rid][attr] = int(val)
                else:
                    rules[rid][attr] = val
    
    return rules


def build_prefix_index(rules):
    """Build index: prefix (e.g. d7_k5_c) -> list of full rule IDs"""
    index = defaultdict(list)
    for rid in rules:
        # Generate all prefixes: d7_k5_c_1 -> d7_k5_c_1, d7_k5_c, d7_k5, d7
        parts = rid.split("_")
        for i in range(len(parts), 0, -1):
            prefix = "_".join(parts[:i])
            index[prefix].append(rid)
    return index


def get_rules_for_article_ref(ref, prefix_index, rules):
    """Given a reference like 'd7_k5_c', return matching rules."""
    if ref in prefix_index:
        # Get unique rule IDs that start with this prefix
        matching = [rid for rid in prefix_index[ref] if rid.startswith(ref)]
        # Deduplicate
        return list(dict.fromkeys(matching))
    return []


def build_retrieved_rules(relevant_refs, distractor_refs, prefix_index, rules, max_distractors=4):
    """Build retrieved_rules list: all relevant + some distractors, shuffled."""
    retrieved = []
    relevant_rule_ids = set()
    
    # Add relevant rules
    for ref in relevant_refs:
        matched = get_rules_for_article_ref(ref, prefix_index, rules)
        for rid in matched:
            if rid not in relevant_rule_ids:
                relevant_rule_ids.add(rid)
                r = rules[rid]
                retrieved.append({
                    "rule_id": rid,
                    "subject": r["subject"] or "unknown",
                    "action": r["action"] or "unknown",
                    "context": r["context"],
                })
    
    # Add distractor rules
    distractor_rule_ids = []
    for ref in distractor_refs:
        matched = get_rules_for_article_ref(ref, prefix_index, rules)
        for rid in matched:
            if rid not in relevant_rule_ids and rid not in distractor_rule_ids:
                distractor_rule_ids.append(rid)
    
    # Sample distractors if too many
    if len(distractor_rule_ids) > max_distractors:
        distractor_rule_ids = random.sample(distractor_rule_ids, max_distractors)
    
    for rid in distractor_rule_ids:
        r = rules[rid]
        retrieved.append({
            "rule_id": rid,
            "subject": r["subject"] or "unknown",
            "action": r["action"] or "unknown",
            "context": r["context"],
        })
    
    random.shuffle(retrieved)
    return retrieved, relevant_rule_ids


def build_output_facts(relevant_rule_ids, rules):
    """Build output facts from relevant rules."""
    facts = []
    subjects_added = set()
    actions_added = set()
    contexts_added = set()
    
    for rid in relevant_rule_ids:
        r = rules[rid]
        
        # Add subject fact (deduplicate by subject value)
        if r["subject"] and r["subject"] not in subjects_added:
            subjects_added.add(r["subject"])
            facts.append({
                "predicate": "case_subject_type",
                "args": ["user1", r["subject"]]
            })
        
        # Add action fact (deduplicate by action value)
        if r["action"] and r["action"] not in actions_added:
            actions_added.add(r["action"])
            facts.append({
                "predicate": "case_action",
                "args": ["user1", r["action"]]
            })
        
        # Add context facts
        for ctx in r["context"]:
            if ctx not in contexts_added:
                contexts_added.add(ctx)
                facts.append({
                    "predicate": "case_context",
                    "args": ["user1", ctx]
                })
    
    return facts


INSTRUCTION = "Trích xuất case facts từ câu hỏi người dùng dựa trên các rule được cung cấp. Chỉ dùng action/context/exception có trong retrieved_rules. Chỉ trả về JSON với trường facts."


def main():
    random.seed(42)
    
    print("Parsing knowledge base...")
    rules = parse_knowledge_base(KB_PATH)
    print(f"  Found {len(rules)} rules")
    
    prefix_index = build_prefix_index(rules)
    
    print("Loading train data...")
    with open(TRAIN_PATH, "r", encoding="utf-8") as f:
        train_data = json.load(f)
    print(f"  Found {len(train_data)} samples")
    
    dataset = []
    skipped = 0
    
    for i, sample in enumerate(train_data):
        relevant_refs = sample["relevant_articles"]
        distractor_refs = sample["distractor_articles"]
        
        retrieved_rules, relevant_rule_ids = build_retrieved_rules(
            relevant_refs, distractor_refs, prefix_index, rules
        )
        
        if not retrieved_rules:
            skipped += 1
            continue
        
        facts = build_output_facts(relevant_rule_ids, rules)
        
        if not facts:
            skipped += 1
            continue
        
        level = 1 if sample["question_type"] == "simple" else 2
        
        entry = {
            "id": f"official_{i+1:05d}",
            "level": level,
            "instruction": INSTRUCTION,
            "input": {
                "question": sample["question"],
                "retrieved_rules": retrieved_rules,
            },
            "output": {
                "facts": facts
            }
        }

        entry["output"]["rule_id"] = infer_rule_ids_from_output(
            entry["output"], entry["input"]["retrieved_rules"]
        )
        
        dataset.append(entry)
    
    print(f"\nGenerated {len(dataset)} samples, skipped {skipped}")
    
    with open(OUTPUT_PATH, "w", encoding="utf-8") as f:
        json.dump(dataset, f, ensure_ascii=False, indent=2)
    
    print(f"Saved to {OUTPUT_PATH}")
    
    # Print a sample
    if dataset:
        print("\n--- Sample entry ---")
        print(json.dumps(dataset[0], ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
