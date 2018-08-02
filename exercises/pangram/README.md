# Pangram

Determine if a sentence is a pangram. A pangram (Greek: παν γράμμα, pan gramma,
"every letter") is a sentence using every letter of the alphabet at least once.
The best known English pangram is:
> The quick brown fox jumps over the lazy dog.

The alphabet used consists of ASCII letters `a` to `z`, inclusive, and is case
insensitive. Input will not contain non-ASCII symbols.


Run the tests with:

```bash
bats pangram_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `skip` annotations prepending other tests.

## Source

Wikipedia [https://en.wikipedia.org/wiki/Pangram](https://en.wikipedia.org/wiki/Pangram)


## POSIX compliance
On this track full POSIX compliance is not required. Therefore feel free to use any tool you need to complete
the exercises, like `sed`, `awk`, `date` or even `python`. As long as the solution is portable between systems
and does not require installing third party applications, it will be accepted.

However, once you have completed and submitted the exercise, take a second look at you solution.
Maybe the same results could be achieved in pure Bash, without using any external tools?

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
