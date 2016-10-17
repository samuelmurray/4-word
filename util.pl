% A 4-word program in Prolog. Samuel Murray.

% Utility predicates.

:- use_module(library(random)).

letters(A) :- A = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z].

letter(A) :- letters(L), member(A, L).

randomletter(A) :- letters(L), random_member(A, L).
