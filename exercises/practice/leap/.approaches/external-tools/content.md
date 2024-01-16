# External Tools

Calling external tools is a natural way to solve problems in bash: call out to a specialized tool, capture the output, and process it.

Using GNU `date` to find the date of the day after February 28:

```bash
year=$1
next_day=$(date -d "$year-02-28 + 1 day" '+%d')
if [[ $next_day == "29" ]]; then
    echo true
else
    echo false
fi
```

Or, more concise but less readable:

```bash
[[ $(date -d "$1-02-28 + 1 day" '+%d') == "29" ]] \
    && echo true \
    || echo false
```

Working with external tools like this is what shells were built to do.

From a performance perspective, it takes more work (than builtin addition) to:

* copy the environment and spawn a child process
* connect the standard I/O channels
* wait for the process to complete and capture the exit status.

Particularly inside of a loop, be careful about invoking external tools as the cost can add up.
Over-reliance on external tools can take a job from completing in seconds to completing in minutes (or worse).

~~~~exercism/caution
Take care about using parts of dates in shell arithmetic.
For example, we can get the day of the month:

```bash
day=$(date -d "$some_date" '+%d')
next_day=$((day + 1))
```

That looks innocent, but if `$some_date` is `2024-02-08`, then:

```bash
$ some_date='2024-02-08'
$ day=$(date -d "$some_date" '+%d')
$ next_day=$((day + 1))
bash: 08: value too great for base (error token is "08")
```

Bash treats numbers starting with zero as octal, and `8` is not a valid octal digit.

Workarounds include using `%_d` or `%-d` to avoid the leading zero, or specify base-10 in the arithmetic (the `$` is required in this case).

```bash
next_day=$(( 10#$day + 1 ))
```
~~~~
