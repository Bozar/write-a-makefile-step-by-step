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

We are dealing with the same source file and GCC commands as in Step 0. But this time, the commands are wrapped in a makefile (`:make cat`), therefore we can use `:make build` and `:make run` to compile code and run program, and create empty folders by `:make init`. Note that if you uncomment the last line in `init` block (`:cat -n sub.mk`), a new git repository will be created.

I recommend to expand a makefile gradually.

* Execute shell commands directly.
* Add the commands to a makefile and execute them unconditionally.
* Add rules. Replace parts of the commands with variables.

Rules and variables will be discussed soon.

## Step 2: Compile two source files. Use variables.

In order to compile two source files and a header file (`:make cf`), let's tweak GCC command:

	:gcc ... -I./include ./src/main.c ./src/greet.c ...

Try `:make 2a` yourself to view the full command output.

It is cumbersome to insert every new source file to a long and arcane GCC command. That's why we use variables to make it easier to read and modify a makefile. Note the first line in `step_2/makefile`: `FILE_SRC := main.c greet.c`. From now on, we only need to edit this line to add new source files. The outputs of `:make 2a` and `:make` are almost the same, except that there is a space before `-I./include` in `:make` -- because the second command contains an undefined variable `$(CFLAGS)`, which allows us to add new GCC options from commandline (`:make CFLAGS={MY_OPTION}`).

This makefile works fine so long as you put all header files in `./include` and source files in `./src`. Every time you execute `:make`, all files are compiled unconditionally. This shouldn't be a problem for a small C project. In other words, you can call it a day and read the next two steps later.

## Step 3: Add rules to a makefile.

Suppose our C project contains 10k source files. After editing one of them, how to recompile just this file and create a new program? As you can see in `:make c3a`, the answer is compiling object files first, then link them into a program.

It's time to add rules to our makefile (`:make c3b`). Note that `:make 3a` and `:make 3b` are different. `3a` always compiles all source files. `3b` only compiles updated files. If you run `:make 3b` twice in a row, no files are compiled the second time. You can trick `make` into believing that a file is newer by modifying its timestamp (for example, `:touch ./src/main.c`). Run `:make 3b` the thrid time. First `main.c` is recompiled to `main.o`. Then new `main.o` and old `greet.o` are linked into `prog`. This is exactly what we want.

Although `:make` (`:make cat`) behaves the same as `:make 3b` (`:make c3b`), the benefit of using variables is that we just need two rules (instead of three) to handle any number of source files. Let's take a closer look at these rules.

	makefile:
	    23  $(PATH_EXEC): $(PATH_OBJ)
	    24          $(CC) $(FLAG_INCLUDE) $^ -o $@

	3b.mk:
	     1  ./build/prog: ./build/main.o ./build/greet.o
	     2          gcc -I./include ./build/main.o ./build/greet.o -o ./build/prog

The first rule in `makefile` is written as `{LEFT}: {RIGHT}`, which can be easily translated back into the first line in `3b.mk`. Line 24 in `makefile` is a shell command. (Hufflepuffs prefer to call it a recipe. Interesting.) There are two special variables in the command. `$^` refers to all files in`{RIGHT}`. `$@` refers to the file in `{LEFT}`.

	makefile:
	    27  $(PATH_OBJ): $(DIR_BUILD)/%.o: $(DIR_SRC)/%.c
	    28          $(CC) $(FLAG_WARN_1) \
	    29                          $(FLAG_WARN_2) $(FLAG_MISC) \
	    30                          $(CFLAGS) $(FLAG_INCLUDE) -c $< -o $@

	3b.mk:
	     5  ./build/main.o: ./src/main.c
	     6          gcc -I./include -c ./src/main.c -o ./build/main.o
	     7
	     8
	     9  ./build/greet.o: ./src/greet.c
	    10          gcc -I./include -c ./src/greet.c -o ./build/greet.o

The second rule in `makefile` is written as `{HEADER}: {LEFT}: {RIGHT}`, which can be interpreted in two modes: Update Mode and Replace Mode.

	Update Mode:
	{SEARCH_RANGE}: {TARGET_FILE}: {SOURCE_FILE}

	Replace Mode:
	{SEARCH_RANGE}: {SEARCH_PATTERN}: {REPLACE_TEXT}

In Update Mode, when a `{SOURCE_FILE}` has a newer timestamp, `{TARGET_FILE}` in `{SEARCH_RANGE}` will be updated by executing shell commands right below this rule. In Replace Mode, file names in `{SEARCH_RANGE}` that match `{SEARCH_PATTERN}` are replaced with `{REPLACE_TEXT}`. `%` is a wildcard that matches any file name. Replace Mode enable us to merge two rules in `3b.mk` into one. Please beware that these two modes are not textbook definitions. They are Half-Blood Prince's sidenotes to help you understand makefile rules.

The special variable `$<` in line 30 (`makefile`) refers to the first file in `{RIGHT}`, which could be `./src/main.c`, `./scr/greet.c`, or any other source file.

Are you confident that the makefile can handle any file changes? Try modifying nothing but a macro definition in `include/address_book.h` (`:make cf`): `#define DR_NAME "Cooper"`. Either choose a new name or delete the definition. Does `make` builds a new program for you? It turns out that no matter how many times you run `:make`, Doctor's name remains unchanged -- as stubborn as Sheldon. We'll solve this problem in the final step.

## Step 4: Add header file dependencies.

The first thing to do when solving a problem, as the great teacher Polya pointed out, is to ask yourself -- What is the unknown? The unknown is, how to recompile a source file when a header file it includes is updated? An obvious answer is let object files depend on header files (`:make c4a`). First modify `include/address_book.h`, then run `:make 4a`. `src/greet.c` is recompiled but `src/main.c` is not. The rules and recipies work correctly.

Let's try to merge the second and third rule in `4a.mk` into a general one with variables. Is this rule correct?

	$(PATH_OBJ): $(DIR_BUILD)/%.o: $(DIR_SRC)/%.c $(DIR_INCLUDE)/%.h

Unfortunately it is not. Because there is a `./build/main.o` but no `./include/main.h`, and there is no `./build/address_book.o` but a `./include/address_book.h`. Then what if we put all header files into one variable (`:make c4b`)?

	$(PATH_OBJ): $(DIR_BUILD)/%.o: $(DIR_SRC)/%.c $(PATH_HEADER)

Modify `./include/address_book.h`, dry run both `:make 4a` and `:make 4b`, and compare their detailed outputs.

	:make 4a --just-print --trace
	:make 4b --just-print --trace

Watch closely and you will notice a suspicious line in `4b`'s output.

	4b.mk:25: update target 'build/main.o' due to: include/address_book.h

The rule for `./build/main.o` should be:

	./build/main.o: ./src/main.c ./include/greet.h

However, in `4b` it becomes:

	./build/main.o: ./src/main.c ./include/greet.h ./include/address_book.h

Does it mean that we have to insert every dependency in `4a.mk` into a makefile by hand? Yes and no. We do need to insert dependencies, not by ourselves, but by a GCC command.

	:gcc -I./include -MM ./src/greet.c -o ./build/greet.d
	:cat -n ./build/greet.d

Quote from [GCC document](https://gcc.gnu.org/onlinedocs/gcc/Preprocessor-Options.html):

	(-MM is) Like -M but do not mention header files that are found in system header directories, nor header files that are included, directly or indirectly, from such a header.

The rules for `./include/greet.h` in `4a.mk` and `./build/greet.d` are slightly different.

	4a.mk:
	     9  ./build/greet.o: ./src/greet.c ./include/greet.h ./include/address_book.h

	./build/greet.d:
	     1  greet.o: ./src/greet.c ./include/greet.h ./include/address_book.h

Another GCC option (`-MT`) can be used to specify file path.

	:gcc -I./include -MM -MT ./build/greet.o ./src/greet.c -o ./build/greet.d

The final version is as follows (`:make cat`):

	makefile:
	    35  $(PATH_DEP): $(DIR_BUILD)/%.d: $(DIR_SRC)/%.c
	    36          $(CC) $(FLAG_INCLUDE) -MM -MT $(patsubst %.d,%.o,$@) $< -o $@
	    37
	    38  -include $(PATH_DEP)

Update a dependency file when its related source file is changed. `Make`'s built-in function `patsubst()` replaces a dependency file's suffix `.d` with `.o`, and the output is used as our desired file path. Insert all dependency files to the makefile by `-include $(PATH_DEP)`.

Our makefile is composed of three core rules. Link object files into a program. Compile source files into object files. Create and insert header file dependencies. You can add more new rules to suit your need. However, the tutorial ends here.
