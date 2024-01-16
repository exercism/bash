# Introduction

There are various idiomatic approaches to solve Leap.
You can use a chain of Boolean expressions to test the conditions.

## General guidance

The key to solving Leap is to know if the year is evenly divisible by `4`, `100` and `400`.
For determining that, you will use the [modulo operator][modulo-operator].

## Approach: Arithmetic expression: chain of boolean expressions

```bash
year=$1
if (( year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) )); then
    echo true
else
    echo false
fi 
```

For more information, check the [Boolean chain approach][approach-boolean-chain].

## Approach: Arithmetic expression Ternary operator of Boolean expressions

```bash
year=$1
if (( year % 100 == 0 ? year % 400 == 0 : year % 4 == 0 )); then
    echo true
else
    echo false
fi 
```

For more information, check the [Ternary operator approach][approach-ternary-operator].

## Approach: External tools

bash is naturally a "glue" language, making external tools easy to use.
Calling out to a tool that can manipulate dates would be another approach to take.
GNU `date` is an appropriate tool for this problem.

```bash
year=$1
next_day=$(date -d "$year-02-28 + 1 day" '+%d')
[[ $next_day == "29" ]] && echo true || echo false
```

Add a day to February 28th for the year and see if the new day is the 29th. For more information, see the [external tools approach][approach-external-tools].

## Which approach to use?

- The chain of boolean expressions should be the most efficient, as it proceeds from the most likely to least likely conditions.
It has a maximum of three checks.
It is the most efficient approach when testing a year that is not evenly divisible by `100` and is not a leap year, since the most likely outcome is eliminated first.
- The ternary operator has a maximum of only two checks, but it starts from a less likely condition.
- Using external tools to do `datetime` addition may be considered a "cheat" for the exercise, and it will be slower than the other approaches.

[modulo-operator]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
[approach-boolean-chain]: https://exercism.org/tracks/bash/exercises/leap/approaches/boolean-chain
[approach-ternary-operator]: https://exercism.org/tracks/bash/exercises/leap/approaches/ternary-operator
[approach-external-tools]: https://exercism.org/tracks/bash/exercises/leap/approaches/external-tools
