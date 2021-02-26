%
%	Predicates that calculate score of full board.
%

:- ensure_loaded(board).

% score(+Board, -S)
%	Calculate the score for Board, by summing the score of each row and column
score(Board, S) :- 	
		board(Board),
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
		sumlist([Score1, Score2, Score3, Score4, Score5, Score6, Score7, Score8], S).

% rowscore(+Row, -Score)
%	Split the row into words of length 2, 3 and 4. Sum the score of each word
rowscore(Row, Score) :- 
		Row = [A, B, C, D],
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
		sumlist([S1, S2, S3, S4, S5, S6], Score).

% atomscore(+A, -S)
%	Return length(A) if A is a word, otherwise 0
atomscore(A, Score) :-
		(word(A) -> 
			atom_length(A, Score)
			;
			Score = 0
		).