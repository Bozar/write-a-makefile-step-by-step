# Write a Makefile Step-by-step

## Step 0: Compile code without a makefile.

`step_0/src/main.c` is a simple piece of C code. When in folder `step_0/`, use `make cat` to view its content. We can compile it by a GCC command: `gcc src/main.c -o build/prog`. And then run the program: `./build/prog`.

Both **An Introduction to GCC** and **C Programming: A Modern Approach** provide some useful GCC options, which leads to a more complicated command:

	gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow \
	-Wcast-qual -fanalyzer -O1 src/main.c -o build/prog

We can even build and run the program in one go:

	if $(gcc -ansi -pedantic -std=c99 -Wall -Wextra -Wconversion -Wshadow \
	-Wcast-qual -fanalyzer -O1 src/main.c -o build/prog); \
	then ./build/prog; fi

The above three examples show that a makefile might be unnecessary for a tiny C program. However, since the makefile is a collection of shell commands that are executed in order when certain conditions are true, it will be of great help when dealing with many source files and GCC commands.
