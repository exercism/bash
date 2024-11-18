# Introduction

## Truthiness in Bash

Bash does not have the concept of boolean values.
There are strings and numbers, and arrays of strings or numbers.
So how do conditional commands deal with true and false?

## Exit Status

Commands produce an _exit status_ when they end.
An exit status is an integer between 0 and 255 inclusive.
Bash considers a **zero** exit status to represent _success_.
Any other exit status represents _failure_.

This applies to all commands, including bash builtin commands, keywords, and functions.

## The "if" Command

The basic syntax of the `if` command is

```bash
if CONDITIONAL_COMMANDS; then TRUE_COMMANDS; else FALSE_COMMANDS; fi
```

It starts with `if`; the condition commands are separated from the "success" commands by `then`; and it is terminated with `fi`.
The `else` clause is optional.

CONDITIONAL_COMMANDS can be a single command or it can be a [list of commands][command-list].

The CONDITIONAL_COMMANDS are executed, and

* if the exit status is zero (success), then the TRUE_COMMANDS are executed.
* if the exit status is non-zero (failure), then the FALSE_COMMANDS are executed, if they are present.

Cascading branches can be given with `elif`
```bash
if CONDITIONAL_COMMANDS
then TRUE_COMMANDS
elif CONDITIONAL_COMMANDS_2
then TRUE_COMMANDS_2
# more elif branches ...
else FALSE_COMMANDS
fi
```

There must be a semicolon or a newline before the `then`, `elif`, `else` and `fi` words.

To emphasize: it is the **exit status** of the conditional commands that controls the flow.
As an example, `grep` returns 0 if a match is found, and 1 if a match is not found.
The `-q` option suppresses output, only producing the exit status.

```bash
if grep -q "my pattern" my_file; then echo "the pattern is found in the file"; fi
```

## "[" and "test" Commands

There is no special syntax around the CONDITIONAL_COMMANDS.
You may be used to seeing if statements that look like this:

```if
if [ "$password" = "secure" ]; then
    echo "Welcome!"
fi
```

`[` is not special syntax.
It is a _command_ that evaluates the conditional expression and exits with a success/failure status.
Like all commands, whitespace is **required** between it and its arguments.

`[` is actually a synonym for the `test` command.
They are exactly the same, except that the last argument to `[` _must_ be `]`.

### Conditional Expressions

Within `[` and `]`, you write a conditional expression.
Some typical conditional expressions include:

```bash
[ -f "$filename" ]             # file operations
[ "$string1" = "$string2" ]    # string comparisons
[ "$num1" -eq "$num2" ]        # arithmetic comparisons
```

There are many more operations available: they are listed in the [Bash Conditional Expressions][cond-expr] section of the manual.

~~~~exercism/note
In the examples above, notice that all the variables are quoted.
The `test` and `[` commands are plain commands, where the arguments are subject to word splitting and filename expansion like any other command.

This is important to point out because conditional expressions are evaluated differently based on _how many arguments_ you provide:

* 0 arguments: the exit status is non-zero (failure)
* 1 argument: the exit status is zero (success) if the argument is not empty, non-zero if it is empty.
* 2 arguments: the first argument must be a unary operator (such as `[ -z "$name" ]`), or a `!` (negating the status of the 1-argument test)
* and [more][test].

You can get unexpected results if you forget to quote:

```bash
str=""

# this prints "empty"
if [ -n "$str" ]; then echo "not empty"; else echo "empty"; fi

# leaving the variable unquoted results in incorrect "not empty" output
if [ -n $str ]; then echo "not empty"; else echo "empty"; fi
```

[test]: https://www.gnu.org/software/bash/manual/bash.html#index-test
~~~~

## "[[" Keyword

The [`[[...]]` conditional construct][cond-construct] is not a _command_, it is a **keyword**.
This means that, although it is handled like any other command, it can have special parsing rules.
What's special about `[[` is that the variables expanded within it are **not** subject to word splitting or filename expansion.
That means this command acts as you expect, even without quoting.

```bash
if [[ -n $str ]]; then echo "not empty"; else echo "empty"; fi
```

`[[` works with all the conditional expressions that `test` and `[` can handle.
In addition, `[[` provides

* the `=~` regular-expression matching operator,
* `==` and `!=` operate as a glob-pattern matching operator,
* `&&` and `||` as logical operators (special parsing rule),
* `<` and `>` as "bare" string comparison operators (special parsing rule: because these are redirection symbols, in `[` they must be escaped).

It is widely held that these special features offer so much benefit that `[[` should be used exclusively.
(For example, the [Google Shell Style Guide][goog-test].)

## The "case" Command

[`case`][case] is another control flow command.
It is like a "switch" statement in other languages.

```bash
case WORD in [PATTERN [| PATTERN]...) COMMANDS ;;]... esac
```

The WORD is matched against each PATTERN.
When one matches, the COMMANDS are executed.

```bash
read -p "Guess the secret word: " word
case "$word" in
    secret)
        echo "Yes, you guessed it!"
        ;;
    s*)
        echo "You guessed the first letter."
        ;;
    *)
        echo "Not even close! Try again."
        ;;
esac
```

Each COMMANDS clause must end with **two** semicolons, `;;`.

~~~~exercism/note
There are alternatives that provide functionality for fall-through command execution, and for pattern matching to continue.
Check the manual for details.
~~~~

[command-list]: https://www.gnu.org/software/bash/manual/bash.html#Lists
[if]: https://www.gnu.org/software/bash/manual/bash.html#index-if
[case]: https://www.gnu.org/software/bash/manual/bash.html#index-case
[cond-expr]: https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
[cond-construct]: https://www.gnu.org/software/bash/manual/bash.html#index-_005b_005b
[goog-test]: https://google.github.io/styleguide/shellguide.html#s6.3-tests
