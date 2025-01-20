# Introduction to Arithmetic in the Bash Shell

Bash can do arithmetic but _only with integers_.
If you need to do floating-point math, you'll need to call out to some external program (like [awk][awk] or [bc][bc]).

The arithmetic operators are listed (in order of precedence) in the manual: [Shell Arithmetic][arithmetic].

Additionally, Bash only performs arithmetic in certain places (known as arithmetic "contexts").

## Arithmetic Expansion

Arithmetic expansion looks like parameter expansion, but with double parentheses.

```bash
$((expression))
```

This expansion returns the result of evaluating the expression.
It is common to capture the result in a variable:

```bash
x=$((3 + 4))
```

## Arithmetic Conditional

The arithmetic conditional is performed within double parentheses _without_ the leading `$`:

```bash
((expression))
```

This does not return the result.
However it does produce an _exit status_.

* The exit status is 0 (success) if the expression's result is **non-zero**.
* The exit status is 1 (failure) if the expression's result is **zero**.

~~~~exercism/note
Bash uses the same sense of true/false as the C language: zero is false, non-zero is true.
~~~~

This syntax is typically used in two places:

1. as the COMMAND part of an [`if` statement][conditional-if] or a [`while` loop][looping-while].

   ```bash
   if ((x == y - 1)); then ...
   while ((y > 0)); do ...
   ```

1. as a standalone command to modify a variable's value.

   ```bash
   ((++x))
   echo "new value for x is $x"
   ```

   ~~~~exercism/caution
   Be careful using arithmetic this way combined with `set -e` that the expression does not result in zero.
   The exit status will be non-zero.

   ```bash
   x=0
   ((x++))
   echo "you will see this"

   set -e
   x=0
   ((x++))
   echo "shell exits on the previous line; you won't see this"
   ```
   ~~~~


## Other Places With Arithmetic Context

There are a few other places that are arithmetic contexts:

* The [arithmetic for-loop][looping-for].
* The index part of a numerically-indexed array.

  ```bash
  echo "The next element is ${array[x + 1]}"
  # ................................^^^^^
  ```

* The offset and length parts of the `${var:offset:length}` expansion.
* The [`let` builtin command][let].
  * Note that `((expression))` is preferred over `let "expresson"`.
    Unlike the arithmetic conditional construct, the `let` expression is subject to filename-expansion and word-splitting, and it requires quoting.
* Variable assignment, when the variable has the "integer attribute".

  ```bash
  # variable x does not have the integer attribute
  x="3 + 4"
  declare -p x      # => declare -- x="3 + 4"

  # variable y has the integer attribute
  declare -i y
  y="4 + 5"
  declare -p y      # => declare -i y="9"
  ```

  ~~~~exercism/note
  It is the author's opinion that `declare -i` has limited usage.
  It's main benefit is to allow "bare" arithmetic (without the arithmetic expression syntax).
  This can cause confusion for readers of your code, where arithmetic expressions are evaluated in unexpected places.
  ~~~~

## Using Variables in an Arithmetic Expressions

There is one aspect of Bash arithmetic that improves readability.

```bash
height=10
width=20
area=$((height * width))
```

Did you see that the `$` dollar signs are missing from the variables in the arithmetic expression?
Bash lets you do that.
It makes expressions much easier to read.

The manual says it this way:

> Within an expression, shell variables may also be referenced by name without using the parameter expansion syntax.

It even works for array elements:

```bash
point1=(10 15)  # these are (x, y) coordinates
point2=(20 7)
distance_squared=$(( (point1[0] - point2[0])**2 + (point1[1] - point2[1])**2 ))
```

[arithmetic]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
[conditional-if]: https://exercism.org/tracks/bash/concepts/conditionals#h-the-if-command
[looping-while]: https://exercism.org/tracks/bash/concepts/looping#h-while-loops
[looping-for]: https://exercism.org/tracks/bash/concepts/looping#h-arithmetic-for-loop
[let]: https://www.gnu.org/software/bash/manual/bash.html#index-let
[awk]: https://www.gnu.org/software/gawk/manual/html_node/index.html
[bc]: https://www.gnu.org/software/bc/manual/html_mono/bc.html
