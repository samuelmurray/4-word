%
%	Predicates for operating on game boards. 
%		

:- use_module(library(random)).

% board(+Board)
%	Check if Board is a valid board
board(Board) :- Board = [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_].

% emptyboard(?Board)
%	Generate an empty board, or check if a board is empty
emptyboard(Board) :- Board = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0].

% emptyboard(+Board, -Randomboard) is nondet
%	Generate a random permutation of Board
randomboard(Board, Randomboard) :- board(Board), random_permutation(Board, Randomboard).

% fullboard(+Board)
%	Check if Board is full, i.e. contains no numbers
fullboard(Board) :-
		Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P],
		\+ (number(A); number(B); number(C); number(D); 
		number(E); number(F); number(G); number(H); 
		number(I); number(J); number(K); number(L);
		number(M); number(N); number(O); number(P)).

% rows(+Board, -Rowi)
%	Split the Board into Rows
rows(Board, Row1, Row2, Row3, Row4) :- 
		Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P],
		Row1 = [A, B, C, D],
		Row2 = [E, F, G, H],
		Row3 = [I, J, K, L],
		Row4 = [M, N, O, P].

% rows(+Board, -Coli)
%	Split the Board into Cols
cols(Board, Col1, Col2, Col3, Col4) :- 
		Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P],
		Col1 = [A, E, I, M],
		Col2 = [B, F, J, N],
		Col3 = [C, G, K, O],
		Col4 = [D, H, L, P].

% displayboard(+Board)
%	Display Board as 4x4 grid
displayboard(Board) :-
		Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P],
		nl, write('Current board is:'),
		nl, display(A), display(B), display(C), display(D),
		nl, display(E), display(F), display(G), display(H),
		nl, display(I), display(J), display(K), display(L),
		nl, display(M), display(N), display(O), display(P), nl.