FILE_SRC := main.c greet.c
FILE_OBJ := $(subst .c,.o,$(FILE_SRC))
FILE_EXEC := prog

FILE_SUB := sub.mk

DIR_BUILD := ./build
DIR_INCLUDE := ./include
DIR_SRC := ./src

PATH_SRC := $(addprefix $(DIR_SRC)/,$(FILE_SRC))
PATH_OBJ := $(addprefix $(DIR_BUILD)/,$(FILE_OBJ))
PATH_EXEC := $(addprefix $(DIR_BUILD)/,$(FILE_EXEC))

FLAG_INCLUDE := -I$(DIR_INCLUDE)
FLAG_WARN_1 := -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow
FLAG_WARN_2 := -Wcast-qual -fanalyzer
FLAG_MISC := -O1

CC := gcc


$(PATH_EXEC): $(PATH_OBJ)
	$(CC) $(FLAG_INCLUDE) $^ -o $@


$(PATH_OBJ): $(DIR_BUILD)/%.o: $(DIR_SRC)/%.c
	$(CC) $(FLAG_WARN_1) \
			$(FLAG_WARN_2) $(FLAG_MISC) \
			$(CFLAGS) $(FLAG_INCLUDE) -c $< -o $@


.PHONY: run
run:
	$(PATH_EXEC)


include ./$(FILE_SUB)
