%%%% -*- Mode: Prolog -*-

%! Ultimo elemento della lista
ultimo([X], X).
ultimo([_ | Xs], X) :-
    ultimo(Xs, X).

%! Penultimo elemento della lista
penultimo([X, _],X).
penultimo([_ | Xs],X) :-
    penultimo(Xs, X).

%! k-esimo elemento della lista (prima posizione: 0)
kesimo([X | _], 0, X).
kesimo([_ | Xs], K, X) :-
    Kn is K-1,
    Kn > 0,
    kesimo(Xs, Kn, X).

%! Inserisci n alla posizione k (prima posizione: 0)
inserisci(N, 0, Xs, [N | Xs]).
inserisci(N, K, [X | Xs], [X | Ys]) :-
    Kn is K-1,
    inserisci(N, Kn, Xs, Ys).
