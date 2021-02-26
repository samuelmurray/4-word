%
%	Predicates for accessing letters.
%

:- use_module(library(random)).

letters(A) :- A = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z].

% letter(?A)
%	Check if A is letter, or generate a letter
letter(A) :- letters(L), member(A, L).

% randomletter(-A) is nondet
%	Sample a random letter from the alphabet
randomletter(A) :- letters(L), random_member(A, L).