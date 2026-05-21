subject_parent(electric_bicycle, bicycle).
subject_parent(bicycle, non_motorized_vehicle).
subject_parent(cyclo, rudimentary_vehicle).
subject_parent(rudimentary_vehicle, non_motorized_vehicle).

subject_compatible(S,S) :-
    subject(_, S).
subject_compatible(Actual,Expected) :-
    subject_parent(Actual, Parent),
    subject_compatible(Parent, Expected).

subject_match(R) :-
    subject(R,S),
    driver_type(_,Actual),
    subject_compatible(Actual,S).

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