% A 4-word program in Prolog. Samuel Murray.

% Predicates to simulate AI player.

optimalboard(Board) :-
		Board = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P],
		Goal = 16, % It did not find solution for Goal = 14.
		% Row1
		letter(A), letter(B), letter(C), letter(D), 
		rowscore([A, B, C, D], S1), S1 >= Goal,
		% Col1
		letter(A), letter(E), letter(I), letter(M),
		rowscore([A, E, I, M], S2), S2 >= Goal,
		% Row2
		letter(E), letter(F), letter(G), letter(H), 
		rowscore([E, F, G, H], S3), S3 >= Goal,
		% Col2
		letter(B), letter(F), letter(J), letter(N),
		rowscore([B, F, J, N], S4), S4 >= Goal,
		% Row3
		letter(I), letter(J), letter(K), letter(L),
		rowscore([I, J, K, L], S5), S5 >= Goal,
		% Col3
		letter(C), letter(G), letter(K), letter(O),
		rowscore([C, G, K, O], S6), S6 >= Goal,
		% Row4
		letter(M), letter(N), letter(O), letter(P),
		rowscore([M, N, O, P], S7), S7 >= Goal,
		% Col4
		letter(D), letter(H), letter(L), letter(P),
		rowscore([D, H, L, P], S8), S8 >= Goal.
