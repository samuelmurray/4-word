% A 4-word program in Prolog. Samuel Murray.

% Predicates that handle the game loop.

:- ensure_loaded(board).
:- ensure_loaded(score).
:- ensure_loaded(util).

play :- emptyboard(Board), explain(Board), playsolo(Board).

explain(Startboard) :-
		write('You play by entering a new letter at a position (x, y).'),
		displayboard(Startboard).

eog(Board) :-
		displayboard(Board),
		write('The board is full!'), nl,
		score(Board, S),
		write('Your score was: '), display(S).

playsolo(Board) :- 
		fullboard(Board), 
		eog(Board).
playsolo(Board) :- 
		write('Choose a letter and position.')
		read(L), read(X), read(Y),
		move(Board, L, X, Y, Newboard), 
		displayboard(Newboard),
		playsolo(Newboard).

playrandom(Board) :-
		fullboard(Board),
		eog(Board).
playrandom(Board) :-
		randomletter(L),
		write('Next letter is: '), display(L), write('. Where do you want to place it?'), nl,
		read(X), read(Y),
		move(Board, L, X, Y, Newboard),
		displayboard(Newboard),
		playrandom(Newboard).

move([0, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P], New, 1, 1, [New, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P]).
move([A, 0, C, D, E, F, G, H, I, J, K, L, M, N, O, P], New, 1, 2, [A, New, C, D, E, F, G, H, I, J, K, L, M, N, O, P]).
move([A, B, 0, D, E, F, G, H, I, J, K, L, M, N, O, P], New, 1, 3, [A, B, New, D, E, F, G, H, I, J, K, L, M, N, O, P]).
move([A, B, C, 0, E, F, G, H, I, J, K, L, M, N, O, P], New, 1, 4, [A, B, C, New, E, F, G, H, I, J, K, L, M, N, O, P]).
move([A, B, C, D, 0, F, G, H, I, J, K, L, M, N, O, P], New, 2, 1, [A, B, C, D, New, F, G, H, I, J, K, L, M, N, O, P]).
move([A, B, C, D, E, 0, G, H, I, J, K, L, M, N, O, P], New, 2, 2, [A, B, C, D, E, New, G, H, I, J, K, L, M, N, O, P]).
move([A, B, C, D, E, F, 0, H, I, J, K, L, M, N, O, P], New, 2, 3, [A, B, C, D, E, F, New, H, I, J, K, L, M, N, O, P]).
move([A, B, C, D, E, F, G, 0, I, J, K, L, M, N, O, P], New, 2, 4, [A, B, C, D, E, F, G, New, I, J, K, L, M, N, O, P]).
move([A, B, C, D, E, F, G, H, 0, J, K, L, M, N, O, P], New, 3, 1, [A, B, C, D, E, F, G, H, New, J, K, L, M, N, O, P]).
move([A, B, C, D, E, F, G, H, I, 0, K, L, M, N, O, P], New, 3, 2, [A, B, C, D, E, F, G, H, I, New, K, L, M, N, O, P]).
move([A, B, C, D, E, F, G, H, I, J, 0, L, M, N, O, P], New, 3, 3, [A, B, C, D, E, F, G, H, I, J, New, L, M, N, O, P]).
move([A, B, C, D, E, F, G, H, I, J, K, 0, M, N, O, P], New, 3, 4, [A, B, C, D, E, F, G, H, I, J, K, New, M, N, O, P]).
move([A, B, C, D, E, F, G, H, I, J, K, L, 0, N, O, P], New, 4, 1, [A, B, C, D, E, F, G, H, I, J, K, L, New, N, O, P]).
move([A, B, C, D, E, F, G, H, I, J, K, L, M, 0, O, P], New, 4, 2, [A, B, C, D, E, F, G, H, I, J, K, L, M, New, O, P]).
move([A, B, C, D, E, F, G, H, I, J, K, L, M, N, 0, P], New, 4, 3, [A, B, C, D, E, F, G, H, I, J, K, L, M, N, New, P]).
move([A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, 0], New, 4, 4, [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, New]).
move(Board, New, X, Y, Board) :- write('Illegal move.'), nl.
