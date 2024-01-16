# Chaining Boolean expressions

```bash
year=$1
if (( year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) )); then
    echo true
else
    echo false
fi 
```

The Boolean expression `year % 4 == 0` checks the remainder from dividing `year` by 4.
If a year is evenly divisible by 4, the remainder will be zero.
All leap years are divisible by 4, and this pattern is then repeated whether a year is not divisible by 100 and whether it's divisible by 400.

Parentheses are used to control the [order of precedence][order-of-precedence]:
logical AND `&&` has a higher precedence than logical OR `||`.

| year | divisible by 4 | not divisible by 100 | divisible by 400 |    result    |
| ---- | -------------- | -------------------  | ---------------- | ------------ |
| 2020 |           true |                 true |    not evaluated |         true |
| 2019 |          false |        not evaluated |    not evaluated |        false |
| 2000 |           true |                false |             true |         true |
| 1900 |           true |                false |            false |        false |

By situationally skipping some of the tests, we can efficiently calculate the result with fewer operations.
Although in an interpreted language like bash, that is less crucial than it might be in another language.

~~~~exercism/note
The `if` command takes a _list of commands_ to use as the boolean conditions:
if the command list exits with a zero return status, the "true" branch is followed;
any other return status folls the "false" branch.

The double parentheses is is a builtin construct that can be used as a command.
It is known as the arithmetic conditional construct.
The arithmetic expression is evaluated, and if the result is non-zero the return status is `0` ("true").
If the result is zero, the return status is `1` ("false").

Inside an arithmetic expression, variables can be used without the dollar sign.

See [the Conditional Constructs section][conditional-constructs] in the Bash manual.

[conditional-constructs]: https://www.gnu.org/software/bash/manual/bash.html#Conditional-Constructs

~~~~

[order-of-precedence]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
