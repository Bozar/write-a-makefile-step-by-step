FILE_MAIN := main.c
FILE_GREET_C := greet.c
FILE_GREET_H := greet.h

FILE_HELP := help.txt
FILE_MAKEFILE := makefile
FILE_3A := 3a.mk
FILE_3B := 3b.mk
FILE_GITKEEP := .gitkeep

DIR_BUILD = ./build
DIR_INCLUDE = ./include
DIR_SRC = ./src


.PHONY: 3a
3a:
	$(MAKE) -f ./$(FILE_3A)


.PHONY: 3b
3b:
	$(MAKE) -f ./$(FILE_3B)


.PHONY: help
help:
	@cat -n ./$(FILE_HELP)


.PHONY: cat
cat:
	@printf "makefile:\n"
	@cat -n ./$(FILE_MAKEFILE)


.PHONY: c3a
c3a:
	@printf "3a.mk:\n"
	@cat -n ./$(FILE_3A)


.PHONY: c3b
c3b:
	@printf "3b.mk:\n"
	@cat -n ./$(FILE_3B)


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
