# Introduction

## Shells

A _shell_ is a program that allows you to enter commands for interacting with the operating system.
Shells can be graphical: your desktop environment that you use with a mouse or trackpad is a shell.
We will focus on command-line interfaces, where you type commands and the results are (usually) printed on your terminal.

There are many different command-line shells.
Windows offers **cmd** and **powershell**.
Mac and Linux offer "Unix shells", of which there are many.
The default shell for Mac is **zsh**.
**csh** is a legacy shell with C-like syntax.

One of the very earliest shells is the Bourne shell, **sh**.
In time, this was the basis for the standardized POSIX shell.
Many shells are based on the POSIX shell, some providing additional interactive or programming functionality.

**Bash** is based on the POSIX shell.
It is the default shell on most Linux systems.
Bash provides many facilities that make it an enjoyable interactive shell, including:

* a fully customizable prompt,
* the ability to recall and modify commands from history,
* the ability to manipulate running processes,
* aliases that can reduce typing.

This track is not about how to use bash as an interactive shell.
It is about learning to write programs using bash.
The emphasis will be on using _just_ bash to solve problems, although there are no restrictions on calling out to external tools.

## Bash Fundamentals: Commands and Arguments

Bash reads commands from its input (which is usually either a terminal or a file).
Each line of input that it reads is treated as a _command_ — an instruction to be carried out.
(There are a few advanced cases, such as commands that span multiple lines, that will be gotten to later.)

Bash divides each line into **words** that are demarcated by a whitespace character (spaces and tabs).
The first word of the line is the name of the _command_ to be executed.
All the remaining words become _arguments_ to that command (options, filenames, etc.).

~~~~exercism/note
In the examples below, we'll show you some interactive commands that you can run.

* The `#` character starts a _comment_.
  Any words following the comment comment are ignored by the shell; the comment is meant only for reading.
* The `$` character denotes a shell prompt. 
  If you're copying the command, do not include the prompt.
~~~~

```bash
# Note: It is always a good idea to run `ls` before `rm`
# to make sure you know what you are deleting.

$ rm *            # Remove all files in the current directory.
                  # Make sure you run this in a temp directory or you can lose files!
$ ls              # List files in the current directory (no output, no files).
$ touch a   b c   # Create files 'a', 'b' and 'c'.
$ ls              # List files again; this time the outputs: 'a', 'b' and 'c'.
a  b  c
```

`rm` is an application that removes the files given to it.
`*` is a [glob][glob].
This "wildcard" pattern matches all files in the current directory.
We will talk more about globs later.

Did you notice that there are several spaces between `a` and `b`, and only one between `b` and `c`?
The amount of whitespace between arguments does not matter!
For example:

```bash
$ echo This is a test.
This is a test.
$ echo This    is    a    test.
This is a test.
```

`echo` is a command that prints its arguments to standard output (which in our case is the terminal).
Bash splits the command into five words, and invokes the `echo` command with four arguments.
The extra spaces in the second example make no difference.
`echo` does not know how spaces were originally between the words.

If we want to keep the extra whitespace, we need to pass the sentence as one single argument.
We can do this by using [quotes][Quotes]:

```bash
$ echo "This    is    a    test."
This    is    a    test.
```

Quotes group everything inside them into a _single argument_.
The argument is `This    is    a    test.` including those specific space characters.
Note that the quotes are not part of the argument — bash removes them before handing that single argument to `echo`.

Arguments are separated from the command name and from each other by a whitespace.
This is important to remember.
For example, the following is wrong:

```bash
$ [-f file]
bash: [-f: command not found
```

This is intended to test for the existence of a file named `file`.
It's reasonable to assume that whitespace around `[` and `]` doesn't matter, but `[` is actually a command, and it requires its last argument to be `]`.
(We will cover the `[` command in more detail later.) 
Therefore, we must separate `[` from `-f` and `]` from `file`.
Otherwise bash will think we are trying to execute a command named `[-f` with a single argument `file]`.
The correct command separates all arguments with whitespace:

```bash
$ [ -f file ]
```

(We see a lot of people who are confused by this behavior; they think that they can omit the whitespace between `[` and its arguments, so we need to present this particular example early.)

If our filename contains whitespace or other special characters, it should also be quoted:

```bash
$ [ -f "my file" ]
```

## Types of commands

Bash understands several different types of commands: aliases, functions, builtins, keywords, and executables.
These are all _commands_, and they all act in a very similar manner.

Aliases are only enabled by default in interactive shells, not shell scripts.
We won't cover them here.

### Functions

A function contains shell commands, and acts very much like a small script; they can even take arguments and create local variables.
When a function is called, the commands in it are executed.
Functions will be covered in depth later.

### Builtins

Bash has some basic commands built into it, such as: `cd` (change directory), `echo` (write output), and so on.
They can be thought of as functions that are already provided.

### Keywords

Keywords are like builtins, with the main difference being that keywords are actually bash syntax and may be parsed using special rules.
For example, `[` is a bash builtin, while `[[` is a bash keyword; they are both used to test for a variety of conditions.
But the `[[` keyword has some extra functionality.
For example, it provides the `=~` operator that does regular expression testing.

```bash
$ [[ "hello world" =~ e.*o ]]   # returns a "success" status
$ [ "hello world" =~ e.*o ]
bash: [: =~: binary operator expected
```

`[[` also provides the `<` and `>` string comparison operators.
`[` cannot provide these operators: as a plain command, `[` cannot treat the special characters `<` and `>` differently from their usual redirection purpose.

### Executables

The last kind of command that can be executed by bash is an _executable_.
These are executable files (programs) on your computer's filesystem which you can run.
(Executables may also be called _external commands_ or _applications_.)
Executables are commonly invoked by typing only their name; the complete path to the file is typically not needed.
This can be done because bash uses a pre-defined variable which helps it find the location of common executable files.
This variable is called `PATH`.
It is a set of directory names separated by colons (e.g. `/usr/bin:/bin`). 
When a command is specified (e.g. `myprogram`, or `ls`) without a file path (and it isn't an alias, function, builtin or keyword), bash searches through the directories in `PATH`.
The directories are searched in order, from left to right, to see whether they contain an executable with the given name.

If the executable is outside a known path, the executable's file path will need to be specified.
For the `myprogram` executable in the current directory, use `./myprogram`; if it's in the directory `/opt/somedirectory`, use `/opt/somedirectory/myprogram`.

Tip — The `type` command can be used to get detalis about the command:

```bash
$ type rm
rm is hashed (/bin/rm)
# or it might return: `rm is /bin/rm`

$ type cd
cd is a shell builtin
```

## Scripts

A _script_ is a sequence of commands stored in a file.
Bash reads the file and processes the commands in order.
It moves on to the next command only when the current one has ended.
The exception being if a command has been specified to run asynchronously (in the background).
Don't worry too much about this case yet — we'll learn about how that works later on.

Any command line example in this guide can also be used in a script.

Making a script is easy.
Begin by making a new file, and put this on the first line:

```bash
#!/bin/bash
```

This line is called an _interpreter directive_ (it is also called a _hashbang_ or **_shebang_**).
It specifies that `/bin/bash` is to be used as the interpreter when the file is used as the executable in a command.
When the OS's kernel executes a _non-binary file_, it reads the first line of the file.
If the line begins with `#!`, the kernel uses the line to determine the interpreter to relay the file to.
(There are other valid ways to do this as well, see below.)
The `#!` must be at the very start of the file, with no spaces or blank lines before it.
Our script's commands will appear on separate lines below this.

Tip — Instead of `#!/bin/bash` , you could use

```bash
#!/usr/bin/env bash
```

`env` searches `$PATH` for the executable named by its first argument (in this case, "bash").
For a more detailed explanation of this technique and how it differs from plain ol' `#!/bin/bash`, see [this question in StackOverflow](https://stackoverflow.com/questions/16365130/what-is-the-difference-between-usr-bin-env-bash-and-usr-bin-bash/16365367#16365367).

Please do not be fooled by scripts or examples on the Internet that use `/bin/sh` as the interpreter.
**`sh` is not `bash`!**
Bash itself is a "sh-compatible" shell, meaning that it can run most `sh` scripts and carries much of the same syntax.
However, the opposite is not true; some features of bash will break or cause unexpected behavior in `sh`.
In fact, there is no single `sh` shell.
There are many shell implementations which support POSIX-sh syntax.
Depending on your OS, when you run `sh` you might actually be executing bash, ash, dash or some other shell.

Once the script file has been created, it can be executed by doing:

```bash
$ bash myscript
```

In this example, we execute the _command_ `bash` and tell it to read the script that we gave as an _argument_.
When we do it like this, the `#!` line is just a _comment_.

Alternatively, we can give our scripts executable permissions.
With this method we can execute the script like any other executable instead of calling bash manually:

```bash
$ chmod +x myscript  # Mark the file as executable.
$ ./myscript         # Now, myscript can be executed directly
                     # instead of having to specify bash.
```

When we run the command this way, the operating system (OS) uses the `#!` line to determine which interpreter to use to run your script.


## Credit

The content of this lesson is taken from [Commands and Arguments] on the [Bash Guide].


[Bash Guide]: https://mywiki.wooledge.org/BashGuide
[Commands and Arguments]: https://mywiki.wooledge.org/BashGuide/CommandsAndArguments
[Quotes]: https://mywiki.wooledge.org/Quotes
[glob]: https://mywiki.wooledge.org/glob
