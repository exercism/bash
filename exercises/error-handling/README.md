# Error Handling

Implement various kinds of error handling and resource management.

An important point of programming is how to handle errors and close
resources even if errors occur.

This exercise requires you to handle various errors. Because error handling
is rather programming language specific you'll have to refer to the tests
for your track to see what's exactly required.


Run the tests with:

```bash
bats error_handling_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `skip` annotations prepending other tests.



## External utilities
`Bash` is a language to write scripts that works closely with various system utilities,
like [`sed`](https://www.gnu.org/software/sed/), [`awk`](https://www.gnu.org/software/gawk/), [`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html) and even other programming languages, like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long as your solution is portable
between systems and does not require installing third party applications, feel free to use them to solve the exercise.

For an extra challenge, if you would like to have a better understanding of the language,
try to re-implement the solution in pure `Bash`, without using any external tools.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
