%
% 		INSTRUCTIONS
%		------------
%
% 		There are several game modes:
%
% 			1) solo - you choose all letters by yourself
% 			2) random - letters are chosen randomly for you
% 			3) versus - two player game, where you alternate to choose letter
%			4) vsai - you play vs an ai, where you alternate to choose letter
% 		
%		To start a new game, type 
%			
%			"play(MODE)." 
%			
%		with one of the modes above.
%
%
% 		Alternatively, the predicates in "solver.pl" can be used to find high scoring game boards.
% 		To find a board where each row has score >= S, type 
%			
%			"optimalboard(S)."
%


%
% 	Entry point to the program.
% 	Loads all required files and modules.
% 	Reads the word lists and add a predicate "word(WORD)." for each WORD in the lists.
%

:- consult(game).
:- consult(solver).
:- consult(load_words).
:- consult(score).
:- consult(alphabet).
:- consult(board).
:- use_module(library(lists)).
:- use_module(library(random)).

:- load_words('words2.txt').
:- load_words('words3.txt').
:- load_words('words4.txt').