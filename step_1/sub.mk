FILE_MAIN := main.c

FILE_HELP := help.txt
FILE_MAKEFILE := makefile
FILE_GITKEEP := .gitkeep

DIR_BUILD = ./build
DIR_INCLUDE = ./include
DIR_SRC = ./src


.PHONY: help
help:
	@cat -n ./$(FILE_HELP)


.PHONY: cat
cat:
	@printf "makefile:\n"
	@cat -n ./$(FILE_MAKEFILE)
	@printf "\n\nsrc/main.c:\n"
	@cat -n $(DIR_SRC)/$(FILE_MAIN)


.PHONY: init
init:
	mkdir -p $(DIR_SRC)
	mkdir -p $(DIR_INCLUDE)
	mkdir -p $(DIR_BUILD)
	touch $(DIR_BUILD)/$(FILE_GITKEEP)
#	git init
