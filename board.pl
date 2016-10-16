% A 4-word program in Prolog. Samuel Murray.

% Predicates that operate on a gameboard.

fullboard(Board) :-
		Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P],
		\+ (number(A); number(B); number(C); number(D); 
		number(E); number(F); number(G); number(H); 
		number(I); number(J); number(K); number(L);
		number(M); number(N); number(O); number(P)).

emptyboard(Board) :- Board = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0].

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
