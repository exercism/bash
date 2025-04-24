# Bash concepts

The [plan](http://forum.exercism.org/t/bash-syllabus-planning/11952)

The suggested concept flow:

[![bash syllabus concept flowchart](https://glennj.github.io/img/bash.syllabus.flow.png)](http://forum.exercism.org/t/bash-syllabus-flow/15038)

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

6. pipelines and command lists
    - boolean operators `&&` `||`
    - how `A && B || C` != `if A; then B; else C; fi`

7. functions

8. arrays
    - numeric and associative
    - iteration

9. arithmetic

10. more about arrays

    - concatenate to a string with `"${ary[*]}"`
        - IFS
    - how positional parameters are "array-like"
    - passing an array to a function
        - by value
            ```bash
            myfunc() {
                local copy=("$@")
                ...
            }
            myfunc "${ary[@]}"
            ```
        - indirect variable syntax
            ```bash
            myfunc() {
                local varname=$1
                local tmp="${1}[@]"
                local copy=( "${!tmp}" )
                ...
            }
            myfunc "ary"
            ```
        - namerefs
            ```bash
            myfunc() {
                local -n ref=$1
                ...
            }
            myfunc "ary"
            ```
    - sublist syntax `${ary[@]:offset:length}`

11. Redirection
   - file descriptors, stdin, stdout, stderr
   - redirection

12. Here Documents
   - here-docs and here-strings

## More Concepts

x. I/O
   - command substitution
        - capturing stdout and stderr
        - capturing stdout and stderr **into separate variables**
   - `exec` and redirections
   - process substitutions

- brace expansions and how it's different from patterns `/path/to/{foo,bar,baz}.txt`

x. option parsing with getopts

x. `set` command and "strict mode"

   - pros and cons of
        - `set -e`
        - `set -u`
   - `$-` variable
   - `-opt` versus `+opt`
   - debugging with `-x` and `-v`
   - shellcheck

   - https://mywiki.wooledge.org/BashFAQ/105
   - http://redsymbol.net/articles/unofficial-bash-strict-mode/
   - https://www.shellcheck.net
      - https://www.shellcheck.net/wiki/
