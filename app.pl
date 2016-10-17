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

% There are several game modes:
% 	solo - you choose all letters by yourself
% 	random - letters are chosen randomly for you
% 	versus - two player game, where you alternate to choose letter
%	vsai - you play vs an ai, where you alternate to choose letter
% To start a new game, type "play(MODE)" with one of the modes above
