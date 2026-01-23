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

We are dealing with the same source file and GCC commands as in Step 0. However this time, the commands are wrapped in a makefile, so that we can use `:make build` and `:make run` to compile code and run program, and create empty folders by `:make init`. Note that if you uncomment the last line in `init` block (`:cat -n sub.mk`), a new git repository will be created.

I recommend to expand a makefile gradually.

* Execute shell commands directly.
* Add the commands to a makefile and execute them unconditionally.
* Add rules. Replace parts of the commands with variables.

Rules and variables will be discussed soon.

## Step 2: Compile two source files. Use variables.

In order to compile two source files and a header file (`:make cat`), let's tweak GCC command:

	:gcc ... -I./include ./src/main.c ./src/greet.c ...

Try `:make 2a` yourself to view the full command output.

It is cumbersome to insert every new source file to a long and arcane GCC command. That's why we need variables to make it easier to read and modify a makefile. Note the first line in `step_2/makefile`: `FILE_SRC := main.c greet.c`. From now on, we only need to edit this line to add new source files. The outputs of `:make 2a` and `:make` are almost the same, except that there is a space before `-I./include` in `:make` -- because the second command contains an undefined variable `$(CFLAGS)`, which allows us to add new GCC options from commandline (`:make CFLAGS={MY_OPTION}`).

This makefile works fine so long as you put all header files in `./include` and source files in `./src`. Every time you execute `:make`, all files are compiled unconditionally. This shouldn't be a problem for a small C project. In other words, you can call it a day and read the next two steps later.
