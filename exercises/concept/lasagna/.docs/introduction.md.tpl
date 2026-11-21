# Introduction

%{concept:variables}

## Arithmetic with `expr`

Bash has its own way to do arithmetic, which you will learn about later.
For now, you can use the external `expr` command.
It takes the numbers and the operator as separate arguments, so each must be a separate word, and it prints the result:

```bash
expr 7 - 2
# => 5
```

Combine it with command substitution to store the result in a variable.
Remember that quoting your variable expansions keeps each value as a single argument:

```bash
total=$(expr "$a" + "$b")
```

Some operators have a special meaning to Bash.
For example, an unquoted `*` is a filename pattern, which Bash replaces with the names of the files in the current directory.
Quote such an operator so that `expr` receives it as an argument:

```bash
product=$(expr "$a" '*' "$b")
```
