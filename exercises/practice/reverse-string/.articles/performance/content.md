# Performance

We usually don't care that much about performance with shell scripts.
When we know something is slow, we can avoid it.
This matters much more when the operation is done inside loop.

## String length is slow

Obtaining the length of a string is a surprisingly expensive operation in bash.
With large strings and/or large loops, performance can be significantly impacted.
Storing the length in a variable helps significantly.

Demonstrating an empty loop, iterating over the string indices.

```bash
$ printf -v string "%32767s" foo
$ time for ((i = 0; i < ${#string}; i++)); do true; done

real    0m1.448s
user    0m1.443s
sys     0m0.005s

$ len=${#string}
$ time for ((i = 0; i < len; i++)); do :; done

real    0m0.159s
user    0m0.159s
sys     0m0.000s
```

If we can loop backwards, we don't even need to save the length to a variable.
We get a tiny improvement since bash does not need to access the variable contents for each iteration.

```bash
$ time for ((i = ${#string} - 1; i >= 0; i--)); do true; done

real    0m0.151s
user    0m0.151s
sys     0m0.000s
```

## Substrings can be slow

Whether we go backwards or forwards, we still have to extract the character at the given index.
Re-using our 32,767 character string:

```bash
$ time for ((i = 0; i < len; i++)); do
    char="${string:i:1}"
  done

real    0m9.188s
user    0m9.188s
sys     0m0.000s
```

That's 9 seconds just to read each character.
What if we can iterate over the characters directly?
We can, with a while-read loop.

## While-Read loops

We'll _redirect_ the string into loop so `read` can extract one character at a time.

```bash
$ time while IFS= read -d "" -r -n 1 char; do
    true
  done < <(printf "%s" "$string")

real    0m0.336s
user    0m0.276s
sys     0m0.060s
```

There's a 27x improvement.

What are we doing there?

- `< <(printf "%s" "%string)` is redirecting (`<`) a [process substitution][process-subst] (`<(...)`).
    We could use a [here-string][here-string] (`<<< "$string"`), but that appends a newline.
    Using `printf` outputs the string without adding a trailing newline.
- `IFS= read -d "" -r -n 1 char`: There's a lot going on there with this [`read` command][read].
    - `IFS=`: Normally, `read` will trim leading and trailing whitespace.
        More exactly, characters in `$IFS` are removed from the start and end of the text that `read` captures.
        By default, IFS contains space, tab and newline.
        Our goal is to read each character of the string, including whitespace.
        The empty assignment assigns the empty string to IFS _only for the duration of the `read` command_ so that whitespace characters are not treated specially.
    - `-d ""`: Normally, `read` will read up to a newline and stop there.
        We typically use a while-read loop to read lines from a file.
        But here, we want every character in the string including newlines.
        Bash uses null terminated strings under the hood, so a bash string cannot contain a null character.
        `-d ""` sets the line-ending delimiter to the null character.
    - `-r`: Backslashes are handled specially by `read`.
        We want to handle backslashes just like a normal character.
    - `-n 1`: This limits `read` to take just one character from the input.

Bash is strongly optimized for reading from and writing to IO streams.
Although this while-read loop is ugly, it's the fastest way for bash to process text one character at a time.

[process-subst]: https://www.gnu.org/software/bash/manual/bash.html#Process-Substitution
[here-string]: https://www.gnu.org/software/bash/manual/bash.html#Here-Strings
[read]: https://www.gnu.org/software/bash/manual/bash.html#index-read
