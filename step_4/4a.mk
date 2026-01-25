./build/prog: ./build/main.o ./build/greet.o
	gcc -I./include ./build/main.o ./build/greet.o -o ./build/prog


./build/main.o: ./src/main.c ./include/greet.h
	gcc -I./include -c ./src/main.c -o ./build/main.o


./build/greet.o: ./src/greet.c ./include/greet.h ./include/address_book.h
	gcc -I./include -c ./src/greet.c -o ./build/greet.o
