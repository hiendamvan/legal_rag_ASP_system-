import clingo

def run_asp(files):
    ctl = clingo.Control()

    # load các file .lp
    for f in files:
        ctl.load(f)

    # ground chương trình
    ctl.ground([("base", [])])

    results = []

    # solve và lấy model
    with ctl.solve(yield_=True) as handle:
        for model in handle:
            atoms = model.symbols(shown=True)
            results.append(atoms)

    return results


if __name__ == "__main__":
    res = run_asp(["nd168_chapter2_kb.lp", "case_fact.lp", "reasoning.lp"])

    for r in res:
        print(r)