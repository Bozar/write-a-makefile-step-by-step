SHARED := ../shared.mk
include $(SHARED)


.PHONY: help
help:
	@printf "Step 0: Compile code without a makefile."
	@$(NEW_LINE_2)
	@printf "Run one of the following commands instead of \`:make\`."
	@$(NEW_LINE_2)
	@printf ":gcc ./src/main.c -o ./build/prog"
	@$(NEW_LINE_2)
	@printf ":gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion \\"
	@$(NEW_LINE_1)
	@printf "\-Wshadow -Wcast-qual -fanalyzer -O1 \\"
	@$(NEW_LINE_1)
	@printf "./src/main.c -o ./build/prog"
	@$(NEW_LINE_2)
	@printf ":if \$$(gcc -ansi -pedantic -std=c99 -Wall -Wextra \\"
	@$(NEW_LINE_1)
	@printf "\-Wconversion -Wshadow -Wcast-qual -fanalyzer -O1 \\"
	@$(NEW_LINE_1)
	@printf "./src/main.c -o ./build/prog); then ./build/prog; fi"
	@$(NEW_LINE_1)


.PHONY: cat
cat:
	@printf "src/main.c:"
	@$(NEW_LINE_1)
	@cat -n ./src/main.c
