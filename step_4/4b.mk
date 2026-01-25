FILE_SRC := main.c greet.c
FILE_OBJ := $(subst .c,.o,$(FILE_SRC))
FILE_HEADER := greet.h address_book.h
FILE_EXEC := prog

DIR_BUILD := ./build
DIR_INCLUDE := ./include
DIR_SRC := ./src

PATH_SRC := $(addprefix $(DIR_SRC)/,$(FILE_SRC))
PATH_OBJ := $(addprefix $(DIR_BUILD)/,$(FILE_OBJ))
PATH_HEADER := $(addprefix $(DIR_INCLUDE)/,$(FILE_HEADER))
PATH_EXEC := $(addprefix $(DIR_BUILD)/,$(FILE_EXEC))

FLAG_INCLUDE := -I$(DIR_INCLUDE)

CC := gcc


$(PATH_EXEC): $(PATH_OBJ)
	$(CC) $(FLAG_INCLUDE) $^ -o $@


$(PATH_OBJ): $(DIR_BUILD)/%.o: $(DIR_SRC)/%.c $(PATH_HEADER)
	$(CC) $(FLAG_INCLUDE) -c $< -o $@
