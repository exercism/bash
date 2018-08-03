# Hello World

The classical introductory exercise. Just say "Hello, World!".

["Hello, World!"](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program) is
the traditional first program for beginning programming in a new language
or environment.

The objectives are simple:

- Write a function that returns the string "Hello, World!".
- Run the test suite and make sure that it succeeds.
- Submit your solution and check it at the website.

If everything goes well, you will be ready to fetch your first real exercise.

# Welcome to Bash!

Unlike many other languages here, bash is a bit of a special snowflake.
If you are on a Mac or other unix-y platform, you almost definitely
already have bash. In fact, anything you type into the terminal is
likely going through bash.

The downside to this is that there isn't much of a development
ecosystem around bash like there is for other languages, and there are
multiple versions of bash that can be frustratingly incompatible. Luckily
we shouldn't hit those differences for these basic examples, and if you
can get the tests to pass on your machine, we are doing great.

## Installation

As mentioned above, if you are on a unix-like OS (Mac OS X, Linux, Solaris,
etc), you probably already have bash.

## Testing

As there isn't much of a bash ecosystem, there also isn't really a de
facto leader in the bash testing area. For these examples we are using
[bats](https://github.com/sstephenson/bats). You should be able to
install it from your favorite package manager, on OS X with homebrew
this would look something like this:

```
$ brew install bats
==> Downloading
https://github.com/sstephenson/bats/archive/v0.4.0.tar.gz
==> Downloading from
https://codeload.github.com/sstephenson/bats/tar.gz/v0.4.0
########################################################################
100.0%
==> ./install.sh /opt/boxen/homebrew/Cellar/bats/0.4.0
🍺  /opt/boxen/homebrew/Cellar/bats/0.4.0: 10 files, 60K, built in 2
seconds
```



Run the tests with:

```bash
bats hello_world_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `skip` annotations prepending other tests.

## Source

This is an exercise to introduce users to using Exercism [http://en.wikipedia.org/wiki/%22Hello,_world!%22_program](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program)


## External utilities
`Bash` is a language to write scripts that works closely with various system utilities,
like [`sed`](https://www.gnu.org/software/sed/), [`awk`](https://www.gnu.org/software/gawk/), [`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html) and even other programming languages, like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long as your solution is portable
between systems and does not require installing third party applications, feel free to use them to solve the exercise.

For an extra challenge, if you would like to have a better understanding of the language,
try to re-implement the solution in pure `Bash`, without using any external tools.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
