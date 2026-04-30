subject_match(R) :-
    subject(R,S),
    driver_type(_,S).

action_match(R) :-
    action(R,A),
    did_action(_,A).

exception_triggered(R) :-
    exception(R,E),
    exception_applies(_,E).

matched(R) :-
    subject_match(R),
    action_match(R).

blocked(R) :-
    exception_triggered(R).

violation(R) :-
    matched(R),
    not blocked(R).

result(R,Min,Max) :-
    violation(R),
    fine_min(R,Min),
    fine_max(R,Max).

#show result/3.