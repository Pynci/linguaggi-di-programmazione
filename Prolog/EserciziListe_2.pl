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

%! Inserisci un elemento in una lista ordinata
inserisciOrdinato(N, [], [N]).
inserisciOrdinato(N, [X | Xs], [N, X | Xs]) :-
    N =< X.
inserisciOrdinato(N, [X | Xs], [X | Ys]) :-
    X < N,
    inserisciOrdinato(N, Xs, Ys).

%! Elimina il k-esimo elemento
elimina(0, [_ | Xs], Xs).
elimina(K, [X | Xs], [X | Ys]) :-
    Kn is K-1,
    K > 0,
    elimina(Kn, Xs, Ys).

%! Calcola la lunghezza di una lista
lunghezza([], 0).
lunghezza([_ | Xs], L) :-
    lunghezza(Xs, NewL),
    L is NewL + 1.
% NB: per fare sì che is funzioni è necessario che ciò che si trova alla sua
% destra abbia un effettivo valore.
% Per questo motivo qui bisogna mettere la chiamata ricorsiva successiva prima
% di stabilire il valore di L nella chiamata ricorsiva precedente.
% Se avessimo messo "NewL is L-1" prima di effetture la ricorsione si sarebbe
% verificato un errore, in quanto il sistema non ha un valore di L da calcolare.
% Scrivendo invece in questo modo il sistema può prima arrivare in fondo alle
% chiamate per giungere al caso base, per poi tornare indietro e riuscire ad
% ogni passo ad avere in mano l'effettivo valore di NewL (che gli permette poi
% di fare il calcolo richiesto da "L is NewL+1".

%! Copia lista
copia([], []).
copia([X | Xs], [X | Ys]) :-
    copia(Xs, Ys).

%! Inverti lista
inverti([], []).
% Da correggere!!
inverti([_ | Xs], [Y | Ys]) :-
    append(NewXs, Last, Xs),
    Last = Y,
    inverti(NewXs, Ys).

%! ESERCIZIO TEMA D'ESAME (subset lista ordinata)
subsetOr([], _).
subsetOr([X | Xs], [X | Ys]) :-
    subset(Xs, Ys).
subsetOr([X | Xs], [_ | Ys]) :-
    subset([X | Xs], Ys).
%! PARTE 2 (subset)
subset([], _).
subset([X | Xs], Ys) :-
    member(X, Ys),
    !,
    subset(Xs, Ys).
