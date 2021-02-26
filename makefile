#
# Makefile for running the 4-word program
#

FLAGS = -l main.pl

default: main

main: 
	swipl $(FLAGS)
