# Introduction to Variables

_Variables_ are a place to hold data.
You assign a variable like this

```bash
name="value"
```

~~~~exercism/note
**Important** -- there must be _no spaces_ around the equal sign!

When there are spaces, like in this example,

```bash
x = 10
```

bash is going to call the **command** `x` with the **two arguments** `=` and `10`!
~~~~

## Variable Names

A variable name consists of _uppercase letters, lowercase letters, numbers and underscore_.
It cannot start with a number.

~~~~exercism/caution
It is best practice to **avoid using ALLCAPS variable names**.
The shell uses this convention for its own variables, and you don't want to accidentally overwrite one that has a special meaning.
~~~~

## Parameter Expansion

You get the value of a variable with the `$varname` syntax.

```bash
x=10
echo "The value of x is $x"
```

To prevent the variable name from being confused with surrounding text, enclose the variable name in braces.
For example, to print the string `10x10`

```bash
echo "${x}x$x"
```

## Positional Parameters

As we discussed in the [Commands and Arguments][cmds-args] lesson, commands can take arguments.
Bash scripts are no exception.
The arguments to a script are called _positional parameters_.
You can retrieve them with `$1` (the first argument), `$2` (the second argument), and so on.

```bash
# run as: bash greet.sh Alice Bob
echo "Hello, $1 and $2"
# => Hello, Alice and Bob
```

## Default Values

Use `${varname:-default}` to provide a default value when the variable is empty or unset.
This is useful for arguments that may be missing.

```bash
name=${1:-world}
echo "Hello, $name"
# => Hello, world    (when the script is given no arguments)
```

## Command Substitution

A very frequent operation you will do in bash scripts is to capture the output of a command and store it in a variable.
To do this, use _command substitution_.

```bash
var=$(command)
```

For example:

```bash
kernel=$(uname -s)
echo "Running on $kernel"
# => Running on Linux
```

[cmds-args]: https://exercism.org/tracks/bash/concepts/commands-and-arguments
