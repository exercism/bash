# Help

Check your code for syntax errors: paste your code into
[https://shellcheck.net](https://shellcheck.net) (or [install it](https://github.com/koalaman/shellcheck#user-content-installing) on your machine).

Stack Overflow will be your first stop for bash questions.

* start with the [`bash` tag](https://stackoverflow.com/questions/tagged/bash) to search for your specific question: it's probably already been asked
* under the bash tag on Stackoverflow, the [Learn more...](https://stackoverflow.com/tags/bash/info) link has _tons_ of good information.
    * the "Books and Resources" section is particularly useful.
* the [`bash` tag](https://unix.stackexchange.com/questions/tagged/bash) on Unix & Linux is also active

## External utilities

`bash` is a language to write "scripts" -- programs that can call
external tools, such as
[`sed`](https://www.gnu.org/software/sed/),
[`awk`](https://www.gnu.org/software/gawk/),
[`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html)
and even programs written in other programming languages, 
like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long
as your solution is portable between systems and does not require
installation of third party applications, feel free to use them to solve
the exercise.

For an extra challenge, if you would like to have a better understanding of
the language, try to re-implement the solution in pure bash, without using
any external tools. There are some types of problems that bash cannot solve,
such as floating point arithmetic and manipulating dates: for those, you
must call out to an external tool.
