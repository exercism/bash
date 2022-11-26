# Introduction

## Overview

This exercise requires formatting a string with an optional name argument and a default value.

## Default Value Parameter Expansion

The most idiomatic approach is to make use of the [default value paramter expansion][default-value].

```bash
echo "One for ${1-you}, one for me."
```

## Testing the number of arguments

The best way to test the number of arguments is to test that number directly, by testing the special `$#` variable.
Since `$#` is a number, the arithmetic test operator should be used.

```bash
if (( $# == 0 )); then
    name="you"
else
    name="$1"
fi

echo "One for ${name}, one for me."
```

## Shorthand testing

For simple conditionals, the `if` syntax is not needed.
This is similary to the ternary operator in some ways.

```bash
(( $# == 0 )) && name=you || name="$1"
echo "One for ${name}, one for me."
```

## Using printf

The `printf` built-in can be used for string formatting.
It is more flexible than `echo` and is safer for handling arbitrary inputs.
(Try printing out the string `"-n"` with `echo`.)
However, when using `printf`, one does need to remember to append a newline!

```bash
printf 'One for %s, one for me." "${1-you}"
```

# Empty strings

This exercise does not specify how an empty string should be handled; an empty string as an argument may be used as the name value or the default value may be used.

On the one hand, the empty string may not be a valid name and the default "you" might be preferable.
On the other hand, maybe the empty string is intended.
Additionally, the input `" "` is generally accepted as a valid input.

The empty string can be replaced with the default value, using tests or parameter expansiions.

```bash
[[ -z "$1" ]] && name=you || name="$1"
printf 'One for %s, one for me." "${name}"
```

Paramter expansions also support testing for "unset or null" by adding a `:` to the syntax; without the `:`, only an unset variable is replaced with the default value.

```bash
printf 'One for %s, one for me." "${1:-you}"
```

## POSIX tests

The arithmetic test, `((` and the string test, `[[` are bashisms and not POSIX sh.
The POSIX test is then `[` command.
When writing bash scripts, the built-in `((` and `[[` should be prefered; they are faster as they are built-ins (and not commands) and bash does not perform word splitting on them.
When using the `[` command, it is crucial that variable expansions be quoted.

```bash
[ "$#" -eq 0 ] && name=you || name="$1"
printf 'One for %s, one for me." "${name}"
```

## References

[default-value]: https://wiki.bash-hackers.org/syntax/pe#use_a_default_value
