.PHONY: 2a_build
2a_build:
	gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow \
			-Wcast-qual -fanalyzer -O1 \
			-I./include ./src/main.c ./src/greet.c -o ./build/prog
