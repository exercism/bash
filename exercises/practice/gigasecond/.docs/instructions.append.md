# placeholder

## How to solve with bash

`bash` does not have any builtin ways to **parse** datetime strings.
This exercise requires you to call out to an external utility.

* The GNU `date` command's `-d` option can parse [a wide variety of formats][gnu-date].
* For Mac users, see the [BSD `date` command][bsd-date] and its `-f` option.
* Perl is widely available, and its [`Time::Piece` module][time-piece] is can be used to parse timestamps.

bash can **format** dates though.
Given an integer time value (an epoch time value), [the `printf` `%()T` formatter][bash-printf] can be given a "strftime"-style format string.
An example:

```bash
epoch=1234567890

printf '%(%Y-%m-%d %H:%M:%S)T\n' "$epoch"
# ==> 2009-02-13 18:31:30

# Even in different timezones

TZ=Asia/Kolkata printf '%(%Y-%m-%d %H:%M:%S)T\n' "$epoch"
# ==> 2009-02-14 05:01:30
```

[gnu-date]: https://www.gnu.org/software/coreutils/manual/html_node/Date-input-formats.html#Date-input-formats
[bsd-date]: https://manpage.me/index.cgi?apropos=0&q=date&sektion=0&manpath=FreeBSD+12-CURRENT+and+Ports&arch=default&format=html
[time-piece]: https://perldoc.pl/Time::Piece
[bash-printf]: https://www.gnu.org/software/bash/manual/bash.html#index-printf
