# Introduction

## Variables

_Variables_ are a place to hold data.
Bash has two kinds of data: strings and arrays.
We'll talk about arrays later.

You assign a variable like this
```bash
varname="the value"
```

~~~~exercism/note
**Important** -- there must be _no spaces_ around the equal sign!

When there are spaces, like in this example,

```bash
x = 10
```

bash is going to call the **command** `x` with the **two arguments** `=` and `10`!
~~~~

Variables can also be called _parameters_.
The two terms will be used interchangably in this document.

Some important parameters used by or set by bash include:

* `PATH` -- a colon-separated list of directories used to find external commands.
* `IFS` -- the "internal field separator".
   We'll see how it's used below.
* `PWD` -- your current working directory.
   It will be the same value as the output of the `pwd` command.
* `RANDOM` -- a pseudo-random integer between 0 and 32767.
* `BASH_VERSION` -- the version string of the running instance of bash.

## Variable Names

A variable name consists of _uppercase letters, lowercase letters, numbers and underscore_.
It cannot start with a number.

~~~~exercism/caution
It is best practice to **avoid using ALLCAPS variable names**.
The shell uses this convention for its parameters, and you don't want to accidentally overwrite shell parameters that have special meaning.
For example: [1][1], [2][2], [3][3]

[1]: https://stackoverflow.com/q/27555060/7552
[2]: https://stackoverflow.com/q/28310594/7552
[3]: https://unix.stackexchange.com/q/114596/4667
~~~~

## Parameter Expansion

You get the value of a parameter with the `$varname` syntax.

```bash
x=10
echo "The value of x is $x"
```

To prevent the variable name from being confused with surrounding text, you can enclose the variable name in braces.
For example to print the string `10x10`

```bash
echo "${x}x$x"
# or
echo "${x}x${x}"
```

Some [style guides][google-style-guide] recommend using braces in most cases for readability and/or consistency.

## Positional Parameters

As we discussed in the [Commands and Arguments][cmds-args] lesson, commands can take arguments.
Bash scripts are no exception.
The arguments to the current instance of bash are called _positional parameters_.
They can be retrieved with these special parameters:

* `$1` -- the first positional parameter
* `$2` ... `$9` -- subsequent parameters
* `${10}` ... -- double digits require braces.
* `$0` -- the name of the current script.

Arguments to a shell function are also positional parameters, handled just like this.
We'll see more about functions in a later lesson.

### Special Positional Parameters

There are some _special parameters_ that help you work with the positional parameters.

* `$#` expands to the _number_ of positional parameters.
* `"$@"` expands to the list of all of the positional parameters, each as a separate word.
* `"$*"` expands to a single string of all the positional parameters joined together by a character.
  * The join character is _the first character_ of the `$IFS` variable, which is a space by default.

The `"$@"` is the safest way to pass positional parameters to another command while keeping them safely quoted.
It is also what you will use to loop over the positional parameters:

```bash
for arg in "$@"; do
    do_something_with "$arg"
done
```

In practice, `"$@"` is used more often than `"$*"`.

## Command Substitution

A very frequent operation you will do in bash scripts is to capture the output of a command and store it in a variable.
To do this, you will use _command substitution_.

```bash
var=$(command)
```

For example, to upper-case a string, you can do this:

```bash
text="Hello world!"
uppercase=$(echo "$text" | tr '[:lower:]' '[:upper:]')
echo "$uppercase"
# => HELLO WORLD!
```

## More on Parameter Expansion

Bash has many builtin facilities to manipulate variables and strings so that you don't need to call out to external commands.

* Uppercasing text.
  In the previous section I showed how to use `tr` to upper case some text.
  To do it in bash:

  ```bash
  echo "${text^^}"
  ```

  Similarly, `${text,,}` lowercases the value.

* Provide a default value if the variable is empty.

  ```bash
  default="nothing here"
  result=""
  echo "${result:-$default}"
  # => nothing here
  ```

* Search and replace.

  ```bash
  text="Hello world!"
  echo "${text//[aeiou]/X}"
  # => HXllX wXrld!"
  ```

There are many other interesting parameter expansions: extract a substring, get the string length, _assign_ a default value, remove text from the start or end of the value, and more.
Read about them [in the manual][param-exp].


[google-style-guide]: https://google.github.io/styleguide/shellguide.html
[cmds-args]: https://exercism.org/tracks/bash/concepts/commands-and-arguments
[param-exp]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
