# About Arithmetic in the Bash Shell

Bash can do arithmetic but _only with integers_.
If you need to do floating-point math, you'll need to call out to some external program (like [awk][awk] or [bc][bc]).

The arithmetic operators are listed (in order of precedence) in the manual: [Shell Arithmetic][arithmetic].

Additionally, Bash only performs arithmetic in certain places (known as arithmetic "contexts").

## Arithmetic Expansion

Arithmetic expansion looks like [command substitution][cmd-sub], but with double parentheses.

```bash
$(( expression ))
```

This syntax expands to the result of evaluating the expression.
It is commonly used to capture the result in a variable:

```bash
x=$(( 3 + 4 ))
```

~~~~exercism/note
The amount of whitespace inside the parentheses is up to you.
It is a matter of style and readability.

```bash
x=$(( 3 + 4 ))
y=$((5+6))
```

Your friendly author likes to add spaces so that the arithmetic expression is more visible within the parentheses.
~~~~

## Arithmetic Conditional

The arithmetic conditional is performed within double parentheses _without_ the leading `$`:

```bash
(( expression ))
```

This does not expand to the result.
However it produces an _exit status_.

* The exit status is 0 (success) if the expression's result is **non-zero**.
* The exit status is 1 (failure) if the expression's result is **zero**.

~~~~exercism/note
Inside `((` Bash uses the same sense of true/false as the C language: zero is false, non-zero is true.
**This is the opposite of how Bash evaluates exit statuses!**
~~~~

This syntax is typically used in two places:

1. as the COMMAND part of an [`if` statement][conditional-if] or a [`while` loop][looping-while].

   ```bash
   if (( x == y - 1 )); then ...
   while (( y > 0 )); do ...
   ```

1. as a standalone command to modify a variable's value.

   ```bash
   (( x = x + 1 ))
   echo "new value for x is $x"
   ```

   ~~~~exercism/caution
   Be careful using arithmetic this way combined with `set -e`.
   If the expression evaluates to zero, the exit status will be non-zero and Bash will terminate.

   ```bash
   x=0
   (( x++ ))
   echo "you will see this"

   set -e
   x=0
   (( x++ ))
   echo "shell exits on the previous line; you won't see this"
   ```

   For a more thorough discussion about the `++` operator, see this article on [Postincrement vs Preincrement][incr]

   [incr]: https://thisvsthat.io/postincrement-vs-preincrement
   ~~~~


## Other Places With Arithmetic Context

There are a few other places that are arithmetic contexts:

* The [arithmetic for-loop][looping-for].

  ```bash
  for (( i = 0; i < 10; i++ )); do
      echo "$i"
  done
  ```

* The index part of a numerically-indexed array.

  ```bash
  echo "The next element is ${array[x + 1]}"
  # ................................^^^^^
  ```

  For more about arrays, read the [Arrays][arrays] concept document.

* The offset and length parts of the `${var:offset:length}` expansion.
* The [`let` builtin command][let].
  * Note that `(( expression ))` is preferred over `let "expresson"`.
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

Here is one aspect of arithmetic contexts that improves readability.

```bash
height=10
width=20
area=$(( height * width ))
```

Did you notice that the `$` dollar signs are missing from the variables in the arithmetic expression?
Bash lets you do that.
It makes expressions much easier to read.

The manual says,

> Within an expression, shell variables may also be referenced by name without using the parameter expansion syntax.

It even works for array elements:

```bash
point1=(10 15)  # these are (x, y) coordinates
point2=(20 7)
distance_squared=$(( (point1[0] - point2[0])**2 + (point1[1] - point2[1])**2 ))
```

But other parameter expressions need to use their special syntax.
For example, doubling the length of a string:

```bash
s="hello world"
len=$(( ${#s} * 2 ))
```

And positional paremeters have to as well.
If the first two positional parameters represent width and height:

```bash
area=$(( $1 * $2 ))
```

[arithmetic]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
[conditional-if]: https://exercism.org/tracks/bash/concepts/conditionals#h-the-if-command
[looping-while]: https://exercism.org/tracks/bash/concepts/looping#h-while-loops
[looping-for]: https://exercism.org/tracks/bash/concepts/looping#h-arithmetic-for-loop
[arrays]: https://exercism.org/tracks/bash/concepts/arrays
[let]: https://www.gnu.org/software/bash/manual/bash.html#index-let
[awk]: https://www.gnu.org/software/gawk/manual/html_node/index.html
[bc]: https://www.gnu.org/software/bc/manual/html_mono/bc.html
[cmd-sub]: https://exercism.org/tracks/bash/concepts/variables#h-command-substitution
