# Dummy header

## Library of Functions

This is the first exercise we've seen where the solution we're writing
is not a "main" script. We're writing a library to be "source"d into
other scripts that will invoke our functions.

### Bash namerefs

This exercise requires the use of `nameref` variables. This requires a bash
version of at least 4.0. If you're using the default bash on MacOS, you'll
need to install another version: see [Installing Bash](https://exercism.io/tracks/bash/installation)

Namerefs are a way to pass a variable to a function _by reference_. That
way, the variable can be modified in the function and the updated value is
available in the calling scope. Here's an example:
```bash
prependElements() {
    local -n __array=$1
    shift
    __array=( "$@" "${__array[@]}" )
}

my_array=( a b c )
echo "before: ${my_array[*]}"    # => before: a b c

prependElements my_array d e f
echo "after: ${my_array[*]}"     # => after: d e f a b c
```
