# Introduction to Redirection

In the world of the command-line interface, programs often interact with three standard data streams:

1. **Standard Input** (`stdin`): Where a program receives its input (typically from the keyboard).
1. **Standard Output** (`stdout`): Where a program sends its normal output (typically to the terminal screen).
1. **Standard Error** (`stderr`): Where a program sends error messages (typically to the terminal screen).

Recall that we introduced these in the [Pipelines and Command Lists][pipelines] chapter.

~~~~exercism/note
Pipelines can be considered a form of redirection: the standard output from one program is sent directly to the standard input of another.
We've already covered pipelines.
This concept will cover redirecting to and from files.
~~~~

Shell redirection is a powerful mechanism that allows you to change the destination of these streams.
Instead of a program reading from the keyboard or writing to the screen, you can redirect input from a file or send output to a file.
This provides considerable flexibility and control over how programs interact with data.

## Key Redirection Operators

Here are the most common redirection operators and what they do:

### `>` (Output Redirection)

* Purpose: Redirect the standard output (`stdout`) of a command to a file.
* Behavior:
  * If the file doesn't exist, it is created.
  * If the file exists, its contents are overwritten.
* Example:

  ```bash
  # Sends the output of 'ls -l' to 'file_listing.txt'
  ls -l > file_listing.txt
  ```

~~~~exercism/caution
Redirection is performed **before** the command is executed.
This means you cannot redirect to the same file you need to read from.

```bash
date > date.txt         # populate the file with the current date
cat date.txt > date.txt # 'date.txt' is now empty!
```

In the second command of the above example,

1. Bash first truncates the file named in the redirection.
   This destroys the previous contents, leaving an empty file.
2. Then bash reads the newly empty file.
3. Then bash writes the contents (i.e., nothing) back to the file.
~~~~

### `>>` (Append Output Redirection)

* Purpose: Append the standard output (`stdout`) of a command to a file.
* Behavior:
  * If the file doesn't exist, it is created.
  * If the file exists, the output is added to the end of the file.
* Example:

  ```bash
  # Adds "Another line" to the end of the file
  echo "Another line" >> file_listing.txt
  ```

### `<` (Input Redirection)

* Purpose: Redirect the standard input (`stdin`) of a command from a file.
* Behavior: The command reads its input from the specified file instead of the keyboard.
* Example:

  ```bash
  # 'tr' reads from 'lowercase.txt' and
  # output is redirected to 'uppercase.txt'
  tr 'a-z' 'A-Z' < lowercase.txt > uppercase.txt
  ```

### `2>` (Error Redirection):

* Purpose: Redirect the standard error (`stderr`) of a command to a file.
* Behavior: Error messages are sent to the specified file instead of the terminal.
* Example:
  ```bash
  # Error message from 'rm' is sent to 'error_log.txt'
  rm non_existent_file 2> error_log.txt
  ```

You can _append_ standard error to a file with `2>>`.

### Additional Redirections

There are also redirections that can merge both `stdin` and `stderr`.
See the [manual][manual] for details.

## `/dev/null`

`/dev/null` is a special file that

* is an empty file when you read from it, and
* discards all data written to it.

It is sometimes referred to as "the bitbucket".
It is useful for suppressing output or errors.

```bash
some_command > /dev/null  # Discards stdout
some_command 2> /dev/null # Discards stderr

# Using /dev/null as input will prevent the command
# from reading data from the keyboard
some_command < /dev/null
```

## Combining redirections

Multiple redirections can be given at once.

```bash
some_command < input.txt > output.txt 2> error.txt
```

A redirection can be copied.

```bash
# send stderr to the same destination as stdout
some_command > output.txt 2>&1
```

When you see `2>&1`, read that like "redirect stderr to _whatever stdout is **currently** pointing to_".
Bash processes redirection instructions strictly from left to right, which means you can do:

```bash
# redirect stdout to 'output1.txt'
# redirect stderr to the same place
# then change stdout to 'output2.txt'
some_command > output1.txt 2>&1 > output2.txt
```

~~~~exercism/advanced
## File Descriptors

In the context of shell programming and operating systems like Linux/Unix, a file descriptor (FD) is a non-negative integer that serves as an identifier or handle for an open file or I/O (Input/Output) resource.
Think of it like a label or a reference number that the operating system uses to keep track of open files and data streams.

The numbers you see on the left-hand side of redirections are file descriptors.

The standard I/O streams are given the first 3 file descriptors:

* standard input is FD 0
* standard output is FD 1
* standard error is FD 2

New file descriptors can be set or created with the `exec` command and redirection operators.

```bash
# create FD 3 as a copy of stdout
exec 3>&1
# send stdout to a log file
exec > log.txt

# then redirect both stdout and file descriptor 3
echo "some debug message" >&3  # displayed in the terminal
some_command  2>&1 # stdout and stderr send to 'log.txt'
```

This technique looks quite convoluted, but it can be very useful in situations where your script is being run by some other software package, and standard output is automatically captured by the software.
The `bats` command that is used to run unit tests for this track works like this: `bats` captures a test's stdout and stderr, but debug messages sent to FD 3 will be displayed on the terminal.
~~~~

## In Summary

Why is redirection useful?

* Saving Output: Store the results of a command for later review or processing.
* Logging: Capture error messages for debugging.
* Automation: Chain commands together, using the output of one as the input of another.
* Filtering: Discard unwanted output.
* Batch Processing: Process data from files instead of typing it manually.
* Scripting: Redirections are essential for writing robust shell scripts.

Shell redirections give you fine-grained control over how programs interact with data, enabling you to build complex workflows and manage information effectively.

[pipelines]: https://exercism.org/tracks/bash/concepts/pipelines
[manual]: https://www.gnu.org/software/bash/manual/bash.html#Redirections