%%% -*- Mode: Prolog -*-

% Definire un predicato countElement/3 tale che countElement(L1, A, C) sia vero se
% l’elemento A compare C volte in L1.
% Esempio: countElement([a, b, [a, b, c]], a, 1). Restituisce vero

countElement([], _, 0).
countElement([A | Xs], A, C) :-
    Cn is C-1,
    !,
    countElement(Xs, A, Cn).
countElement([_ | Xs], A, C) :-
    countElement(Xs, A, C).


% Predicato deepest_node/3 che non va una megamadonna e non si riesce a spottare il motivo

deepest_node(node(Key, Value, void, void), node(Key, Value, void, void), 0).
deepest_node(node(_Key, _Value, L, void), N, D) :-
    D1 is D-1,
    deepest_node(L, N, D1).
deepest_node(node(_Key, _Value, void, R), N, D) :-
    D1 is D-1,
    deepest_node(R, N, D1).
deepest_node(node(_Key, _Value, L, R), LN, D) :-
    LD is D-1,
    RD is D-1,
    deepest_node(L, LN, LD),
    deepest_node(R, RN, RD),
    LD >= RD.
deepest_node(node(_Key, _Value, L, R), RN, D) :-
    RD is D-1,
    LD is D-1,
    deepest_node(L, LN, LD),
    deepest_node(R, RN, RD),
    LD < RD.
