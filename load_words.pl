%
% Predicates to import word lists.
%

:- dynamic word/1.

% load_words(+File)
%	Read File and add each entry WORD as a predicate "word(WORD)."
load_words(File) :-
		open(File, read, Stream),
		read_words(Stream).

read_words(Stream) :-
		read(Stream, T0),
		read_words(T0, Stream).
read_words(end_of_file, _) :- !.
read_words(Word, Stream) :- !,
		assert(word(Word)),
		read(Stream, T2),
		read_words(T2, Stream).
