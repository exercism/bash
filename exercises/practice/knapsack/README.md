# Knapsack

In this exercise, let's try to solve a classic problem.

Bob is a thief. After months of careful planning, he finally manages to
crack the security systems of a high-class apartment.

In front of him are many items, each with a value (v) and weight (w). Bob,
of course, wants to maximize the total value he can get; he would gladly
take all of the items if he could. However, to his horror, he realizes that
the knapsack he carries with him can only hold so much weight (W).

Given a knapsack with a specific carrying capacity (W), help Bob determine
the maximum value he can get from the items in the house. Note that Bob can
take only one of each item.

All values given will be strictly positive. Items will be represented as a
list of pairs, `wi` and `vi`, where the first element `wi` is the weight of
the *i*th item and `vi` is the value for that item.

For example:

Items: [
  { "weight": 5, "value": 10 },
  { "weight": 4, "value": 40 },
  { "weight": 6, "value": 30 },
  { "weight": 4, "value": 50 }
]

Knapsack Limit: 10

For the above, the first item has weight 5 and value 10, the second item has
weight 4 and value 40, and so on.

In this example, Bob should take the second and fourth item to maximize his
value, which, in this case, is 90. He cannot get more than 90 as his
knapsack has a weight limit of 10.


Run the tests with:

```bash
bats knapsack_test.sh
```

After the first test(s) pass, continue by commenting out or removing the
`[[ $BATS_RUN_SKIPPED == true ]] || skip` 
annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, run:

```bash
BATS_RUN_SKIPPED=true bats knapsack_test.sh
```

## Source

Wikipedia [https://en.wikipedia.org/wiki/Knapsack_problem](https://en.wikipedia.org/wiki/Knapsack_problem)


## External utilities
`Bash` is a language to write "scripts" -- programs that can call
external tools, such as
[`sed`](https://www.gnu.org/software/sed/),
[`awk`](https://www.gnu.org/software/gawk/),
[`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html)
and even programs written in other programming languages, 
like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long
as your solution is portable between systems and does not require
installation of third party applications, feel free to use them to solve
the exercise.

For an extra challenge, if you would like to have a better understanding
of the language, try to re-implement the solution in pure `Bash`,
without using any external tools. Note that there are some types of
problems that bash cannot solve, such as performing floating point
arithmetic and manipulating dates: for those, you must call out to an
external tool.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others
have completed the exercise.
