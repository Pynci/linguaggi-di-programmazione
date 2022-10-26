%%%% -*- Mode: Prolog -*-

%! appendi(L1, L2, L3)
%
% Il predicato è vero quando la lista L3 è la concatenazione di L1 e L2.
appendi([], Xs, Xs).
appendi([X | Xs], Ys, [X | Zs]) :-
    appendi(Xs, Ys, Zs).

%! listref(L, N, E)
%
% Il predicato è vero quando E è l'elemento nella posizione N-esima di L
listref([E | _], 0, E).
listref([_ | Es], N, E) :-
    N > 0,
    X is N - 1,
    listref(Es, X, E).

%! part(E, L).
%
% il predicato è vero quando E è parte della lista L
part(E, [E | _]).
part(E, [_ | Xs]) :-
    part(E, Xs).
