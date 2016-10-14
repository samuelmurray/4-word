% A 4-word program in Prolog. Samuel Murray, October 2016.
% To watch the computer play a game with itself, type
% selfgame.

:- consult(rules).

% Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P]

main :- open('smallwords.txt', read, Str), 
         read(Str,W1), 
         assert(word(W1)),
         read(Str,W2),
         assert(word(W2)),
         read(Str,W3),
         assert(word(W3)),
         close(Str), 
         nl.

load :- load_words('smallwords.txt').

t(S) :-  Board = [1, 2, 3, 4,
				5, 6, 7, 8,
				9, 10, 11, 12,
				13, 14, 15, 16],
				score(Board, S).