./build/prog: ./build/main.o ./build/greet.o
	gcc -I./include ./build/main.o ./build/greet.o -o ./build/prog


./build/main.o: ./src/main.c
	gcc -I./include -c ./src/main.c -o ./build/main.o


./build/greet.o: ./src/greet.c
	gcc -I./include -c ./src/greet.c -o ./build/greet.o
