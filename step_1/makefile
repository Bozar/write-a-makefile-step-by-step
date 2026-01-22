SHARED := ../shared.mk
include $(SHARED)


.PHONY: build
build:
	gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow \
			-Wcast-qual -fanalyzer -O1 \
			./src/main.c -o ./build/prog


.PHONY: run
run:
	./build/prog


.PHONY: init
init:
	mkdir -p ./src
	mkdir -p ./include
	mkdir -p ./build
	touch ./build/.gitkeep
#	git init


.PHONY: help
help:
	@printf "Step 1: Compile & run a tiny C program."
	@$(NEW_LINE_2)
	@printf "# Compile C code."
	@$(NEW_LINE_1)
	@printf ":make"
	@$(NEW_LINE_2)
	@printf "# Run C program."
	@$(NEW_LINE_1)
	@printf ":make run"
	@$(NEW_LINE_2)
	@printf "# Create empty folders."
	@$(NEW_LINE_1)
	@printf ":make init"
	@$(NEW_LINE_2)
	@printf "# Show source file."
	@$(NEW_LINE_1)
	@printf ":make cat"
	@$(NEW_LINE_2)
	@printf "# Show this help."
	@$(NEW_LINE_1)
	@printf ":make help"
	@$(NEW_LINE_1)


.PHONY: cat
cat:
	@printf "src/main.c:"
	@$(NEW_LINE_1)
	@cat -n ./src/main.c
