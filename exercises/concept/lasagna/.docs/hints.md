# Hints

## General

- There must be _no spaces_ around the `=` in a variable assignment.
- Use `$name` or `${name}` to get the value of a variable.
- Quote parameter expansions: `"$name"`.
- Use `${name:-default}` to provide a default value when a variable is empty or unset.
- Use good variable names: lowercase, and descriptive.

## 1. Define the expected oven time in minutes

- Assign the value to a variable, then use [`echo`][echo] with the variable inside a double-quoted string.
- Braces can separate the variable name from surrounding text: `"${name}text"`.

## 2. Calculate the remaining oven time in minutes

- The first command-line argument is the [positional parameter][positional] `$1`.
- Use a default value to handle a missing argument: `${1:-0}`.
- [Command substitution][cmd-subst] captures the output of a command: `result=$(command args)`.
- `expr 7 - 2` outputs `5`.
  Give it the variables as arguments, in quotes.

## 3. Calculate the preparation time in minutes

- The second command-line argument is `$2`.
- Remember to provide a default for a missing argument.
- `expr` needs the multiplication operator to be quoted so that Bash does not treat it as a filename pattern: `expr "$a" '*' "$b"`.
- Store the minutes per layer in a variable, so the number 2 has a name.

## 4. Calculate the total working time in minutes

- `expr "$a" + "$b"` adds two numbers.
- You can reuse the variables you have already assigned.

[echo]: https://www.gnu.org/software/bash/manual/bash.html#Bash-Builtins
[positional]: https://www.gnu.org/software/bash/manual/bash.html#Positional-Parameters
[cmd-subst]: https://www.gnu.org/software/bash/manual/bash.html#Command-Substitution
