FILE_MAIN := main.c
FILE_GREET_C := greet.c
FILE_GREET_H := greet.h
FILE_ADDRESS := address_book.h

FILE_HELP := help.txt
FILE_MAKEFILE := makefile
FILE_4A := 4a.mk
FILE_4B := 4b.mk
FILE_GITKEEP := .gitkeep

DIR_BUILD = ./build
DIR_INCLUDE = ./include
DIR_SRC = ./src


.PHONY: 4a
4a:
	$(MAKE) -f ./$(FILE_4A)


.PHONY: 4b
4b:
	$(MAKE) -f ./$(FILE_4B)


.PHONY: help
help:
	@cat -n ./$(FILE_HELP)


.PHONY: cat
cat:
	@printf "makefile:\n"
	@cat -n ./$(FILE_MAKEFILE)


.PHONY: c4a
c4a:
	@printf "4a.mk:\n"
	@cat -n ./$(FILE_4A)


.PHONY: c4b
c4b:
	@printf "4b.mk:\n"
	@cat -n ./$(FILE_4B)


.PHONY: cf
cf:
	@printf "src/main.c:\n"
	@cat -n $(DIR_SRC)/$(FILE_MAIN)
	@printf "\n\nsrc/greet.c:\n"
	@cat -n $(DIR_SRC)/$(FILE_GREET_C)
	@printf "\n\ninclude/greet.h:\n"
	@cat -n $(DIR_INCLUDE)/$(FILE_GREET_H)
	@printf "\n\ninclude/address_book.h:\n"
	@cat -n $(DIR_INCLUDE)/$(FILE_ADDRESS)


.PHONY: init
init:
	mkdir -p $(DIR_SRC)
	mkdir -p $(DIR_INCLUDE)
	mkdir -p $(DIR_BUILD)
	touch $(DIR_BUILD)/$(FILE_GITKEEP)
#	git init
