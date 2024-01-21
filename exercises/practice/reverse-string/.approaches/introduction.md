# Introduction

To reverse a string in bash, there are two basic approaches.

## Approach: External tools

The most straightforward approach is to call out the `rev` utility.

```bash
reversed=$( echo "$string" | rev )
# or
reversed=$( rev <<< "$string" )
```

For more details, see the [External tools approach][app-external].

## Approach: Loop over the string indices

To reverse a string with just bash, loop over the indices, extract the character at that index, and add it to the accumulating result string.

```bash
# forwards
reversed=''
for ((i = 0; i < ${#string}; i++)); do
    reversed="${string:i:1}$reversed"
done

# or backwards
reversed=''
for ((i = ${#string} - 1; i >= 0; i--)); do
    reversed+="${string:i:1}"
done
```

For more details, go to the [Looping approach][app-loop].

## Which approach to use?

Calling out to `rev` makes this exercise extremely trivial.
In a work environment, it's exactly the approach to take.

If you're interested in learning about bash loops and parameter expansion, experimenting with the loop approach is more interesting.

Thinking about performance generally isn't something you would care that much about with a shell script.
However, working with strings can be surprisingly expensive in bash.
The [Performance article][art-perf] takes a deeper dive.

[app-external]: /tracks/bash/exercises/reverse-string/approaches/external-tools
[app-loop]: /tracks/bash/exercises/reverse-string/approaches/loops
[art-perf]:  /tracks/bash/exercises/reverse-string/articles/performance
