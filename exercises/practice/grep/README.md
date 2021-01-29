# Grep

Search a file for lines matching a regular expression pattern. Return the line
number and contents of each matching line.

The Unix [`grep`](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/grep.html) command can be used to search for lines in one or more files
that match a user-provided search query (known as the *pattern*).

The `grep` command takes three arguments:

1. The pattern used to match lines in a file.
2. Zero or more flags to customize the matching behavior.
3. One or more files in which to search for matching lines.

Your task is to implement the `grep` function, which should read the contents
of the specified files, find the lines that match the specified pattern
and then output those lines as a single string. Note that the lines should
be output in the order in which they were found, with the first matching line
in the first file being output first.

As an example, suppose there is a file named "input.txt" with the following contents:

```text
hello
world
hello again
```

If we were to call `grep "hello" input.txt`, the returned string should be:

```text
hello
hello again
```

### Flags

As said earlier, the `grep` command should also support the following flags:

- `-n` Print the line numbers of each matching line.
- `-l` Print only the names of files that contain at least one matching line.
- `-i` Match line using a case-insensitive comparison.
- `-v` Invert the program -- collect all lines that fail to match the pattern.
- `-x` Only match entire lines, instead of lines that contain a match.

If we run `grep -n "hello" input.txt`, the `-n` flag will require the matching
lines to be prefixed with its line number:

```text
1:hello
3:hello again
```

And if we run `grep -i "HELLO" input.txt`, we'll do a case-insensitive match,
and the output will be:

```text
hello
hello again
```

The `grep` command should support multiple flags at once.

For example, running `grep -l -v "hello" file1.txt file2.txt` should
print the names of files that do not contain the string "hello".

## To `grep` or not to `grep`, that is the question

Although this exercise can be trivially solved by simply passing the
arguments to `grep`, implement this exercise using bash only.  The aim 
of this exercism track is to learn how to use bash builtin commands to solve
problems.

To solve this exercise, you'll need to:

* parse command line arguments: [`getopts`](https://stackoverflow.com/tags/getopts/info) is useful for this.
* iterate over the lines of a file: this is [bash FAQ #1](https://mywiki.wooledge.org/BashFAQ/001)
* use regular expression matching: bash can do this using the `=~` operator
  within [`[[ ... ]]`](https://www.gnu.org/software/bash/manual/bash.html#index-_005b_005b)

---



Run the tests with:

```bash
bats grep_test.sh
```

After the first test(s) pass, continue by commenting out or removing the
`[[ $BATS_RUN_SKIPPED == true ]] || skip` 
annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, run:

```bash
BATS_RUN_SKIPPED=true bats grep_test.sh
```

## Source

Conversation with Nate Foster. [http://www.cs.cornell.edu/Courses/cs3110/2014sp/hw/0/ps0.pdf](http://www.cs.cornell.edu/Courses/cs3110/2014sp/hw/0/ps0.pdf)


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
