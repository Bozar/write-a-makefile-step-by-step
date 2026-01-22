# Write a Makefile Step-by-step

## Step 0: Compile code without a makefile.

`step_0/src/main.c` is a simple piece of C code. When in folder `step_0/`, use `:make cat` to view its content. We can compile it by a GCC command: `:gcc src/main.c -o build/prog`. And then run the program: `:./build/prog`.

Both **An Introduction to GCC** and **C Programming: A Modern Approach** provide some useful GCC options, which leads to a more complicated command:

	:gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow \
			-Wcast-qual -fanalyzer -O1 src/main.c -o build/prog

We can even build and run the program in one go:

	:if $(gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow \
			-Wcast-qual -fanalyzer -O1 src/main.c -o build/prog); \
			then ./build/prog; fi

The above three examples show that a makefile might be unnecessary for a tiny C program. However, since the makefile is a collection of shell commands that are executed in order when certain conditions are true, it will be of great help when dealing with many source files and GCC commands.

## Step 1: Compile & run a tiny C program.

We are dealing with the same source file and GCC commands as in Step 0. However this time, the commands are wrapped in a makefile, so that we can use `:make build` and `:make run` to compile code and run program, and create empty folders by `:make init`. Note that if you uncomment the last line in `init` block, a new git repository will be created.

I recommend to expand a makefile in three stages.

1. Execute shell commands directly.
2. Add the commands to a makefile and execute them unconditionally.
3. Add rules. Replace parts of the commands with variables.

Stage 3 will be discussed in the next Step.
