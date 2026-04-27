from __future__ import annotations

from copy import deepcopy


def _normalize_rule_exceptions(rule: dict) -> list[str]:
    return list(rule.get("exception") or rule.get("exception_ref") or [])


def _score_rule(rule: dict, subjects: set[str], contexts: set[str], exceptions: set[str]) -> tuple[int, int, int, int]:
    rule_subject = rule.get("subject")
    rule_contexts = set(rule.get("context") or [])
    rule_exceptions = set(_normalize_rule_exceptions(rule))

    subject_score = 1 if not subjects or rule_subject in subjects else -1

    if rule_contexts:
        context_score = 2 if rule_contexts == contexts else 1 if rule_contexts.issubset(contexts) else -1
    else:
        context_score = 1 if not contexts else 0

    if rule_exceptions:
        exception_score = 2 if rule_exceptions == exceptions else 1 if rule_exceptions.issubset(exceptions) else -1
    else:
        exception_score = 1 if not exceptions else 0

    specificity_score = len(rule_contexts) + len(rule_exceptions)
    return subject_score, context_score, exception_score, specificity_score


def infer_rule_ids_from_output(output: dict, retrieved_rules: list[dict]) -> list[str]:
    facts = output.get("facts") or []
    subjects = {
        fact["args"][1]
        for fact in facts
        if fact.get("predicate") == "case_subject_type" and len(fact.get("args", [])) >= 2
    }
    actions = [
        fact["args"][1]
        for fact in facts
        if fact.get("predicate") == "case_action" and len(fact.get("args", [])) >= 2
    ]
    contexts = {
        fact["args"][1]
        for fact in facts
        if fact.get("predicate") == "case_context" and len(fact.get("args", [])) >= 2
    }
    exceptions = {
        fact["args"][1]
        for fact in facts
        if fact.get("predicate") == "case_exception" and len(fact.get("args", [])) >= 2
    }

    inferred_rule_ids: list[str] = []
    used_rule_ids: set[str] = set()

    for action in actions:
        candidates = [rule for rule in retrieved_rules if rule.get("action") == action]
        if not candidates:
            continue

        scored_candidates = []
        for rule in candidates:
            score = _score_rule(rule, subjects, contexts, exceptions)
            if min(score[:3]) < 0:
                continue
            scored_candidates.append((score, rule))

        if not scored_candidates:
            continue

        scored_candidates.sort(
            key=lambda item: (
                item[0][0],
                item[0][1],
                item[0][2],
                item[0][3],
                item[1].get("rule_id", ""),
            ),
            reverse=True,
        )

        chosen_rule = None
        for _, candidate in scored_candidates:
            candidate_rule_id = candidate.get("rule_id")
            if candidate_rule_id and candidate_rule_id not in used_rule_ids:
                chosen_rule = candidate
                break

        if chosen_rule is None:
            chosen_rule = scored_candidates[0][1]

        rule_id = chosen_rule.get("rule_id")
        if rule_id:
            inferred_rule_ids.append(rule_id)
            used_rule_ids.add(rule_id)

    return inferred_rule_ids


def enrich_sample_with_rule_ids(sample: dict) -> dict:
    enriched_sample = deepcopy(sample)
    output = deepcopy(enriched_sample.get("output") or {})
    retrieved_rules = list((enriched_sample.get("input") or {}).get("retrieved_rules") or [])
    output["rule_id"] = infer_rule_ids_from_output(output, retrieved_rules)
    enriched_sample["output"] = output
    return enriched_sample


def enrich_dataset_with_rule_ids(dataset: list[dict]) -> list[dict]:
    return [enrich_sample_with_rule_ids(sample) for sample in dataset]