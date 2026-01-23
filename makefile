DIR_STEP = ./step_
DIR_STEP_NEW = $(DIR_STEP)$(nr)
DIR_STEP_PREV = $(DIR_STEP)$$(($(nr)-1))
DIR_BUILD = $(DIR_STEP_NEW)/build
DIR_INCLUDE = $(DIR_STEP_NEW)/include
DIR_SRC = $(DIR_STEP_NEW)/src

FILE_GITKEEP := .gitkeep
FILE_HELP := help.txt


.PHONY: help
help:
	@cat -n ./$(FILE_HELP)


.PHONY: cat
cat:
	@printf "File not found.\n"


.PHONY: init
init:
	mkdir -p $(DIR_BUILD)
	mkdir -p $(DIR_INCLUDE)
	mkdir -p $(DIR_SRC)
	touch $(DIR_BUILD)/$(FILE_GITKEEP)
	cp -ri $(DIR_STEP_PREV)/* $(DIR_STEP_NEW)
