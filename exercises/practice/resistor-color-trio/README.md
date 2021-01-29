# Resistor Color Trio

If you want to build something using a Raspberry Pi, you'll probably use _resistors_. For this exercise, you need to know only three things about them:

- Each resistor has a resistance value.
- Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.
  To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values.
- Each band acts as a digit of a number. For example, if they printed a brown band (value 1) followed by a green band (value 5), it would translate to the number 15.
  In this exercise, you are going to create a helpful program so that you don't have to remember the values of the bands. The program will take 3 colors as input, and outputs the correct value, in ohms.
  The color bands are encoded as follows:

* Black: 0
* Brown: 1
* Red: 2
* Orange: 3
* Yellow: 4
* Green: 5
* Blue: 6
* Violet: 7
* Grey: 8
* White: 9

In `resistor-color duo` you decoded the first two colors. For instance: orange-orange got the main value `33`.
The third color stands for how many zeros need to be added to the main value. The main value plus the zeros gives us a value in ohms.
For the exercise it doesn't matter what ohms really are.
For example:

- orange-orange-black would be 33 and no zeros, which becomes 33 ohms.
- orange-orange-red would be 33 and 2 zeros, which becomes 3300 ohms.
- orange-orange-orange would be 33 and 3 zeros, which becomes 33000 ohms.

(If Math is your thing, you may want to think of the zeros as exponents of 10. If Math is not your thing, go with the zeros. It really is the same thing, just in plain English instead of Math lingo.)

This exercise is about translating the colors into a label:

> "... ohms"

So an input of `"orange", "orange", "black"` should return:

> "33 ohms"

When we get more than a thousand ohms, we say "kiloohms". That's similar to saying "kilometer" for 1000 meters, and "kilograms" for 1000 grams.
So an input of `"orange", "orange", "orange"` should return:

> "33 kiloohms"


Run the tests with:

```bash
bats resistor_color_trio_test.sh
```

After the first test(s) pass, continue by commenting out or removing the
`[[ $BATS_RUN_SKIPPED == true ]] || skip` 
annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, run:

```bash
BATS_RUN_SKIPPED=true bats resistor_color_trio_test.sh
```

## Source

Maud de Vries, Erik Schierboom [https://github.com/exercism/problem-specifications/issues/1549](https://github.com/exercism/problem-specifications/issues/1549)


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
