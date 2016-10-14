% A 4-word program in Prolog. Samuel Murray, October 2016.
% Imports all words.

:- dynamic word/1.

load_words(File) :-
		open(File, read, Stream),
		read_words(Stream).

read_words(Stream) :-
        read(Stream, T0),
        load_words(T0, Stream).

load_words(end_of_file, _) :- !.

load_words(Word, Stream) :- !,
        assert(word(Word)),
        read(Stream, T2),
        load_words(T2, Stream).