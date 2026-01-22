DIR_STEP = ./step_
DIR_STEP_NEW = $(DIR_STEP)$(nr)
DIR_STEP_PREV = $(DIR_STEP)$$(($(nr)-1))
DIR_BUILD = $(DIR_STEP_NEW)/build
DIR_INCLUDE = $(DIR_STEP_NEW)/include
DIR_SRC = $(DIR_STEP_NEW)/src

FILE_GITKEEP := .gitkeep

SHARED := ./shared.mk
include $(SHARED)


.PHONY: help
help:
	@printf "Quick Start Guide"
	@$(NEW_LINE_2)
	@printf ":cd step_{NUMBER}"
	@$(NEW_LINE_1)
	@printf ":make help"
	@$(NEW_LINE_1)
	@printf ":make cat"
	@$(NEW_LINE_1)
	@printf ":make"
	@$(NEW_LINE_2)
	@printf "Refer to README.md for more information."
	@$(NEW_LINE_1)


.PHONY: cat
cat:
	@printf "No source file."
	@$(NEW_LINE_1)


.PHONY: init
init:
	mkdir -p $(DIR_BUILD)
	mkdir -p $(DIR_INCLUDE)
	mkdir -p $(DIR_SRC)
	touch $(DIR_BUILD)/$(FILE_GITKEEP)
	cp -ri $(DIR_STEP_PREV)/* $(DIR_STEP_NEW)
