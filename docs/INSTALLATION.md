Bash is usually found on any Linux, BSD, or Unix based systems. In the
graphical interface of your choice, look for an application named
"Terminal". Alternatively, Ctrl+Alt+F2 should take you to a shell login
(Ctrl+Alt+F1 or F7 to return to Graphical mode).

To verify the version of Bash available, from the command line or
terminal, run:

    echo $BASH_VERSION

If your shell is `bash` it should show something like:

    4.4.19(1)-release

You shouldn't need to do anything else, bash should be installed and in
your path at this point, as it is your current shell.

If your shell isn't bash, there is no reason to change it. You can
write and run bash scripts without being in a bash shell.

To verify the version of bash installed, run:


```plain
bash --version
```

It will show something like this:

```
GNU bash, version 4.4.19(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

This should output some terse information about the version of bash you
are running.  If it does not, you may not have bash installed. You
should install it using your distributions package manager.

For Windows based Operating Systems, you may need to first install
[Cygwin](https://cygwin.com/).

For Apple OSX:
* open Finder,
* open your Applications folder,
* open the Utilities folder,
* finally open the `Terminal` application.
