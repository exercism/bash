# Looping

In a bash loop, we are looping over the indices of the characters.
Bash strings and arrays use zero-based indexing.

```bash
reversed=''
for ((i = 0; i < ${#string}; i++)); do
    reversed="${string:i:1}$reversed"
done
```

- We loop from zero up to (but not including) the string length (`${#string}`).
- Extracting the character at index `i` is done with the `${var:offset:length}` parameter expansion.
- We _prepend_ the character to the accumulating variable to reverse the string.

Finding the string length is a surprisingly expensive operation in bash (more details in the [Performance article][art-perf]).
We don't have to re-calculate it for every loop iteration, just do it once.

```bash
reversed=''
len=${#string}
for ((i = 0; i < len; i++)); do
    reversed="${string:i:1}$reversed"
done
```

An alternate way to calculate it just once is to loop backwards.

```bash
reversed=''
for ((i = ${#string} - 1; i >= 0; i--)); do
    reversed+="${string:i:1}"
done
```

- Here, we start the loop at one less than the string length, which is the index of the last character, and we loop down to (and including) zero.
- Since we're accessing the characters in the reverse order, we'll _append_ to the accumulating variable.

Another performance note: accessing each character with this parameter expansion is still slow: bash has to walk the string until reaching the desired index.
The most efficient solution is discussed in the [Performance article][art-perf]).

[art-perf]:  /tracks/bash/exercises/reverse-string/articles/performance
