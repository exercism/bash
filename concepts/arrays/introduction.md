# Arrays

Bash provides two types of parameters: "scalar" values and arrays.
A scalar value can be a string or a number; it represents a single "thing".

Most of the time, scalar values are sufficient to contain your data.
But sometimes, you need to store a list of scalar values.
In this case you will use an _array_.

There are two kinds of arrays:

* Numerically-indexed arrays map an integer key to a string value.
  (Other languages might call this a "list" or a "sequence".)
* Associative arrays map a string key to a string value.
  (Other languages might call this a "map" or a "dictionary".)

The first few sections of this document will cover numerically-indexed arrays (hereafter simply known as "arrays").
Details about associative arrays will show up at the end.

~~~~exercism/caution
Bash arrays can _only_ store scalar values.
There is no ability to create a two-dimensional array (array of arrays).
~~~~

## Declaring and Initializing an Array Variable

You can initialize an array by assigning a parenthesized list of elements (possibly empty) to an variable.

```bash
myarray=("one" "two" "three")
```

As is the case with every variable assignment, there must be no spaces around the equal sign.

Note that there are no comma separators between the elements; it is a whitespace-separated list of strings.

In fact, the amount of whitespace inside the parentheses is completely arbitrary.
Newlines are allowed; use as many as you want to improve readability.

```bash
myarray=(
    "first element"
    "second element"
    "this is the last element"
)
```

Assigning a list of strings to an array variable in this manner will store the first string at index zero, the next string at index one, the next at index two, and so on.

It is possible to initialize a "sparse array" by specifying the indices you need.

```bash
raindrops=([3]="Pling" [5]="Plang [7]="Plong")
```

~~~~exercism/note
To reiterate: array indices are zero-based.
This snippet outputs "true":

```bash
myarray=("one" "two" "three")
[[ "${myarray[0]}" == "one" ]] && echo true || echo false
```
~~~~

You can use the `declare` (or `local` inside a function) command to specify that a variable will hold an array.

```bash
declare -a myarray
```

It is more idiomatic to just assign a (perhaps empty) parenthesized list to initialize the variable.

## Accessing Elements of an Array

As you saw in the note above, the syntax to access an array element is `${myarray[$index]}`.
The index is given in square brackets.
The curly braces are required.

~~~~exercism/note
For numerically-indexed arrays, the index is an arithmetic expression.
The Bash manual [states][arithmetic]:

> Within an arithmetic expression, shell variables may also be referenced by name without using the parameter expansion syntax.

This means that the `$` is not required for "simple" variable expansion.
You can access elements like this, which is a bit easier to read:

```bash
i=5
echo "${myarray[i]}"
# ..............^
```

[arithmetic]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
~~~~

If the given index does not exist in the array, the result of the expansion is an empty string.

## Assigning to an Array

To assign to a particular array entry, use this syntax:

```bash
myarray[10]="hello"
```

To _append_ to an array, use the `+=` concatenating-assigment operator, and use parentheses:

```bash
myarray+=("new element 1" "new element 2")
```

## Iterating over an Array

You will typically need to iterate over the _values_ of an array.
Use a for loop (that you saw in the [Looping][looping] concept):

```bash
myarray=("one" "two" "three")
for value in "${myarray[@]}"; do
    echo "$value"
done
```

Note the special syntax to expand the array: `"${myarray[@]}"`
This form of parameter expansion substitutes the array values as separate words.
It is somewhat equivalent to:

```bash
for value in "${myarray[0]}" "${myarray[1]}" ... "${myarray[n]}"
```

The `"${myarray[@]}"` form works with sparse arrays, expanding to only defined values.

This special expansion, where the index is an ampersand (`@`), is only special within double quotes.

#### Other Special Parameter Exapansions

Here are another couple of bits of special syntax that we need for iterating over an array.
These are described in the manual in [Shell Parameter Expansion][man-expn].

To find the _length_ of an array, use `${#myarray[@]}`, with a `#` before the name.
The "length" of an array means the number of elements in it.

To extract the list of _indices_ of an array, use `"${!myarray[@]}"`, with a `!` before the name and the expansion in double quotes.
For numerically-indexed arrays, the indices are expanded in numerical order.

### Iterating over Array Indices

Sometimes you need the index as well as the value.
There are a couple of ways to do this.

1. When you know the indices form an uninterrupted sequence, you can use an _arithmetic_ for loop.

   ```bash
   for ((i = 0; i < ${#myarray[@]}; i++)); do
       echo "$i -> ${myarray[i]}"
   done
   ```

   Note the `${#myarray[@]}` syntax, with the `#` character in front of the array name.
   Since arrays use zero-based indexing, the array's last index is one less than the array length.

2. When the array is sparse, you can use this form:

   ```bash
   for index in "${!raindrops[@]}"; do
       echo "$index -> ${raindrops[index]}"
   done
   ```

   Note the `${!myarray[@]}` syntax, with the `!` character in front of the array name.

## Inspecting an Array

If you want to look at the contents of an array, use the `declare` command with the `-p` option:

```bash
a=("the 'first' element"
   second
   third
   'the "last" element')
declare -p a
```

This outputs the contents with canonical shell quoting.

```bash
declare -a a=([0]="the 'first' element" [1]="second" [2]="third" [3]="the \"last\" element")
```

## Associative Arrays

To reiterate, associative arrays use strings for indices, not numbers.
Everything written above applies for associative arrays, but with small differences.
Generally, we use the term "key" not "index": associative arrays map keys to values.

### Declaring an Associative Array

Unlike arrays, associative arrays **must** be declared.
Use the `-A` option to `declare` (or `local` in a function):

```bash
declare -A mymap

myfunc() {
    local -A my_local_map
    # ...
}
```

### Initializing an Associative Array

The key-value pairs are specified within the parenthesized list:

```bash
mymap=([first]=foo [second]=bar [third]=baz)
declare -p mymap
```

This outputs:

```
declare -A mymap=([second]="bar" [first]="foo" [third]="baz")
```

~~~~exercism/note
Be aware that associative arrays are **unordered**.
~~~~

The declaration and initialization can happen in one line.

```bash
declare -A mymap=([first]=foo [second]=bar [third]=baz)
```

In recent Bash versions, the initialization can use a `(key value key value ...)` list.

```bash
declare -A mymap=(first foo second bar third baz)
```

### Accessing Values

The same syntax as before: `${mymap[$key]}`.

Associative array keys are not evaluated in an arithmetic context.
The usual parameter expansion syntax is required.

### Assigning to an Associative Array

The same syntax as before:

```bash
mymap[$key]="$value"
```

### Iterating

You can use a `for value in "${mymap[@]}"` loop.
However, you typically also want the key to go along with the value.

Use the `"${!mymap[@]}"` syntax we saw above.

```bash
for key in "${!mymap[@]}"; do
    echo "$key -> ${mymap[$key]}"
done
```

This outputs

```
second -> bar
first -> foo
third -> baz
```

To re-emphasize, there is no order to the keys.

[looping]: https://exercism.org/tracks/bash/concepts/looping
[man-expn]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
