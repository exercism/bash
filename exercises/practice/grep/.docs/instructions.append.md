# Dummy header

## To `grep` or not to `grep`, that is the question

Although this exercise can be trivially solved by simply passing the
arguments to `grep`, implement this exercise using bash only.  The aim 
of this exercism track is to learn how to use bash builtin commands to solve
problems.

To solve this exercise, you'll need to:

* parse command line arguments: [`getopts`](https://stackoverflow.com/tags/getopts/info) is useful for this.
* iterate over the lines of a file: this is [bash FAQ #1](https://mywiki.wooledge.org/BashFAQ/001)
* use regular expression matching: bash can do this using the `=~` operator
  within [`[[ ... ]]`](https://www.gnu.org/software/bash/manual/bash.html#index-_005b_005b)

---
