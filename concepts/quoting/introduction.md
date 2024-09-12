# Introduction

One piece of advice new bash programmers will hear over and over:

> Quote your variables!

Why is that?

When you expand a variable (like `$name`) you almost always want to use the _value_ of the variable as a single string (or number).
You don't want the value to be unexpectedly handled as two or more separate strings.

## Quoting

Quoting is the primary mechanism to ensure that a piece of text is treated as a single word.
There are two main type of quotes.

### Double Quotes

Double quotes allow parameter expansion, arithmetic expansion and command substitution within them.

```bash
echo "This is bash version $BASH_VERSION"
```

You can include a literal double quote inside a double-quoted string by preceding it with a backslash.

```bash
echo "She said \"Let me teach you about bash.\""
```

### Single quotes

Single quotes _do not allow_ any expansions inside them.

```bash
echo 'This is bash version $BASH_VERSION'
# ...^..................................^
# prints exactly: This is bash version $BASH_VERSION
```

It is _not possible_ to embed a single quote inside a single-quoted string.

## Importance of quoting

What's wrong with `echo $name`, exactly?

When the shell parses a line of code, it performs [several kinds of expansions][expansions], in order.
Two of the last expansions are _Word Splitting_ and _Filename Expansion_.

### Word Splitting

Any results of parameter expansion, command substitution or arithmetic expansion _that did not occur within double quotes_ are eligible for "word splitting".
The shell takes the expanded result, and splits it on any sequence of characters present in the value of `$IFS`.
By default, this is space, tab and newline.

We can see this in action using a shell loop:

```bash
sentence="The quick brown fox jumps."
i=0
for word in "$sentence"; do echo "$((++i)) $word"; done
# ..........^.........^
```
outputs
```none
1 The quick brown fox jumps.
```

But unquoted:

```bash
i=0
for word in $sentence; do echo "$((++i)) $word"; done
# .........^.........^
```
outputs
```none
1 The
2 quick
3 brown
4 fox
5 jumps.
```

Let's see it with a different value of `$IFS`:

```bash
csv="first,second,third"
IFS=","
for word in $csv; do echo "$word"; done
```
outputs
```none
first
second
third
```

#### Disable Word Splitting

A techique to disable word splitting is to set `$IFS` to an empty string

```bash
sentence="The quick brown fox jumps."
IFS=    # or explicitly, IFS=""
i=0
for word in $sentence; do echo "$((++i)) $word"; done
# .........^.........^
```
outputs
```none
1 The quick brown fox jumps.
```

However, leaving variables unquoted is not recommended unless you also disable Filename Expansion.
We'll see how to do that below.

### Filename Expansion

"Glob" patterns are used to express a concise pattern to match a set of files.
For example, you might match all the Markdown files in a directory with `*.md`.
[Glob patterns][glob] have existed since the invention of Unix.

The glob wildcard characters are:

* `*` matches zero or more of any character,
* `?` matches exactly one of any character,
* `[...]` matches exactly one character from the set of characters listed inside the brackets.

   ~~~~exercism/advanced
   <details><summary>
   There are lots of details about character sets.
   Click here to show them.
   </summary>

    * `[abc]` matches exactly one character that is either an `a` or a `b` or a `c`.
        * to include a literal close bracket in the expression, make it the first character after the opening bracket (after an optional `^`)
            * `[][]` is a character set that will match either a close or an open bracket.
            * or escape it with a backslash: `[[\]]`
    * `[x-y]` matches exactly one character that is in the _range_ from `x` to `y`
        * to include a literal hyphen character in a character set, it must be either the first character after the opening bracket (after an optional `^`) or the last character before the closing bracket.
            * `[-xy]` or `[xy-]` each match exactly one character that is an `-` or a `x` or a `y`
            * or escape it with a backslash: `[x\-y]`
        * multiple ranges can be specified, for example `[0-9A-Fa-f]` matches a hexadecimal digit
    * `[^abc]` matches exactly one character that is **NOT** an `a` or a `b` or a `c`,
    * `[^x-y]` matches exactly one character that is **NOT** in the range from `x` to `y`
    * `[[:character_class:]]` matches one character that is in the named "character_class"
        * the available character classes are: 
            * `lower` -- lowercase letters
            * `upper` -- uppercase letters
            * `alpha` -- letters
            * `digit` -- digits
            * `alnum` -- letters and digits
            * `space` -- whitespace
            * `blank` -- horizontal whitespace (space and tab)
            * `xdigit` -- hexadecimal digits
            * `word` -- characters allowed in an identifier (letters, numbers, underscore)
            * `punct` -- punctuation
            * `cntrl` -- control characters
            * `graph` -- "visible" characters
            * `print` -- visible characters plus space
        * they can be combined:
            * the `[[:alpha:]]` class consists of `[[:lower:][:upper:]]`
            * the `[[:alnum:]]` class consists of `[[:alpha:][:digit:]]`
            * the `[[:word:]]` class consists of `[[:alnum:]_]`
            * underscore (octal 137) is both `[[:word:]]` and `[[:punct:]]`
            * the `[[:graph:]]` class consists of `[[:alnum:][:punct:]]`
            * the `[[:print:]]` class consists of `[[:graph:] ]` -- just space (octal 040) not any other whitespace.
   </details>   
   ~~~~

#### Iterating Over a List of Files

You can iterate over a list of files with a `for` loop

```bash
for file in *.csv; do
    do_something_with "$file"
done
```

Note that the variable `"$file"` is quoted.
The glob pattern can return files that contain spaces in the name.
We need to quote the variable so that the `do_something_with` command receives exactly one argument, the file name.

#### Glob Patterns Are Not Regular Expressions

Glob patterns **are not** regular expressions.

* match exactly one character
   * regex `.`
   * glob `?`
* match zero or more characters
   * regex `.*`
   * glob `*`
        * the glob pattern `.*` means "match a filename where the first character is a literal dot followed by zero or more of any characters".
* match one or more characters
   * regex `.+`
   * glob `?*`
* regex character sets and glob character sets act the same way.

~~~~exercism/advanced
Bash provides [extended patterns][extended-patterns] that are closer to regular expressions.

[extended-patterns]: https://www.gnu.org/software/bash/manual/bash.html#Pattern-Matching
~~~~

#### Quoting and Filename Expansion

There are times when you want to suppress filename expansion.
Handling user input is one such time.
Consider this code snippet

```bash
read -p "Enter something: " user_input
echo $user_input
```

If the user enters an asterisk (`*`), what will be output? 
The list of files in the current directory.
That's probably not what you want to do.

Another example is to pass patterns as arguments to programs that expect patterns.
The `tr` program is often used for text manipulation. To lowercase a variable value, you can do this

```bash
var="My Puppet"
echo "$var" | tr '[:upper:]' '[:lower:]'
```
outputs
```none
my puppet
```

A common mistake is to forget to quote `tr`'s arguments: `tr [:upper:] [:lower:]`

~~~~exercism/caution
Why is that a problem? 
Unquoted glob patterns will be expanded to the list of files that match.
Suppose the person using your script has a files named `p` and `u` and `w` in the current directory:

```bash
touch p u w
var="My Puppet"
echo "$var" | tr [:upper:] [:lower:]
```

This results in an error!

The unquoted `[:upper:]` pattern matches any of `:`, `u`, `p`, `e` or `r`.
The unquoted `[:lower:]` pattern matches any of `:`, `l`, `o`, `w`, `e` or `r`.
Bash matches the files `p` and `u` for the first pattern, and the file `w` for the second pattern, and `tr` is invoked like

```bash
echo "$var" | tr p u w
```

And that's the wrong number of arguments for `tr`.
~~~~

#### Disable Filename Expansion

You can use the [`set`][set] command to disable filename expansion.

```bash
echo *      # prints a list of files
set -f      # disable filename expansion
echo *      # prints a literal asterisk
set +f      # enable filename expansion
```

#### Controlling Filename Expansion

There are several settings for the builtin [`shopt`][shopt] command that control how filename expansion operates.
A couple of interesting ones are:

* `shopt -s nocaseglob` -- perform case insensitive matching
* `shopt -s extglob` -- enable extended patterns
* `shopt -s nullglob` -- if no files match, replace the pattern with nothing.
   The default behaviour is to leave the pattern in place as a literal string.


[expansions]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions 
[glob]: https://en.wikipedia.org/wiki/Glob_(programming)
[set]: https://www.gnu.org/software/bash/manual/bash.html#The-Set-Builtin
[shopt]: https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin
