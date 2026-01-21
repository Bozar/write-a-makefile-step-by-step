DIR_STEP = ./step_
DIR_STEP_NEW = $(DIR_STEP)$(nr)
DIR_STEP_PREV = $(DIR_STEP)$$(($(nr)-1))
DIR_BUILD = $(DIR_STEP_NEW)/build
DIR_INCLUDE = $(DIR_STEP_NEW)/include
DIR_SRC = $(DIR_STEP_NEW)/src

FILE_GITKEEP := .gitkeep


.PHONY: help
help:
	@printf "Quick Start Guide\n\n"
	@printf ":cd step_{NUMBER}\n"
	@printf ":make help\n"
	@printf ":make cat\n"
	@printf ":make\n\n"
	@printf "Refer to README.md for more information.\n"


.PHONY: cat
cat:
	@printf "No source file.\n"


.PHONY: init
init:
	mkdir -p $(DIR_BUILD)
	mkdir -p $(DIR_INCLUDE)
	mkdir -p $(DIR_SRC)
	touch $(DIR_BUILD)/$(FILE_GITKEEP)
	cp -ri $(DIR_STEP_PREV)/* $(DIR_STEP_NEW)
