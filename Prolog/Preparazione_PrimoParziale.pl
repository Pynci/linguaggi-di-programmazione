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


