# Markdown

Write a [Markdown](https://guides.github.com/features/mastering-markdown/)
parser that returns the associated HTML for a given string.

Run the tests with:

```bash
bats markdown_test.sh
```

After the first test(s) pass, continue by commenting out or removing the
`[[ $BATS_RUN_SKIPPED == true ]] || skip`
annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, run:

```bash
BATS_RUN_SKIPPED=true bats markdown_test.sh
```



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
