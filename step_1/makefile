SUB := ./sub.mk


.PHONY: build
build:
	gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow \
			-Wcast-qual -fanalyzer -O1 \
			./src/main.c -o ./build/prog


.PHONY: run
run:
	./build/prog


include $(SUB)
