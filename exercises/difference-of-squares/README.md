# Difference Of Squares

Find the difference between the square of the sum and the sum of the squares of the first N natural numbers.

The square of the sum of the first ten natural numbers is
(1 + 2 + ... + 10)² = 55² = 3025.

The sum of the squares of the first ten natural numbers is
1² + 2² + ... + 10² = 385.

Hence the difference between the square of the sum of the first
ten natural numbers and the sum of the squares of the first ten
natural numbers is 3025 - 385 = 2640.


Run the tests with:

```bash
bats difference_of_squares_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `skip` annotations prepending other tests.

## Source

Problem 6 at Project Euler [http://projecteuler.net/problem=6](http://projecteuler.net/problem=6)


## POSIX compliance
On this track full POSIX compliance is not required. Therefore feel free to use any tool you need to complete
the exercises, like `sed`, `awk`, `date` or even `python`. As long as the solution is portable between systems
and does not require installing third party applications, it will be accepted.

However, once you have completed and submitted the exercise, take a second look at you solution.
Maybe the same results could be achieved in pure Bash, without using any external tools?

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
