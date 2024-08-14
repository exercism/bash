# Introduction

## Variables

Variables are a place to hold data.
Bash has two kinds of data: strings and arrays.
We'll talk about arrays later.

You assign a variable like this
```bash
varname="the value"
```

~~~~exercism/note
**Important** -- there must be _no spaces_ around the equal sign!

This is a variable assignment
```bash
x=10
```

This calls the command `x` with two arguments, `=` and `10`!
```bash
x = 10
```
~~~~

## Variable Names

A variable name consists of uppercase letters, lowercase letters, numbers and underscore.
It cannot start with a number.

~~~~exercism/caution
It is best practice to **avoid using ALLCAPS variable names**.
The shell uses this convention for its parameters, and you don't want to accidentally override shell parameters that have special meaning.
For example: [1][1], [2][2], [3][3]

[1]: https://stackoverflow.com/q/27555060/7552
[2]: https://stackoverflow.com/q/28310594/7552
[3]: https://unix.stackexchange.com/q/114596/4667
~~~~

## Parameters

Variables can also be called "parameters".
The difference is that a variable is assigned by you, the programmer.
A parameter can be a read-only variable that is set by the shell.

Some important parameters used by or set by bash include:

* `PATH` -- a colon-separated list of directories used to find external commands.
* `IFS` -- the "internal field separator". We'll see how it's used below.
* `PWD` -- your current working directory.
* `RANDOM` -- a pseudo-random integer between 0 and 32767.
* `BASH_VERSION` -- the version string of the running instance of bash.

## Parameter Expansion

You get the value of a parameter with the `$varname` syntax.

```bash
x=10
echo "The value of x is $x"
```

To prevent the variable name from being confused with surrounding text, you can enclose the variable name in braces.
For example to print the string `10x10`

```bash
echo "${x}x$x"
# or
echo "${x}x${x}"
```

Some [style guides][google-style-guide] recommend using braces in most cases for readability.

## Positional Parameters

As we discussed in the [Commands and Arguments][cmds-args] lesson, commands can take arguments.
Bash scripts are no exception.
The arguments to the current instance of bash are called "positional parameters".
They can be retrieved with these special parameters:

* `$1` -- the first positional parameter
* `$2` ... `$9` -- subsequent parameters
* `${10}` ... -- double digits require braces.
* `$0` -- the name of the current script.

### Special Positional Parameters

$@
$*
IFS

## Command Substitution

## More on Parameter Expansion


[google-style-guide]: https://google.github.io/styleguide/shellguide.html
[cmds-args]: https://exercism.org/tracks/bash/concepts/commands-and-arguments
