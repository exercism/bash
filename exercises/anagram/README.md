# Anagram

Given a word and a list of possible anagrams, select the correct sublist.

Given `"listen"` and a list of candidates like `"enlists" "google"
"inlets" "banana"` the program should return a list containing
`"inlets"`.


Run the tests with:

```bash
bats anagram_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `skip` annotations prepending other tests.

## Source

Inspired by the Extreme Startup game [https://github.com/rchatley/extreme_startup](https://github.com/rchatley/extreme_startup)


## External utilities
`Bash` is a language to write scripts that works closely with various system utilities,
like [`sed`](https://www.gnu.org/software/sed/), [`awk`](https://www.gnu.org/software/gawk/), [`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html) and even other programming languages, like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long as your solution is portable
between systems and does not require installing third party applications, feel free to use them to solve the exercise.

For an extra challenge, if you would like to have a better understanding of the language,
try to re-implement the solution in pure `Bash`, without using any external tools.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
