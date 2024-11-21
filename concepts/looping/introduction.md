# Looping

Bash has two forms of looping:

* Repeat some commands _for each item in a list of items_,
* Repeat some commands _while some condition is true (or false)_.

## For Loops

To iterate over a list of items, we use the `for` loop.

```bash
for varname in words; do COMMANDS; done
```

`words` is expanded using word splitting and filename expansion (that we learned about in the [Quoting concept][quoting]).
Each word is assigned to the `varname` in turn, and the COMMANDS are executed.

Here are some examples that show when the for loop can be useful

* Perform some commands on a group of files.

    ```bash
    # source all the bash library files in the current directory
    for file in ./*.bash; do
        source "$file"
    done
    ```

* Perform some command on each of the parameters to a script or function.

    ```bash
    for arg in "$@"; do
        echo "argument: ${arg}"
    done
    ```

* Perform some command for each whitespace-separated word in the output of a command.

    ```bash
    for i in $(seq 10); do
        echo "${i} squared is $((i * i))"
    done
    ```

    We'll see some warnings about this style later on.

### Arithmetic For Loop

Bash does have an arithmetic loop.
This will look somewhat familiar to other programming languages.

```bash
for ((INITIALIZATION; CONDITION; INCREMENT)); do COMMANDS; done
```

The double-parentheses in bash represents an arithmetic context (we'll see more about bash arithmetic in a later concept).
The above example using `seq` can be written like this

```bash
for ((i = 1; i <= 10; i++)); do
    echo "${i} squared is $((i * i))"
done
```

### When Not To Use For

[Don't read lines with `for`][bashfaq1].

This is an anti-pattern you'll often see: iterating over the output of `cat`.

```bash
for line in $(cat some.file); do 
    do_something_with "$line"
done
```

This is wrong on 2 counts.

1. The command substitution is unquoted, so it is subject to word splitting.
   Word splitting, by default, splits on _whitespace_ not just newlines.
   This for loop is iterating over the **words** in the file, not the lines.
2. The command substitution is unquoted, so it is subject to filename expansion.
   Every word in the file will be matched as a glob pattern.

As we learned in the [Quoting concept][quoting], word splitting can be controlled with the `IFS` variable, and filename expansion can be turned off.
But this tends to be a fragile solution.
`for` is the wrong method to iterate over the lines of a file.
The idiomatic way to read a file is with a `while` loop.

## While Loops

Use `while` to repeat a sequence of commands _while_ some condition is true.

```bash
while CONDITION_COMMANDS; do COMMANDS; done
```

As with `if` (as we learned in the [Conditionals concept][conditionals], there is no special syntax for CONDITION_COMMANDS.
The exit status of the command list will determine "true" or "false".

## Controlling Loops

The `break` command jumps out of the loop.
Control resumes with the command following the loop's `done` terminator.

The `continue` command jumps to the next iteration of the loop.

## Reading the Lines of a File

As mentioned, a while loop is the idiomatic way to read a file. 

```bash
while IFS= read -r line; do
    do_something_with "$line"
done < some.file
```

* The content of the file is provided as input to the loop with the `<` redirection.
* The `read` command returns "true" if it can read a full line from its input.
  When the input is consumed, or if the last line ends without a trailing newline, then read returns "false".
  * The _truly_ idiomatic way to read the lines of a file, even if the last line does not end with a newline, is

    ```bash
    while IFS= read -r line || [[ -n "$line" ]]; do ...
    ```

* The `-r` option tells `read` to not substitute backslash sequences: a backslash is just a plain character.
* `IFS=` assigns the empty string to IFS only for the duration of the read command.
  This temporarily turns off word splitting so that any leading or trailing whitespace in the incoming line of text is preserved.

## Until

The `until` construct repeats a sequence of commands while some condition is **false**.
The loop repeats _until_ the condition becomes true.

```bash
until CONDITION_COMMANDS; do COMMANDS; done
```

It is rare to use `until`.
It is more common to use a "while not" loop.

```bash
while ! CONDITION_COMANDS; do ...
```

## Infinite Loops

Sometimes you want to loop forever.
Here are two ways to do it.

1. a while loop with a condition that always has a success exit status

    ```bash
    while true; do ...
    ```

2.  an arithmetic for loop with empty expressions

    ```bash
    for ((;;)); do ...
    ```

## Do-While

There is no explicit do-while construct, but you can achieve the same effect:

```bash
while true; do
    COMMANDS

    if END_CONDITION; then
        break
    fi
done
```

[bashfaq1]: https://mywiki.wooledge.org/DontReadLinesWithFor
[quoting]: https://exercism.org/tracks/bash/concepts/quoting
[conditionals]: https://exercism.org/tracks/bash/concepts/conditionals
