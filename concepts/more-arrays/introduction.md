# More about Arrays

We were introduced to arrays in the [Arrays][arrays] chapter.
This document will show more ways to use arrays.

## Concatenating the Elements of an Array into a Single String

In the previous Arrays chapter, you saw `"${myarray[@]}"`, with the `@` index, to expand the array into the individual elements.
But sometimes you want to join all the elements into a single string.
For this, use the `*` index:

```bash
echo "${myarray[*]}"
```

You are required to enclose the expansion in double quotes.

Bash uses the _first character_ of the `IFS` builtin variable as the separator character.
By default, `$IFS` consists of space, tab and newline.

```bash
myarray=(one two three four)
mystring="${myarray[*]}"
declare -p mystring
# => declare -- mystring="one two three four"
```

We can manipulate the `IFS` variable to use a different separator character:

```bash
myarray=(one two three four)
IFS=","
mystring="${myarray[*]}"
declare -p mystring
# => declare -- mystring="one,two,three,four"
```

~~~~exercism/advanced
We can encapsulate this into a function.

```bash
join() {
    local IFS=$1
    shift
    local elements=("$@")
    echo "${elements[*]}"
}

join ":" "${myarray[@]}"     # note, the "@" index
# => "one:two:three:four"
```

Localizing `IFS` in the function means we don't have to save the old value and restore it back to it's previous value in the global scope.

As a refinement, the special parameter `"$*"`, when quoted, has the same functionality so we don't need to save a copy of the function's arguments:

```bash
join() {
    local IFS=$1
    shift
    echo "$*"
}
```
~~~~

## Array Slices

You may have seen the `"${variable:offset:length}"` [parameter expansion][parameter-expansion] that expands into a _substring_ of the variable's value.
We can do the same thing with arrays to expand a slice of the array.

```bash
myarray=(one two three four)

subarray=("${myarray[@]:0:2}")
declare -p subarray         # => subarray=([0]="one" [1]="two")

subarray=("${myarray[@]:1:3}")
declare -p subarray         # => subarray=([0]="two" [1]="three" [2]="four")
```

Omitting the length part means "from the offset to the end of the array":

```bash
subarray=("${myarray[@]:2}")
declare -p subarray         # => subarray=([0]="three" [1]="four")
```

## Passing an Array to a Function

This is not as straightforward as other languages you might be know.
There are 3 techniques to pass an array to a function, and only one of them allows you to "mutate" the array that was passed.

### Pass the Elements

In the first technique, you just pass the array's values and collect them into a local array in the function.

```bash
myfunc() {
    local array_copy=("$@")
    # do stuff with array_copy
    declare -p array_copy
}

array_original=(11 22 33 44)
myfunc "${array_original[@]}"
```

The function's array holds a copy of the values.
Any changes made to the array in the function are not reflected in the outer scope.

### Pass the Array Name

For these two techniques, you pass the array _name_ as a string.

#### 1. Using Indirect Expansion

Suppose you have variable `x=5` and variable `y=x`, and you want to use the `y` variable to get the value `5`.
Some other languages let you do `$$y` but not Bash.
Bash has a technique called **indirect expansion** (described in the manual in [Shell Parameter Expansion][parameter-expansion]).
In bash, this uses the `!` character in a different way than we have seen before:

```bash
x=5
y=x
echo "the value is ${!y}"
```

We will use this technique to pass the array _name_ to the function, and indirectly access the values to make a copy them

```bash
myfunc() {
    local array_name=$1
    local temp="${array_name}[@]"
    local array_copy=("${!temp}")
    # do stuff with array_copy
    declare -p array_copy
}

array_original=(11 22 33 44)
myfunc "array_original"
```

This technique is quite messy.
The `temp` variable will contain the _string_ `"array_original[@]"`.
Then the indirect expansion expands to the global array's values.

The function's array holds a copy of the values.
Any changes made to the array in the function are not reflected in the outer scope.

#### 2. Using a "nameref" Variable

This technique is more like the "pass by reference" capability you might be used to.
We will pass the array name to the function.
The function will create a local variable with the "nameref" attribute.
This local array and the global array (whose name we passed in) are _the same array_.

```bash
myfunc() {
    local -n local_array=$1
    # do stuff with local_array
    # we can mutate it
    local_array+=(55 66 77)
}

array_original=(11 22 33 44)
myfunc "array_original"

# show the mutated array
declare -p array_original
# => declare -a array_original=([0]="11" [1]="22" [2]="33" [3]="44" [4]="55" [5]="66" [6]="77")
```

Namerefs also work with associative arrays, and "scalar" variables (that contain a string value).

~~~~exercism/note
Inside the function, `declare -p local_array` is not extremely helpful.
It will just emit `declare -n local_array="array_original"`.
You can get the detailed information about the array by inspecting the passed-in array name: `declare -p "$1"`
~~~~

~~~~exercism/caution
Take care that the local array has a different name than the passed-in array.
The code will still work, but it will emit "circular name reference" warnings like this:

```bash
myfunc() {
    local -n a=$1
    local IFS=,
    echo "${a[*]}"
}

# same name as the function's local variable
a=(one two three)
myfunc a
```

```none
bash: local: warning: a: circular name reference
bash: warning: a: circular name reference
bash: warning: a: circular name reference
bash: warning: a: circular name reference
one,two,three
```
~~~~

## The Positional Parameters are "Array-like"

In shells that aim to conform to the POSIX standard only (such as `ash` and `dash`), there are no arrays.
The closest you can get is to use the positional parameters.

* The positional parameters are accessed by index: `$1`, `$2`, etc.
* They are expanded into individual elements with `"$@"`
* They are concatenated into a single string with `"$*"`
* The number of parameters is `$#`

Use the `set` command to assign values to them:

```sh
set -- one two three
set -- "$@" four

for item in "$@"; do
    echo "do something with $item"
done
```

If your goal is to write "portable" shell scripts, you'll use the positional parameters to store a "list" of values.

[arrays]: https://exercism.org/tracks/bash/concepts/arrays
[parameter-expansion]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
