%%%% -*- Mode: Prolog -*-

%%%% ntreemaps.pl

%! is_treemap(Treemap) è deterministico
%
% Vero quando Treemap è un termine nella forma
% treemap(_Name, Root).
is_treemap(treemap(_Name, Root)) :-
    is_node(Root).

%! is_node(Node) is deterministic
%
% Vero quando Node è un nodo in una treemap
is_node(void).
is_node(node(_Key, _Value, _Left, _Right)).

%! is_tree(Tree) is deterministic.
%
% Vero quando Tree è un albero (controllato ricorsivamente)
is_tree(void).
is_tree(node(_Key, _Value, Left, Right)) :-
    is_tree(Left),
    is_tree(Right).


search(K, treemap(_, Root), V) :-
    is_node(Root),
    search(K, Root, V).

% Ricerca di una coppia chiave-valore in un albero binario di ricerca (ricorsivamente)
search(K, node(K, V, _, _), V).

search(K, node(KN, _, L, _), V) :-
    K < KN,
    search(K, L, V).

search(K, node(KN, _, _, R), V) :-
    K > KN,
    search(K, R, V).

insert(K, V, void, node(K, V, void, void)).


%%%% end of file -- ntreemaps.pls
