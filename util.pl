% A 4-word program in Prolog. Samuel Murray, October 2016.

% Utility predicates.

sum_list(L, R) :- sum_list(L, 0, R).

sum_list([], F, F).

sum_list([H|T], F, R) :- 
		F2 is F+H,
		sum_list(T, F2, R).
