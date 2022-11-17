%%% -*- Mode: Prolog -*-

% Predicato deepest_node/3 che non va una megamadonna e non si riesce a spottare il motivo

deepest_node(node(Key, Value, void, void), node(Key, Value, void, void), 0).

deepest_node(node(_Key, _Value, L, void), N, D) :-
    deepest_node(L, N, D1),
    D is D1 + 1.

deepest_node(node(_Key, _Value, void, R), N, D) :-
    deepest_node(R, N, D1),
    D is D1 + 1.

deepest_node(node(_Key, _Value, L, R), LN, D) :-
    deepest_node(L, LN, LD),
    deepest_node(R, _, RD),
    LD >= RD,
    D is LD + 1.

deepest_node(node(_Key, _Value, L, R), RN, D) :-
    deepest_node(L, _, LD),
    deepest_node(R, RN, RD),
    LD < RD,
    D is RD + 1.


% Predicato subset/2

subset([], _).

subset([X | Xs], Ys) :-
    membro(X, Ys),
    subset(Xs, Ys).


% Predicato membro/2 (nel caso servisse)

membro(X, [X | _]).

membro(X, [_ | Ys]) :-
    membro(X, Ys).

%Definire un predicato countElement/3 tale che countElement(L1, A, C) sia vero se
% l’elemento A compare C volte in L1.
% Esempio: countElement([a, b, [a, b, c]], a, 1). Restituisce vero

countElement([], _, 0).
countElement([A | Xs], A, C) :-
    Cn is C-1,
    !,
    countElement(Xs, A, Cn).
countElement([_ | Xs], A, C) :-
    countElement(Xs, A, C).


/*
Definire un predicato countd/3 tale che countD(L1, A, C) sia vero se l’elemento A compare C volte in L1, contando anche le occorrenze nelle sottoliste.
Esempio: countd([a, b, [a, b, c]], a, 2). Restituisce vero
*/
countd([], _, 0).

countd([[X | Xs]], Y, C) :-
    countd([X | Xs], Y, C).

countd([X | [Y | Ys]], Y, C) :-
    Cn is C-1,
    !,
    countd([X | Ys], Y, Cn).

countd([X | Xs], X, C) :-
    Cn is C-1,
    !,
    countd(Xs, X, Cn).

countd([_ | Xs], Y, C) :-
    countd(Xs, Y, C).


/*
Definire un predicato subarray/2 tale che subarray(L1, L2) restituisca vero se L2 è un sottoarray
(conta l’ordine e la molteplicità) di L1.
Esempio: subarray([a, b, c, d], [b, c]). Restituisce vero
*/
subarray(L1, L2) :-
    append(_, L3, L1),
    append(L2, _, L3).


/*
Definire un predicato subsequence/2 tale che subsequence(L1, L2) restituisca vero se L2 è una sottosequenza di L1,
ossia se L2 è costituita da un sottoinsieme di elementi di L1, che rispettano l’ordine originale,
ma non sono necessariamente consecutivi. In sostanza è vero se L2 è ottenibile eliminando alcuni (o nessuno) degli elementi di L1.
*/
subsequence(_, []).
subsequence([X | Xs], [X | Ys]) :-
    subsequence(Xs, Ys).
subsequence([_ | Xs], [Y | Ys]) :-
    subsequence(Xs, [Y | Ys]).


/*
Definire un predicato flatten/2 tale che flatten(L1, L2) sia vero se L2 è l’elenco degli elementi di L1
e delle sue sottoliste (sostanzialmente “spacchettiamo” le liste mantenendo l’ordine).
Esempio: flatten([a, [b, [c], d], [e, f]], [a, b, c, d, e, f]). Restituisce vero
*/
% non si può fare fanculo


% compress/2 dal primo parziale del 2012
compress([X | []], [X | []]).
compress([X | Xs], [X | Ys]) :-
    compress(Xs, [X | Ys]),
    !.
compress([_ | Xs], [_ | Ys]) :-
    compress(Xs, Ys).



/*
IL BOSS FINALE
Definire un predicato intersection/3 tale che
intersection(L1, L2, L3)sia vero se L3 è l’intersezione 
delle due liste L1 e L2.
L’ordine degli elementi non è specificato.
Esempio: intersection([a, b, c, d, e, f], [e, a, r], [a, e]). Restituisce vero
*/

% DA SISTEMARE PERCHE' LOOPPA TUTTOOOOOO SIUUUM
intersection([_ | Xs], [Y | Ys], Zs) :-
    intersection4([_ | Xs], [Y | Ys], [Y | Ys], Zs).

intersection4([], _, _, []).

% se le due liste hanno la stessa testa le sego via entrambe
% e aggiungo l'elemento comune all'intersezione
intersection4([Y | Xs], [Y | Ys], [Y | Ys], Zs) :-
    append(Zs, [Y], NewZ),
    intersection4(Xs, Ys, [Y | Ys], NewZ).

% se c'è ancora almeno un elemento nella seconda lista allora
% sego via la testa e rifaccio il controllo
intersection4([X | Xs], [Y | Ys], [Y | Ys], Zs) :-
    intersection4([X | Xs], Ys, [Y | Ys], Zs).

% se arrivo ad avere la lista vuota vuol dire che X non c'è
% in nella seconda lista, lo sego e riparto da capo
intersection4([_ | Xs], [], [Y | Ys], Zs) :-
    intersection4(Xs, [Y | Ys], [Y | Ys], Zs).




