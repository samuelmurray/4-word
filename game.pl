%
% 	Predicates that handle the game loop.
%

:- ensure_loaded(board).
:- ensure_loaded(score).
:- ensure_loaded(alphabet).

% play(+Mode)
%	Choose between one of the modes below to start a new game
%	The game runs until the board is full, at which point the score is calculated
play(Mode) :- explain, playmode(Mode).

playmode(solo) :- !, emptyboard(Board), playsolo(Board).
playmode(random) :- !, emptyboard(Board), playrandom(Board).
playmode(versus) :- !, emptyboard(Board), playversus(Board, Board, 1).
playmode(vsai) :- !, emptyboard(Board), playvsai(Board).

explain :- 
		write('The goal of this game is to fill the board with letter that make up words.'), nl,
		write('Each word in your board (horizontal or vertical) gives you points equal to its length.'), nl,
		write('When it is your turn, enter a letter or position (x and y values, 1-4) ending with . (period) and ENTER between each input.'), nl,
		write('Good luck!'), nl, nl.

%
%		------------
%  		 Mode: solo
% 		------------
%		Solitaire game mode. The player chooses all letters and all positions. 
%		Goal is to find a board with maximal score.
%

playsolo(Board) :- 
		fullboard(Board), 
		!,
		eog(Board).
playsolo(Board) :- 
		chooseletterandposition(Board, Newboard),
		playsolo(Newboard).

%
%		--------------
%  		 Mode: random
% 		--------------
%		Solitaire game mode. The player recieves random letters and chooses only the positions. 
%		Goal is to find a board with maximal score given the letters.
%

playrandom(Board) :-
		fullboard(Board),
		!,
		eog(Board).
playrandom(Board) :-
		randomletter(L),
		chooseposition(Board, L, Newboard),
		playrandom(Newboard).

%
%		--------------
%  		 Mode: versus
% 		--------------
%		Two player game mode. The players alternate to choose letters, and place them on individual boards. 
%		Goal is to get a higher score than your opponent.
%

other(1, 2) :- !.
other(2, 1) :- !.

playversus(Board1, Board2, Player) :-
		fullboard(Board1), fullboard(Board2),
		!,
		eog(Board1, Board2, Player).
playversus(Board1, Board2, Player) :-
		write('--- Player '), display(Player), write(' ---'),
		chooseletterandposition(Board1, L, Newboard1), nl, nl,
		other(Player, Other),
		write('--- Player '), display(Other), write(' ---'),
		chooseposition(Board2, L, Newboard2), nl, nl,
		playversus(Newboard2, Newboard1, Other).

%
%		------------
%  		 Mode: vsai
% 		------------
%		Two player game mode where the opponent is an AI. The player and the AI alternate to choose letters, and place them on individual boards. 
%		Goal is to get a higher score than the AI.
%

other(human, ai) :- !.
other(ai, human) :- !.

playvsai(Board) :-
		fullboard(Board),
		!,
		randomboard(Board, Boardai),
		eog(Board, Boardai, human).
playvsai(Board) :-
		chooseletterandposition(Board, L1, Newboard1),
		randomletter(L2),
		nl, write('The AI chose next letter: '), display(L2),
		chooseposition(Newboard1, L2, Newboard2),
		playvsai(Newboard2).

%
%		-------------------
%		 Shared predicates
%		-------------------
%

% eog(+Board (+Board2, +Player))
%	Calculate score and show final output for finished games
eog(Board) :-
		write('The board is full!'),
		displayboard(Board),
		score(Board, S),
		write('Your score was: '), display(S).

eog(Board1, Board2, Player) :-
		other(Player, Other),
		write('The boards are full!'), nl,
		write('Player '), display(Player), write(' final board'),
		displayboard(Board1), nl,
		write('Player '), display(Other), write(' final board'),
		displayboard(Board2), nl,
		score(Board1, S1),
		score(Board2, S2),
		write('Player '), display(Player), write(' score was: '), display(S1), nl,
		write('Player '), display(Other), write(' score was: '), display(S2).

% chooseletterandposition(+Board, (-L), -Newboard)
%	Read input from player and make sure it's an allowed move
chooseletterandposition(Board, Newboard) :- chooseletterandposition(Board, L, Newboard).
chooseletterandposition(Board, L, Newboard) :-
		displayboard(Board),
		write('Choose a letter and position.'), nl,
		read(L), read(X), read(Y),
		move(Board, L, X, Y, Res),
		(Res = false -> 
			chooseletterandposition(Board, Lnew, Newboard)
			;
			Newboard = Res
		).

% chooseposition(+Board, +L, -Newboard)
%	Read input from player and make sure it's an allowed move
chooseposition(Board, L, Newboard) :-
		displayboard(Board),
		write('Choose position for letter: '), display(L), nl,
		read(X), read(Y),
		move(Board, L, X, Y, Res),
		(Res = false ->
			chooseposition(Board, L, Newboard)
			;
			Newboard = Res
		).

% move(+Board, +L, +X, +Y, -Newboard)
%	Place letter L in position (X,Y), return resulting board Newboard
%	If the move is invalid (L not letter, (X,Y) occupied or outside board), unify Newboard to "false"
move([0, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P], New, 1, 1, [New, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, 0, C, D, E, F, G, H, I, J, K, L, M, N, O, P], New, 1, 2, [A, New, C, D, E, F, G, H, I, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, 0, D, E, F, G, H, I, J, K, L, M, N, O, P], New, 1, 3, [A, B, New, D, E, F, G, H, I, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, 0, E, F, G, H, I, J, K, L, M, N, O, P], New, 1, 4, [A, B, C, New, E, F, G, H, I, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, 0, F, G, H, I, J, K, L, M, N, O, P], New, 2, 1, [A, B, C, D, New, F, G, H, I, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, 0, G, H, I, J, K, L, M, N, O, P], New, 2, 2, [A, B, C, D, E, New, G, H, I, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, 0, H, I, J, K, L, M, N, O, P], New, 2, 3, [A, B, C, D, E, F, New, H, I, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, 0, I, J, K, L, M, N, O, P], New, 2, 4, [A, B, C, D, E, F, G, New, I, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, H, 0, J, K, L, M, N, O, P], New, 3, 1, [A, B, C, D, E, F, G, H, New, J, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, H, I, 0, K, L, M, N, O, P], New, 3, 2, [A, B, C, D, E, F, G, H, I, New, K, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, H, I, J, 0, L, M, N, O, P], New, 3, 3, [A, B, C, D, E, F, G, H, I, J, New, L, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, H, I, J, K, 0, M, N, O, P], New, 3, 4, [A, B, C, D, E, F, G, H, I, J, K, New, M, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, H, I, J, K, L, 0, N, O, P], New, 4, 1, [A, B, C, D, E, F, G, H, I, J, K, L, New, N, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, H, I, J, K, L, M, 0, O, P], New, 4, 2, [A, B, C, D, E, F, G, H, I, J, K, L, M, New, O, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, H, I, J, K, L, M, N, 0, P], New, 4, 3, [A, B, C, D, E, F, G, H, I, J, K, L, M, N, New, P]) :- letter(New), !.
move([A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, 0], New, 4, 4, [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, New]) :- letter(New), !.
move(Board, New, X, Y, false) :- nl, write('ILLEGAL MOVE!'), nl.