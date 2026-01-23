FILE_MAIN := main.c
FILE_GREET_C := greet.c
FILE_GREET_H := greet.h

FILE_HELP := help.txt
FILE_MAKEFILE := makefile
FILE_2A := 2a.mk
FILE_GITKEEP := .gitkeep

DIR_BUILD = ./build
DIR_INCLUDE = ./include
DIR_SRC = ./src


.PHONY: 2a
2a:
	$(MAKE) -f ./$(FILE_2A)


.PHONY: help
help:
	@cat -n ./$(FILE_HELP)


.PHONY: cat
cat:
	@printf "makefile:\n"
	@cat -n ./$(FILE_MAKEFILE)


.PHONY: c2a
c2a:
	@printf "2a.mk:\n"
	@cat -n ./$(FILE_2A)


.PHONY: cf
cf:
	@printf "src/main.c:\n"
	@cat -n $(DIR_SRC)/$(FILE_MAIN)
	@printf "\n\nsrc/greet.c:\n"
	@cat -n $(DIR_SRC)/$(FILE_GREET_C)
	@printf "\n\ninclude/greet.h:\n"
	@cat -n $(DIR_INCLUDE)/$(FILE_GREET_H)


.PHONY: init
init:
	mkdir -p $(DIR_SRC)
	mkdir -p $(DIR_INCLUDE)
	mkdir -p $(DIR_BUILD)
	touch $(DIR_BUILD)/$(FILE_GITKEEP)
#	git init
