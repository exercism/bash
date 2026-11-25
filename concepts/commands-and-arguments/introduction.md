# Introduction to Commands and Arguments

This track is not about how to use bash as an interactive shell.
It is about learning to write programs using Bash, the programming language.

A Bash program, or _script_, is a sequence of commands stored in a file.
bash (the executable) reads the file and executes the commands in order.

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

A line beginning with `#` is a _comment_, and bash ignores it.
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

outputs:

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

## Options are just arguments

Many commands accept _options_ that change how they behave.
To bash, an option is nothing special: it is a word like any other, separated from its neighbors by whitespace.
The command itself decides how to interpret its arguments.
By convention, options begin with a `-`.

The `head` command prints the first lines of a file.
Given a file `list.txt`:

```bash
head -n 2 list.txt
```

Bash splits this line into four words:

| Word       | Role                                        |
| ---------- | ------------------------------------------- |
| `head`     | the command to execute                      |
| `-n`       | an option, telling `head` to count _lines_  |
| `2`        | the value for the `-n` option               |
| `list.txt` | the file to read                            |

Bash passes the last three words to `head` unchanged.
It is `head` that understands that `-n` is followed by a number, and that the remaining word is a file.

Because the whitespace is what separates the words, it matters where you put it.
`head -n 2` gives `head` two arguments (`-n` and `2`) while `head -n2` gives it one (`-n2`).
Many commands accept both forms, but that is up to the command.
Bash does not care; it only splits the line into words.

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
head -n 1 my shopping list.txt     # three files: "my", "shopping", "list.txt"
head -n 1 "my shopping list.txt"   # one file
```

## Running a script

To run a script, pass it as an argument to the `bash` command:

```bash
bash myscript
```

Used this way, the `#!` line is just a comment.
You are telling the operating system how to run the file.

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
