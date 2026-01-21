.PHONY: help
help:
	@printf "Step 0: Compile code without a makefile."
	@printf "\n\n"
	@printf "Run one of the following commands instead of \`:make\`."
	@printf "\n\n"
	@printf ":gcc src/main.c -o build/prog"
	@printf "\n\n"
	@printf ":gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion \\"
	@printf "\n"
	@printf "\-Wshadow -Wcast-qual -fanalyzer -O1 src/main.c -o build/prog"
	@printf "\n\n"
	@printf ":if \$$(gcc -ansi -pedantic -std=c99 -Wall -Wextra \\"
	@printf "\n"
	@printf "\-Wconversion -Wshadow -Wcast-qual -fanalyzer -O1 \\"
	@printf "\n"
	@printf "src/main.c -o build/prog); then ./build/prog; fi"
	@printf "\n"


.PHONY: cat
cat:
	@printf "src/main.c:"
	@printf "\n"
	@cat -n src/main.c
