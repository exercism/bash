# Triangle

Determine if a triangle is equilateral, isosceles, or scalene.

An _equilateral_ triangle has all three sides the same length.

An _isosceles_ triangle has at least two sides the same length. (It is sometimes
specified as having exactly two sides the same length, but for the purposes of
this exercise we'll say at least two.)

A _scalene_ triangle has all sides of different lengths.

## Note

For a shape to be a triangle at all, all sides have to be of length > 0, and
the sum of the lengths of any two sides must be greater than or equal to the
length of the third side. See [Triangle Inequality](https://en.wikipedia.org/wiki/Triangle_inequality).

## Dig Deeper

The case where the sum of the lengths of two sides _equals_ that of the
third is known as a _degenerate_ triangle - it has zero area and looks like
a single line. Feel free to add your own code/tests to check for degenerate triangles.


Run the tests with:

```bash
bats triangle_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `skip` annotations prepending other tests.

## Source

The Ruby Koans triangle project, parts 1 & 2 [http://rubykoans.com](http://rubykoans.com)


## POSIX compliance
On this track full POSIX compliance is not required. Therefore feel free to use any tool you need to complete
the exercises, like `sed`, `awk`, `date` or even `python`. As long as the solution is portable between systems
and does not require installing third party applications, it will be accepted.

However, once you have completed and submitted the exercise, take a second look at you solution.
Maybe the same results could be achieved in pure Bash, without using any external tools?

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
