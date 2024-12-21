# Bash concepts

The [plan](http://forum.exercism.org/t/bash-syllabus-planning/11952)

1. Basic syntax: commands and arguments

    - separated by whitespace
    - commands can be external, builtin, keywords, functions, aliases
    - arguments can contain whitespace if quoted
    - a cautionary note: `[` is a command, and it needs space before its arguments
        - "We will see much more about `[` in later lessons."
    - scripts, shebang, no aliases
    - positional parameters

2. variables and expansions

    - variable assignment
        - no spaces around `=`
    - command substitution to capture command output
    - parameter expansions
        - don't need to go into exhausive list, but the essentials
        - default value `${var:-default}`
        - pattern replacement `${var//pattern/replacement}`
        - "trimming"    `${var%.*}` `${var##*/}`
    - `$@` and `$*`

3. quoting

    - to discuss the importance of quoting
    - types of quoting
    - word splitting and filename expansion
    - basic shell patterns: `*`, `?`, `[...]`
    - `set -f`

4. conditionals

    - truthiness
    - `[` versus `test` versus `[[`
    - if COND_COMMANDS; then COMMANDS; elif COND_COMMANDS; then COMMANDS; else COMMANDS; fi
        - how `COND_COMMANDS` doesn't need `[` at all
    - case

5. loops
    - while, until
    - for elem in elements ...
    - arithmetic for

6. command lists and pipelines
    - boolean operators `&&` `||`
    - how `A && B || C` != `if A; then B; else C; fi`
      
7. arrays
    - numeric and associative
    - iteration
    - namerefs

8. functions


...

- brace expansions and how it's different from patterns `/path/to/{foo,bar,baz}.txt`

x. I/O
   - file descriptors, stdin, stdout, stderr
   - redirection
   - here-docs and here-strings
   - `exec` and redirections
   - command substitution
        - capturing stdout and stderr
        - capturing stdout and stderr **into separate variables**

x. arithmetic

x. variables 2

   - scope
   - attributes: `-i` `-l` `-u`

x. option parsing with getopts

x. `set` command and "strict mode"

   - pros and cons of
        - `set -e`
        - `set -u`
   - `$-` variable
   - `-opt` versus `+opt`
   - debugging with `-x` and `-v`
   - shellcheck
