# Introduction to Arithmetic in the Bash Shell

Bash can do arithmetic but _only with integers_.
(If you need to do floating-point math, you'll need to call out to some external program.)

## Arithmetic Expansion

## Arithmetic Conditional

## Other places with arithmetic "context"

- array index
- ${var:offset:length}
- `let` command
- `declare -i` and variable assignment



~~~~exercism/caution
Assigning variables in a conditional construct

beware of `set -e`
~~~~

<!-- ------------------------------------------------------------ -->

There are two constructs that you'll use for arithmetic:

1. `$((...))` -- a construct that evaluates the given expression and outputs the answer
1. `((...))` -- a construct that evaluates the given expression and returns a true/false value

Whether to use one construct or the other depends on what you want to do with the answer:

* If you need to answer for further use, then use `$((...))`.
  This is called "arithmeticjk expansion".

  ```bash
  height=10
  width=20
  area=$((height * width))
  ```

* If you need to know if an arithmetic _comparison_ is true, then use `((...))`.
  This is called the "arithmetic conditional" construct.

  ```bash
  height=10
  width=20
  if ((height > width)); then
      echo "Taller"
  else
      echo "Wider"
  fi
  ```

~~~~exercism/note
Did you see that the `$` dollar signs are missing from the variables in the arithmetic expression?
Bash lets you do that.
It makes expressions much easier to read.

It even works for array elements:

```bash
point1=(10 15)  # these are (x, y) coordinates
point2=(20 7)
distance_squared=$(( (point1[0] - point2[0])**2 + (point1[1] - point2[1])**2 ))
```
~~~~

## Arithmetic Boolean Values

Bash uses the same sense of true/false as the C language:

* the number 0 is false.
* any other number is true.


