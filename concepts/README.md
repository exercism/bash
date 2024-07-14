# Bash concepts

The [plan](http://forum.exercism.org/t/bash-syllabus-planning/11952)

1. Basic syntax: commands and arguments

    - a cautionary note: this syllabus will be about _programming_ in bash, not about _using it as an interactive shell_.
    - separated by whitespace
    - commands can be external, builtin, keywords, functions, aliases
    - arguments can contain whitespace if quoted
    - a cautionary note: `[` is a builtin command, so needs space before its arguments
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

3. word splitting and filename expansion

    - to discuss the importance of quoting
    - basic shell patterns: `*`, `?`, `[...]`
    - brace expansions and how it's different from patterns `/path/to/{foo,bar,baz}.txt`
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

6. conditionals 2
    - boolean operators `&&` `||`
    - how `A && B || C` != `if A; then B; else C; fi`
      
7. arrays
    - numeric and associative
    - iteration
    - namerefs

8. functions

9. pipelines and subshells

...

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
