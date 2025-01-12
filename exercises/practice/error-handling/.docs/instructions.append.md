# Dummy header

## Bash-specific instructions

The goal of this exercise is to consider the number of arguments passed to your program.

Note that you can pass empty strings as arguments:

`./program ""`

and it is not the same as not passing the argument at all:

`./program`

In this excercise, if your program is run with exactly one argument (even if it is an empty string), treat is as a person's name and print a greeting message, eg. `"Hello, Kate"` (or `"Hello, "` for the empty string).

Otherwise if it is run with no arguments or more than one argument, print an error message `"Usage: error_handling.sh <person>"` and exit with a non-zero status.
