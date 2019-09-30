Bash is usually found on any Linux, BSD, or Unix based systems.
In the graphical interface of your choice, look for an application named "Terminal".
Alternatively, Ctrl+Alt+F2 should take you to a shell login (Ctrl+Alt+F1 or F7 to return to Graphical mode).

To verify the version of Bash available, from the command line or terminal, run:

    echo $BASH_VERSION

If your shell is `bash` it should show something like:

    4.4.19(1)-release

You shouldn't need to do anything else, bash should be installed and in your path at this point, as it is your current shell.

If your shell isn't bash, there is no reason to change it.
You can write and run bash scripts without being in a bash shell.

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

This should output some terse information about the version of bash you are running.
If it does not, you may not have bash installed.
You should install it using your distributions package manager.

For Windows, you may need to install [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Alternatively, you can install [Cygwin](https://cygwin.com/).

For Apple OSX:
* open Finder,
* open your Applications folder,
* open the Utilities folder,
* finally open the `Terminal` application.

Note that the bash version installed on MacOS is very old, version 3.2. 
This is due to (i) newer bash versions being licensed under the GPLv3 and (ii) Apple not wanting to be forced to comply with the terms of that license.
Additionally, Apple has signaled that bash will be going away from MacOS: the default login shell was recently [changed from bash to zsh](https://support.apple.com/en-us/HT208050).

To obtain an up-to-date bash on your Mac:

1. install [Homebrew](https://brew.sh)
1. open a Terminal and enter: `brew install bash`

This installs an up-to-date bash as (I believe) `/usr/local/bin/bash` (so that the system's default bash is not overwritten -- other tools may rely on /bin/bash). 

If you want homebrew bash to be your default bash:

1. add to your ~/.bash_profile (or ~/.profile) file:

        [[ ":$PATH:" == *":/usr/local/bin:"* ]] || PATH=/usr/local/bin:$PATH

1. add it to the list of allowed login shells:

        echo /usr/local/bin/bash | sudo tee -a /etc/shells

1. change your login shell:

        chsh -s /usr/local/bin/bash
