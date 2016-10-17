# 4-word

4-word is a 2+ player game originally played with pen and paper. Players have their own _board_, represented by a 4x4 grid. Players then take turn to name a letter. Everyone has to place each letter somewhere in their board, where there is still space. After all 16 slots are filled, the goal is to have as many words as possible, in the rows and columns. Each word gives points equal to its length. For example, the row "cake" gives 4 points, whereas "help" gives 6 points (help = 4, he = 2).  

This is an implementation of the game in Prolog. Originally, the aim was to make a program find an _optimal board_, with score 128 (= 8 * (4 + 3 + 3 + 2 + 2 + 2)). However, it turned out that no such board exists for the word lists used. Therefore, focused was switched to make it more interactive, with multiple game modes.  
The next big step would be to enhance the AI to make intelligent moves; now it chooses random letters and places them randomly on the board.  
Another enhancement would be to, at the end of the game, not only display the board and the score, but a list of all the words found, and a score for each row and column.

## Project structure:

The code is separated into multiple files:
* **main.pl** - Handles imports etc. Entry point to the program.
* **game.pl** - Handles the game-loop. Most of code is here.
* **solver.pl** - Alternative way to interact with the game.
* **board.pl**, **score.pl**, **load_words.pl**, **alphabet.pl** - Help functions used by **main.pl**, **game.pl** and **solver.pl**.
* **wordsX.txt** - Text documents containing all words. The lists are from http://www.litscape.com/words/length/4_letters/4_letter_words.html.

## How to run:

Start Prolog and load the file **main.pl**. If you have SICStus installed, this can be done by simply calling

    make

There are several game modes:
1. solo - you choose all letters by yourself
2. random - letters are chosen randomly for you
3. versus - two player game, where you alternate to choose letter
4. vsai - you play vs an ai, where you alternate to choose letter

To start a new game, type 

    play(MODE).

with one of the modes above.

Alternatively, the predicates in **solver.pl** can be used to find high scoring game boards. To find a board where each row and column has score >= S, type
	
	optimalboard(S).
