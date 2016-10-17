% A 4-word program in Prolog. Samuel Murray.

% Entry point to program

:- consult(game).
:- consult(ai).
:- consult(load_words).
:- consult(score).
:- consult(util).
:- use_module(library(lists)).
:- use_module(library(random)).

:- load_words('words2.txt').
:- load_words('words3.txt').
:- load_words('words4.txt').

a(S) :- Board = [a, a, h, s, 
				e, f, g, h, 
				i, j, k, l, 
				m, n, o, p],
		score(Board, S).

t :- optimalboard(Board), displayboard(Board).
