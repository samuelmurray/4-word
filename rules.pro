% A 4-word program in Prolog. Samuel Murray, October 2016.
% To watch the computer play a game with itself, type
% selfgame.

:- ensure_loaded(words).

% Predicates that calculate score of full board.

score(Board, S) :- 	
		Board = [_, _, _, _, 
				 _, _, _, _,
				 _, _, _, _,
				 _, _, _, _],
		rows(Board, Row1, Row2, Row3, Row4),
		cols(Board, Col1, Col2, Col3, Col4),
		rowscore(Row1, Score1),
		rowscore(Row2, Score2),
		rowscore(Row3, Score3),
		rowscore(Row4, Score4),
		rowscore(Col1, Score5),
		rowscore(Col2, Score6),
		rowscore(Col3, Score7),
		rowscore(Col4, Score8),
		sum_list([Score1, Score2, Score3, Score4, Score5, Score6, Score7, Score8], S).

rowscore(Row, Sum) :- 
		Row = [A, B, C, D],
		atom_concat(A, B, AB),
		atom_concat(AB, C, ABC),
		atom_concat(ABC, D, ABCD),
		word(ABCD),
		Sum = 1.

rowscore(Row, Sum) :- Sum = 0.

rows(Board, Row1, Row2, Row3, Row4) :- 
		Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P],
		Row1 = [A, B, C, D],
		Row2 = [E, F, G, H],
		Row3 = [I, J, K, L],
		Row4 = [M, N, O, P].

cols(Board, Col1, Col2, Col3, Col4) :- 
		Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P],
		Col1 = [A, E, I, M],
		Col2 = [B, F, J, N],
		Col3 = [C, G, K, O],
		Col4 = [D, H, L, P].

sum_list(L, R) :- sum_list(L, 0, R).
sum_list([], F, F).
sum_list([H|T], F, R) :- 
		F2 is F+H,
		sum_list(T, F2, R).
