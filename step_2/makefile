FILE_SRC := main.c greet.c
FILE_EXEC := prog

FILE_SUB := sub.mk

DIR_BUILD := ./build
DIR_INCLUDE := ./include
DIR_SRC := ./src

PATH_SRC := $(addprefix $(DIR_SRC)/,$(FILE_SRC))
PATH_EXEC := $(addprefix $(DIR_BUILD)/,$(FILE_EXEC))

FLAG_INCLUDE := -I$(DIR_INCLUDE)
FLAG_WARN_1 := -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow
FLAG_WARN_2 := -Wcast-qual -fanalyzer
FLAG_MISC := -O1

CC := gcc


.PHONY: build
build:
	$(CC) $(FLAG_WARN_1) \
			$(FLAG_WARN_2) $(FLAG_MISC) \
			$(CFLAGS) $(FLAG_INCLUDE) $(PATH_SRC) -o $(PATH_EXEC)


.PHONY: run
run:
	$(PATH_EXEC)


include ./$(FILE_SUB)
