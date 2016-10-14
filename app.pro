% A 4-word program in Prolog. Samuel Murray, October 2016.
% To watch the computer play a game with itself, type
% selfgame.

:- ensure_loaded(load_words).
:- consult(rules).

% Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P]

:- load_words('words2.txt').
:- load_words('words3.txt').
:- load_words('words4.txt').

t(S) :- Board = [a, a, h, s, 
				e, f, g, h, 
				i, j, k, l, 
				m, n, o, p],
		score(Board, S).

t(Board, S) :- score(Board, S).