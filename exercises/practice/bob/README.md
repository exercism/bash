# Bob

Bob is a lackadaisical teenager. In conversation, his responses are very limited.

Bob answers 'Sure.' if you ask him a question, such as "How are you?".

He answers 'Whoa, chill out!' if you YELL AT HIM (in all capitals).

He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

He says 'Fine. Be that way!' if you address him without actually saying
anything.

He answers 'Whatever.' to anything else.

Bob's conversational partner is a purist when it comes to written communication and always follows normal rules regarding sentence punctuation in English.


Run the tests with:

```bash
bats bob_test.sh
```

After the first test(s) pass, continue by commenting out or removing the
`[[ $BATS_RUN_SKIPPED == true ]] || skip` 
annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, run:

```bash
BATS_RUN_SKIPPED=true bats bob_test.sh
```

## Source

Inspired by the 'Deaf Grandma' exercise in Chris Pine's Learn to Program tutorial. [http://pine.fm/LearnToProgram/?Chapter=06](http://pine.fm/LearnToProgram/?Chapter=06)


## External utilities
`Bash` is a language to write "scripts" -- programs that can call
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

For an extra challenge, if you would like to have a better understanding
of the language, try to re-implement the solution in pure `Bash`,
without using any external tools. Note that there are some types of
problems that bash cannot solve, such as performing floating point
arithmetic and manipulating dates: for those, you must call out to an
external tool.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others
have completed the exercise.
