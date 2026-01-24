.PHONY: 3a_build
3a_build:
	gcc -I./include -c ./src/main.c -o ./build/main.o
	gcc -I./include -c ./src/greet.c -o ./build/greet.o
	gcc -I./include ./build/main.o ./build/greet.o -o ./build/prog
