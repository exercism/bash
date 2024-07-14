# Introduction

Before we start, what is the bash track on Exercism about?
It is about learning to write programs using bash.
The particular emphasis is using only bash to solve problems, but there are no restrictions on calling out to external tools.

It is not about how to use bash as an interactive shell.
You won't learn about how to customize your prompt, how to configure your command history, or other interactive-only features.

On with the lesson!

## Bash Fundamentals: Commands and Arguments

Bash reads commands from its input (which is usually either a terminal or a file).
Each line of input that it reads is treated as a _command_ — an instruction to be carried out.
(There are a few advanced cases, such as commands that span multiple lines, that will be gotten to later.)

Bash divides each line into words that are demarcated by a whitespace character (spaces and tabs).
The first word of the line is the name of the command to be executed.
All the remaining words become _arguments_ to that command (options, filenames, etc.).

Assume we're in an empty directory... (to try these commands, create an empty directory called `test` and enter that directory by running: `mkdir test; cd test`):

```bash
$ ls              # List files in the current directory (no output, no files).
$ touch a b c     # Create files 'a', 'b', and 'c'.
$ ls              # List files again, and this time outputs: 'a', 'b', and 'c'.
a  b  c
```

The command `ls` prints out the names of the files in the current directory.
The first time we run the list command we get no output, because there are no files yet.

The `#` character at the start of a word indicates a _comment_.
Any words following the comment are ignored by the shell, meant only for reading.
If we run these examples in our own shell, we don't have to type the comments; but even if we do, the command will still work.

`touch` is an application that changes the Last Modified time of a file.
If the filename that it is given does not exist yet, it creates a file of that name as a new and empty file.
In this example, we passed three arguments: `a`, `b` and `c`.
`touch` creates a file for each argument.
`ls` shows us that three files have been created.

```bash
$ rm *            # Remove all files in the current directory.
$ ls              # List files in the current directory (no output, no files).
$ touch a   b c   # Create files 'a', 'b' and 'c'.
$ ls              # List files again; this time the outputs: 'a', 'b' and 'c'.
a  b  c
```

`rm` is an application that removes all the files that it was given.
`*` is a [glob][glob].
It basically means all and in this case means all files in the current directory.
We will talk more about globs later.

Now, did we notice that there are several spaces between `a` and `b`, and only one between `b` and `c`?
Also, notice that the files that were created by touch are no different than the first time.
The amount of whitespace between arguments does not matter!
This is important to know.
For example:

```bash
$ echo This is a test.
This is a test.
$ echo This    is    a    test.
This is a test.
```

`echo` is a command that prints its arguments to standard output (which in our case is the terminal).
In this example, we provide the `echo` command with four arguments: 'This', 'is', 'a', and 'test.'.
`echo` takes these arguments, and prints them out one by one with a space in between.
In the second case, the exact same thing happens.
The extra spaces make no difference.
If we want the extra whitespace, we need to pass the sentence as one single argument.
We can do this by using [quotes][Quotes]:

```bash
$ echo "This    is    a    test."
This    is    a    test.
```

Quotes group everything inside them into a _single argument_.
The argument is: '`This    is    a    test.`' ... specifically spaced.
Note that the quotes are not part of the argument — Bash removes them before handing the argument to echo.
`echo` prints this single argument out just like it always does.

Be very careful to avoid the following:

```bash
$ ls                                          # There are two files in the current directory.
The secret voice in your head.mp3  secret
$ rm The secret voice in your head.mp3        # Executes rm with 6 arguments; not 1!
rm: cannot remove `The': No such file or directory
rm: cannot remove `voice': No such file or directory
rm: cannot remove `in': No such file or directory
rm: cannot remove `your': No such file or directory
rm: cannot remove `head.mp3': No such file or directory
$ ls                                          # List files in the current directory: It is still there.
The secret voice in your head.mp3             # But your file 'secret' is now gone!
```

We need to make sure we quote filenames properly.
If we don't, we'll end up deleting the wrong things!
`rm` takes filenames as arguments.
If our filenames have spaces and we do not quote them, Bash thinks each word is a separate argument.
Bash hands each argument to `rm` separately.
Like individually wrapped slices of processed cheese, `rm` treats each argument as a separate file.

In the above example, `rm` tried to delete a file for each word in the filename of the song, rather than keeping the filename intact.
That caused our file secret to be deleted, and our song to remain behind!

This is what we should have done:

```bash
$ rm "The secret voice in your head.mp3"
```

Arguments are separated from the command name and from each other by a whitespace.
This is important to remember.
For example, the following is wrong:

```bash
$ [-f file]
bash: [-f: command not found
```

This is intended to test for the existence of a file named "file".
It's reasonable to assume that whitespace around `[` and `]` doesn't matter, but `[` is actually a command, and it requires its last argument to be `]`.
(We will cover the `[` command in more detail later.) 
Therefore, we must separate `[` from `-f` and `]` from `file,.` otherwise Bash will think we are trying to execute a command named `[-f` with a single argument `file]`.
The correct command separates all arguments with whitespace:

```bash
$ [ -f file ]
```

(We see a lot of people who are confused by this behavior; they think that they can omit the whitespace between `[` and its arguments, so we need to present this particular example early.)

And, if our filename contains whitespace or other special characters, it should also be quoted:

```bash
$ [ -f "my file" ]
```

## Review:

_Arguments_: These are additional words specified after the command ('`ls -l foo`' executes ls with two arguments).

_Quotes_: The two forms of quotes, single and double (`'` and `"`), are used to group words and can protect special characters.
The difference between `'` and `"` will be discussed later.

Tip — **Always** quote sentences or strings that belong together, even if it's not absolutely necessary.
This developed practice will reduce the risk of human error in the scripts. (e.g. quoting a sentence of an `echo` command).

## Strings

The term _string_ refers to a sequence of characters which is treated as a single unit.
The term is used loosely throughout this guide, as well as in almost every other programming language.

In Bash programming, almost _everything_ is a string.
When we type a command, the command's name is a string and each argument is a string; variable names are strings, and the contents of variables are strings as well; a filename is a string, and most files contain strings.
They're everywhere!

An entire command can also be considered a string.
This is not normally a useful point of view, but it illustrates the fact that parts of strings can sometimes be considered strings in their own right.
A string which is part of a larger string is called a substring.

Strings do not have any intrinsic meaning.
Their meaning is defined by how and where they are used.

Let's try another example.
With the editor, write a shopping list and save it with the filename "list", and use `cat` to print it:

```bash
$ cat list
shampoo
tissues
milk (skim, not whole)
```

We typed a command: `cat list`.
The shell reads this command as a string, and then divides it into the substrings `cat` and `list`.
As far as the shell is concerned, `list` has no meaning, it's just a string with four characters in it.
`cat` receives the argument `list`, which is a string of a filename.
The string `list` has become meaningful because of how it was used.

The file happens to contain some text, which we see on our terminal.
The entire file content — taken as a whole — is a string, but that string is not meaningful.
However, if we divide the file into _lines_ (and therefore treat each line as a separate string), then we see each individual _line_ has meaning.

We can divide the final line into words, but these words are not meaningful by themselves.
We can't buy "(skim" at the store, and we might get the wrong kind of "milk".
Dividing the lines into words is not a useful thing to do in this example.
But the shell doesn't know any of this — only we do!

So, when we are dealing with commands, data, and variables — all of which are just strings to the shell — we have all the responsibility.
We need to be sure everything that needs to be separated is separated properly, and everything that needs to stay together stays together properly.
We'll touch on these concepts repeatedly as we continue.

## Types of commands

Bash understands several different types of commands: aliases, functions, builtins, keywords, and executables.

Aliases are only enabled in interactive shells, not shell scripts.
We won't cover them here.

### Functions

A function contains shell commands, and acts very much like a small script; they can even take arguments and create local variables.
When a function is called, the commands in it are executed. Functions will be covered in depth later.

### Builtins

Bash has some basic commands built into it, such as: `cd` (change directory), `echo` (write output), and so on.
They can be thought of as functions that are already provided.

### Keywords

Keywords are like builtins, with the main difference being that keywords are actually Bash syntax and may be parsed using special rules.
For example, `[` is a Bash builtin, while `[[` is a Bash keyword; they are both used to test for a variety of conditions.
Here we try to use them to compare the words "a" and "b" lexicographically:


```bash
$ [ a < b ]
-bash: b: No such file or directory
$ [[ a < b ]]
```

The first example returns an error because, as usual, Bash treats `<` as a file redirection operator and attempts to redirect the nonexistent file `b` to the command `[ a ]`.
The second example works because Bash parses words between `[[` and `]]` using different rules that don't use `<` for redirection.

### Executables

The last kind of command that can be executed by Bash is an _executable_.
(Executables may also be called _external commands_ or _applications_.)
Executables are commonly invoked by typing only their name.
This can be done because a pre-defined variable makes known to Bash a list of common, executable, file paths.
This variable is called `PATH`.
It is a set of directory names separated by colons (e.g. `/usr/bin:/bin`). 
When a command is specified (e.g. `myprogram`, or `ls`) without a file path (and it isn't an alias, function, builtin or keyword), Bash searches through the directories in `PATH`.
The search over the directories is done in order, from left to right, to see whether they contain an executable with the given name.

If the executable is outside a known path... the executables file path will need to be defined. For an executable in the current directory, use `./myprogram`; if it's in the directory `/opt/somedirectory`, use `/opt/somedirectory/myprogram`.

Tip — The `type` command can be used to get a description of the command type:

```bash
$ type rm
rm is hashed (/bin/rm)
$ type cd
cd is a shell builtin
```

## Scripts

A _script_ is basically a sequence of commands in a file.
Bash reads the file and processes the commands in order.
It moves on to the next command only when the current one has ended.
(The exception being if a command has been specified to run asynchronously, in the background. Don't worry too much about this case yet — we'll learn about how that works later on.)

Virtually any example that exists on the command line in this guide can also be used in a script.

Making a script is easy.
Begin by making a new file, and put this on the first line:


```bash
#!/bin/bash
```

The header is called an _interpreter directive_ (it is also called a _hashbang_ or **_shebang_**).
It specifies that `/bin/bash` is to be used as the interpreter when the file is used as the executable in a command.
When the OS's kernel executes a _non-binary file_, it reads the first line of the file.
If the line begins with `#!`, the kernel uses the line to determine the interpreter to relay the file to.
(There are other valid ways to do this as well, see below.)
The `#!` must be at the very start of the file, with no spaces or blank lines before it.
Our script's commands will appear on separate lines below this.

Tip — Instead of `#!/bin/bash` , you could use

```bash
#!/usr/bin/env bash
```

`env` searches `$PATH` for the executable named by its first argument (in this case, "bash").
For a more detailed explanation of this technique and how it differs from plain ol' `#!/bin/bash`, see [this question in StackOverflow](https://stackoverflow.com/questions/16365130/what-is-the-difference-between-usr-bin-env-bash-and-usr-bin-bash/16365367#16365367).

Please do not be fooled by scripts or examples on the Internet that use `/bin/sh` as the interpreter.
**`sh` is not `bash`!**
Bash itself is a "sh-compatible" shell (meaning that it can run most 'sh' scripts and carries much of the same syntax) however, the opposite is not true; some features of Bash will break or cause unexpected behavior in `sh`.

<!--

Also, please refrain from giving scripts a .sh extension. 
It serves no purpose, and it's completely misleading (since it's going to be a bash script, not an sh script).

-->

~~~~exercism/caution
It is perfectly fine to use Windows to write scripts.
Avoid, however, using Notepad.
"Microsoft Notepad" can only make files with DOS-style line-endings.
DOS-style line-endings end with two characters: a Carriage Return (ASCII CR; 0xD) and a Line Feed (ASCII LF; 0xA) character.
Bash understands line-endings with only Line Feed characters.
As a result, the Carriage Return character will cause an unexpected surprise if one doesn't know it's there (very weird error messages).
If at all possible, use a more capable editor like Vim, Emacs, kate, GEdit... 
If one doesn't, the carriage returns will need to be removed from the scripts before running them.
~~~~

Once the script file has been created, it can be executed by doing:

```bash
$ bash myscript
```

In this example, we execute the _command_ `bash` and tell it to read the script that we gave as an _argument_.
When we do it like this, the `#!` line is just a _comment_, Bash does not do anything at all with it.

Alternatively, we can give our scripts executable permissions.
With this method, instead of calling Bash manually, we can execute the script as an application:

```bash
$ chmod +x myscript  # Mark the file as executable.
$ ./myscript         # Now, myscript can be executed directly instead of having to pass it to bash.
```

When we run the command this way, the operating system (OS) uses the `#!` line to determine what interpreter to use.


## Credit

The content of this lesson is taken from [Commands and Arguments] on the [Bash Guide].


[Bash Guide]: https://mywiki.wooledge.org/BashGuide
[Commands and Arguments]: https://mywiki.wooledge.org/BashGuide/CommandsAndArguments
[Quotes]: https://mywiki.wooledge.org/Quotes
[glob]: https://mywiki.wooledge.org/glob
