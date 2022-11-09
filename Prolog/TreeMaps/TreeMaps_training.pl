%%%% -*- Mode: Prolog -*-

is_node(void).
is_node(node(_Key, _Value, Left, Right)) :-
    is_node(Left),
    is_node(Right).

is_treemap(treemap(_ID, Root)) :- is_node(Root).


is_bst(void).
is_bst(node(_Key, _Value, void, void)).
is_bst(node(K, V, L, R)) :-
    is_bst(node(K, V, L, R), -inf, inf).

% controlla che il nodo sia in mezzo tra minimo e massimo
%
% richiama la funzione sul sottoalbero sinistro
% dove piazza la K della radice come massimo (tutto deve essere < K)
% richiama la funzione sul sottoalbero destro
% dove piazza la K della radice come minimo (titto deve essere > K)
is_bst(node(K, _, L, R), Min, Max) :-
    K < Max,
    Min < K,
    is_bst(L, Min, K),
    is_bst(R, K, Max).

is_bst_treemap(treemap(_ID, Root)) :-
    is_bst(Root).

