% binary.pl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Binary Search Tree formalism
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Represent an empty tree as the atom empty.
% A nonempty tree is tree(Key, Value, LeftSubtree, RightSubtree).

% insert/4: standard BST insertion
insert(K, V, empty, tree(K, V, empty, empty)).
insert(K, V, tree(TK, TV, L, R), tree(TK, TV, NL, R)) :-
    K < TK,
    insert(K, V, L, NL).
insert(K, V, tree(TK, TV, L, R), tree(TK, TV, L, NR)) :-
    K > TK,
    insert(K, V, R, NR).
insert(K, V, tree(K, _, L, R), tree(K, V, L, R)).  % update existing key

% lookup/3: find value by key
lookup(_, empty, no_val).
lookup(K, tree(K, V, _, _), V).
lookup(K, tree(TK, _, L, _), V) :-
    K < TK,
    lookup(K, L, V).
lookup(K, tree(TK, _, _, R), V) :-
    K > TK,
    lookup(K, R, V).

% Example test trees for rotation
ltree(
    tree(3, c,
         tree(2, b,
              tree(1, a, empty, empty),
              empty),
         empty)
).

rtree(
    tree(1, a,
         empty,
         tree(2, b,
              empty,
              tree(3, c, empty, empty)))
).

%%%%%%%%%%%%%%%%%
% Your code here:
%%%%%%%%%%%%%%%%%

% rotateRight(+In, -Out): right‑rotate a 2‑3‑4–encoded subtree
rotateRight(
    tree(C, VC,
         tree(B, VB, A, X),
         D),
    tree(B, VB,
         A,
         tree(C, VC, X, D))
).

% rotateLeft(+In, -Out): left‑rotate a 2‑3‑4–encoded subtree
rotateLeft(
    tree(A, VA,
         B,
         tree(C, VC, X, D)),
    tree(C, VC,
         tree(A, VA, B, X),
         D)
).

% Example executions:
% ?- ltree(T1), rotateRight(T1, T2).
%    T2 = tree(2, b, tree(1, a, empty, empty), tree(3, c, empty, empty)).
%
% ?- rtree(T1), rotateLeft(T1, T2).
%    T2 = tree(2, b, tree(1, a, empty, empty), tree(3, c, empty, empty)).






