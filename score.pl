% A 4-word program in Prolog. Samuel Murray, October 2016.

% Predicates that calculate score of full board.

:- ensure_loaded(board).

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

rowscore(Row, Score) :- 
		(Row = [A, B, C, D] ->
			atom_concat(A, B, AB),
			atom_concat(B, C, BC),
			atom_concat(C, D, CD),
			atom_concat(AB, C, ABC),
			atom_concat(BC, D, BCD),
			atom_concat(ABC, D, ABCD),
			atomscore(AB, S1),
			atomscore(BC, S2),
			atomscore(CD, S3),
			atomscore(ABC, S4),
			atomscore(BCD, S5),
			atomscore(ABCD, S6),
			sum_list([S1, S2, S3, S4, S5, S6], Score)
			;
			Score = 0
		).


atomscore(A, S) :-
		(word(A) -> 
			atom_length(A, S)
			;
			S = 0
		).
