# Introduction to Commands and Arguments

This track is not about how to use bash as an interactive shell.
It is about learning to write programs using bash.

A Bash program, or _script_, is a sequence of commands stored in a file.
Bash reads the file and executes the commands in order.

## The shebang

The first line of a script is usually an _interpreter directive_, also known as a _hashbang_ or _shebang_:

```bash
#!/usr/bin/env bash
```

When the operating system executes a non-binary file, it reads the first line.
If the line begins with `#!`, the kernel uses it to determine which interpreter should execute the file.
The `#!` must be at the very start of the file, with no spaces or blank lines before it.

Here, `env` searches `PATH` for the `bash` executable.
You may also see the simpler `#!/bin/bash`, which hard-codes the interpreter's location; the `env` form is more portable.

~~~~exercism/note
Do not be fooled by scripts or examples on the Internet that use `/bin/sh` as the interpreter.
**`sh` is not `bash`!**
Bash is "sh-compatible" and can run most `sh` scripts, but some Bash features will break or behave unexpectedly in `sh`.
~~~~

## Comments

A line beginning with `#` is a _comment_, and Bash ignores it.
A comment can also follow a command on the same line: everything from the `#` to the end of the line is ignored.
Comments exist for humans reading the script.

## Words and arguments

Bash reads commands from its input (which is usually either a terminal or a file).
Each line of input that it reads is treated as a _command_ — an instruction to be carried out.
(There are a few advanced cases, such as commands that span multiple lines, that will be discussed later.)

Bash divides each command into **words** that are demarcated by whitespace characters (spaces and tabs).
The first word is the name of the _command_ to be executed.
All the remaining words become _arguments_ to that command (options, filenames, etc.).

A command can be a Bash _builtin_, such as `echo`, or an _executable_ program, such as `head`, `awk`, or `sed`.

## The `echo` command

`echo` prints its arguments, separated by a single space, and finishes with a newline:

```bash
echo flour sugar eggs
```

```text
flour sugar eggs
```

The amount of whitespace between arguments does not matter:

```bash
echo flour       sugar        eggs
```

```text
flour sugar eggs
```

Calling `echo` without any arguments prints a blank line.

## Quoting arguments

[Quotes][Quotes] group words into a _single argument_.
Whitespace inside the quotes is preserved, and the quote characters themselves are not part of the argument:

```bash
echo "flour       sugar        eggs"
```

```text
flour       sugar        eggs
```

If an argument such as a filename contains whitespace, quote it:

```bash
head -n 1 "my shopping list.txt"
```

## Running a script

To run a script, pass it as an argument to the `bash` command:

```bash
bash myscript
```

Used this way, the `#!` line is just a comment.

Alternatively, mark the script file as executable and run it like any other program:

```bash
chmod +x myscript
./myscript
```

Now the operating system uses the `#!` line to determine which interpreter to use.

## Credit

The content of this lesson is taken from [Commands and Arguments] on the [Bash Guide].

[Bash Guide]: https://mywiki.wooledge.org/BashGuide
[Commands and Arguments]: https://mywiki.wooledge.org/BashGuide/CommandsAndArguments
[Quotes]: https://mywiki.wooledge.org/Quotes
