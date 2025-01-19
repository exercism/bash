# Introduction to Pipelines and Command Lists

We have seen how to write simple commands, where a command is followed by arguments.
Now we will see how to make more complex commands by composing simple commands.

## Input and Output

Before we start, a quick introduction to input/output.

Processes have "standard I/O channels".

* A process can consume _input_ on "stdin".
* A process can emit _output_ on "stdout".
* A process can emit _error output_ on "stderr".

The `tr` command is a very pure example of this.
All it does is read text from its input, perform character transliterations, and print the resulting text to its output.

We will see more about manipulating "stdio" channels later in the syllabus.

## Pipelines

This is one of the "killer features" of shell programming.
Pipelines allow you create sophisticated transformations on a stream of text.

To produce a sorted list of users:

```bash
cat /etc/passwd | cut -d : -f 1 | sort
```

The pipe symbol (`|`) connects the output of one command to the input of another.
`cut` reads the output of `cat`, and `sort` reads the output of `cut`.

~~~~exercism/advanced
* By default, each command in a pipeline runs in a separate subshell.
  (A subshell is a child process that is a copy of the currently running shell.)

* There is a performance cost to running pipelines.
  If you find yourself with long pipelines of similar commands, consider combining them in a single command.
  For example, pipelines using multiple instances of `grep`, `cut`, `sed`, `awk`, and `tr` can generally be combined into a single `awk` command for efficiency.

* The exit status of a pipeline is the exit status of the last command in the pipeline.
  That means if some earlier command failed but the last command succeeded, the exit status of the whole pipline is zero.

  There is a shell setting that can change this;
  if the "pipefail" setting is enabled (with `set -o pipefail`) then the pipeline's exit status will be:
  * zero if all commands succeed, otherwise
  * the _**last** non-zero exit status_ of the commands in the pipeline.
~~~~

## Command Lists

A command list is a sequence of pipelines separated by `;` (or newline), `&&` or `||`.

* `A; B` is a command list where `B` executes after `A` has completed.
* `A && B`, where `B` executes only if `A` succeeds (exits with status zero).
* `A || B`, where `B` executes only if `A` fails (exits with status non-zero).

The exit status of a command list is the exit status of the last command that was executed.

The `&&` and `||` operators can be chained so that the next command conditionally executes based on the status of the preceding commands.
For example

```bash
A && B && C && D || E
```

* B executes if A succeeds,
* C executes if A and B succeed,
* D executes if A and B and C succeed,
* E executes if **any** of A, B, C or D fails.

~~~~exercism/caution
Use these logical operators sparingly.
They can quickly lead to unreadable code, or logic that is hard to comprehend.

For example, you may think these are the same:

```bash
if A; then B; else C; fi
```

```bash
A && B || C
```

The difference is: when does C execute?

* In the first snippet (the if statement), C will execute only if A fails.
* In the second snippet, C will execute if A fails _or if A succeeds but B fails_!
~~~~

### Uses of Command Lists

Here are a couple of examples where command lists can simplify the code.

#### Reading blocks of lines from a file

Suppose you have a data file containing data about triangles,
and a triangle is represented by three separate lines holding the sides of the triangle.

```bash
$ cat triangle.dat
3
4
5
9
12
14
```

You can use a while loop where the condition is three separate read commands:

```bash
while read a && read b && read c; do
    if is_pythagorean "$a" "$b" "$c"; then
        echo "$a:$b:$c is pythagorean"
    else
        echo "$a:$b:$c is not pythagorean"
    fi
done < triangle.dat
```

Assuming `is_pythagorean` is a command that determines if the three sides satisfy the Pythagoran equation, the output would be:

```none
3:4:5 is pythagorean
9:12:14 is not pythagorean
```

#### Assertions

Many programming languages have a form of assertion where an exception is thrown if some condition fails

```
assert(user == "Administrator", "wrong user");
```

We can use an OR operator in Bash to simulate that function:

```bash
die () { # a little convenience function
    echo "$*" >&2
    exit 1
}

[[ $user == "Administrator" ]] || die "wrong user"
[[ $password == "secret!" ]]   || die "incorrect password"
```

## Style Considerations

Long command lists become hard to read quite quickly.
Liberal use of newlines can help a lot.

Consider this example where a word is added to an array if two conditions are met.

```bash
[[ "$word" != "$topic" ]] && [[ "$key" == "$(sorted "$topic")" ]] && anagrams+=("$candidate")
```

Bash allows you to add a newline after a pipe or a logical operator.

```bash
[[ "$word" != "$topic" ]] &&
[[ "$key" == "$(sorted "$topic")" ]] &&
anagrams+=("$candidate")
```

However, the operator can be easy to miss at the end of the line.
Using a _line continuation_ means you can put the operator first, which makes it more obvious that the list is being continued:

```bash
[[ "$word" != "$topic" ]] \
&& [[ "$key" == "$(sorted "$topic")" ]] \
&& anagrams+=("$candidate")
```

~~~~exercism/note
A _line continuation_ is the two character sequence "backslash" and "newline" (`\` + `\n`).
When Bash sees that sequence, it is simply removed from the code, thereby _continuing_ the current line with the next line.
Take care to not allow any spaces between the backslash and the newline.
~~~~

Here's another example

```bash
printf "%s\n" "${numbers[@]}" | bc --mathlib | sort --general-numeric-sort
```

or 

```bash
printf "%s\n" "${numbers[@]}" \
| bc --mathlib \
| sort --general-numeric-sort
```
