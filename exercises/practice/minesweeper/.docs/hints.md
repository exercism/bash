# Hints for Bash Minesweeper Exercise

This exercise seems to require a two-dimensional array.
Bash only offers one-dimensional indexed or associative [arrays][array].

Multi-dimensional arrays can be simulated by using an associative arrays: encode the indices into a comma-separated string to use as the array key.

```bash
# store this matrix:
#   a b
#   c d
declare -A array2d
array2d["0,0"]="a"
array2d["0,1"]="b"
array2d["1,0"]="c"
array2d["1,1"]="d"
```

[array]: https://www.gnu.org/software/bash/manual/bash.html#Arrays
