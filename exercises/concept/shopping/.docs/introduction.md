# Introduction

A Bash script is a sequence of commands stored in a file.
Bash reads the file and executes the commands in order.

The first line of a script is usually an interpreter directive, also known as a _shebang_:

```bash
#!/usr/bin/env bash
```

It tells the operating system to use Bash to execute the file.
A line beginning with `#` is otherwise a comment, and Bash ignores it.

## Commands and arguments

Bash divides a command into words separated by whitespace.
The first word is the command name, and the remaining words are its arguments.

A command can be a Bash builtin, such as `echo`, or an executable program, such as `head`, `awk`, or `sed`.
Options and filenames are also passed as arguments.

The `echo` command prints its arguments, separates them with a single space, and finishes with a newline:

```bash
echo flour sugar eggs
```

```text
flour sugar eggs
```

Extra whitespace between arguments does not change the output:

```bash
echo flour       sugar        eggs
```

```text
flour sugar eggs
```

Quotes group words into a single argument.
They also preserve whitespace inside the quotes, and the quote characters themselves are not passed to the command:

```bash
echo "flour       sugar        eggs"
```

```text
flour       sugar        eggs
```

Calling `echo` without any arguments prints a blank line.
