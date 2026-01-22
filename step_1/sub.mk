SHARED := ../shared.mk
include $(SHARED)


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
	@printf "# Show files."
	@$(NEW_LINE_1)
	@printf ":make cat"
	@$(NEW_LINE_2)
	@printf "# Create empty folders."
	@$(NEW_LINE_1)
	@printf ":make init"
	@$(NEW_LINE_2)
	@printf "# Show this help."
	@$(NEW_LINE_1)
	@printf ":make help"
	@$(NEW_LINE_1)


.PHONY: cat
cat:
	@printf "makefile:"
	@$(NEW_LINE_1)
	@cat -n ./makefile
	@$(NEW_LINE_2)
	@printf "src/main.c:"
	@$(NEW_LINE_1)
	@cat -n ./src/main.c


.PHONY: init
init:
	mkdir -p ./src
	mkdir -p ./include
	mkdir -p ./build
	touch ./build/.gitkeep
#	git init
