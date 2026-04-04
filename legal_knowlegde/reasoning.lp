subject_match(R) :-
    subject(R,S),
    driver_type(_,S).

action_match(R) :-
    action(R,A),
    did_action(_,A).

matched(R) :-
    subject_match(R),
    action_match(R).

violation(R) :-
    matched(R),
    not blocked(R).

result(R,Min,Max) :-
    violation(R),
    fine_min(R,Min),
    fine_max(R,Max).

#show result/3.