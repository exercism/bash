# Ternary operator

```bash
year=$1
if (( year % 100 == 0 ? year % 400 == 0 : year % 4 == 0 )); then
    echo true
else
    echo false
fi 
```

A [conditional operator][ternary-operator], also known as a "ternary conditional operator", or just "ternary operator".
This structure uses a maximum of two checks to determine if a year is a leap year.

It starts by testing the outlier condition of the year being evenly divisible by `100`.
It does this by using the [remainder operator][remainder-operator]: `year % 100 == 0`.
If the year is evenly divisible by `100`, then the expression is `true`, and the ternary operator returns the result of testing if the year is evenly divisible by `400`.
If the year is _not_ evenly divisible by `100`, then the expression is `false`, and the ternary operator returns the result of testing if the year is evenly divisible by `4`.

| year | divisible by 4 | not divisible by 100 | divisible by 400 |    result    |
| ---- | -------------- | -------------------- | ---------------- | ------------ |
| 2020 |          false |        not evaluated |             true |         true |
| 2019 |          false |        not evaluated |            false |        false |
| 2000 |           true |                 true |    not evaluated |         true |
| 1900 |           true |                false |    not evaluated |        false |

Although it uses a maximum of two checks, the ternary operator tests an outlier condition first, making it less efficient than another approach that would first test if the year is evenly divisible by `4`, which is more likely than the year being evenly divisible by `100`.

## Refactoring for readability

This is a place where a helper function can result in more elegant code.

```bash
is_leap() {
    local year=$1
    if (( year % 100 == 0 )); then
        return $(( !(year % 400 == 0) ))
    else
        return $(( !(year % 4 == 0) ))
    fi
}

is_leap "$1" && echo true || echo false
```

The result of the arithmetic expression `year % 400 == 0` will be `1` if true and `0` if false.
The value is negated to correspond to the shell's return statuses: `0` is "success" and `1` is "failure.
Then the function can be used as a "Boolean condition" in the `if` statement.

The function's `return` statements can be written as

```bash
(( year % 400 != 0 ))
# or even
(( year % 400 ))
```

Without an explicit `return`, the function returns with the status of the last command executed.
The `((` construct will be the last command.

~~~~exercism/note
It is unfortunate that the meaning of the shell's exit status (`0` is success) is opposite to the arithmetic meaning of zero (failure, the condition is not met).
In the author's opinion, the cognitive dissonance of negating the condition reduces readability, but using `year % 400 != 0`, is worse.
I prefer the more explicit version with the `return` statement and the explicit conversion of the arithmetic result to a return status.
~~~~

[ternary-operator]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
[remainder-operator]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
