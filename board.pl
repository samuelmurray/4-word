% A 4-word program in Prolog. Samuel Murray, October 2016.

% Predicates that splits a board into rows and columns.

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
