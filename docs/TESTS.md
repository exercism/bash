# Tests

You can use the online editor on the Exercism website to solve the exercises.
Or, download the exercises to your computer, solve them locally and then submit them to Exercism.
The rest of this document talks about working locally.

## Exercism CLI

You will need the `exercism` command-line tool to download and submit exercises.
See [the exercism cli documentation][exercism-cli].

### Wrapper function for the exercism tool

One annoying aspect of the default exercism tool is that, after you download an exercise, you have to change directory manually.
This wrapper function handles that for you; store this in your `~/.bashrc`.
```bash
exercism () {
    local out
    readarray -t out < <(command exercism "$@")
    printf '%s\n' "${out[@]}"
    if [[ $1 == "download" && -d "${out[-1]}" ]]; then
        cd "${out[-1]}" || return 1
    fi
}
```
Note that cannot be a shell _script_, it must be a shell _function_.
Shell scripts are executed in a child process and cannot effect the environment (like the current working directory) of your current shell.

## Testing locally

For testing on the bash track, we are using [bats][bats].

Run the tests for the hypothetical "whatever" exercise like this:
```bash
cd /path/to/your/exercise_workspace/bash/whatever
bats whatever.bats
```

## Installing `bats-core`

You should be able to install it from your favorite package manager:

### For Mac (brew)

On macOS with [Homebrew][homebrew] this would look something like this:
```
$ brew install bats-core
==> Downloading https://github.com/bats-core/bats-core/archive/v1.1.0.tar.gz
==> Downloading from https://codeload.github.com/bats-core/bats-core/tar.gz/v1.1.0
######################################################################## 100.0%
==> ./install.sh /usr/local/Cellar/bats-core/1.1.0
🍺  /usr/local/Cellar/bats-core/1.1.0: 13 files, 55KB, built in 4 seconds
```

* The legacy `bats` package also exists in the homebrew ecosystem.
    **_Do not install that by mistake_**: <u>install `bats-core`</u>.

### For Linux

#### Fedora 30 and newer

`bats` is packaged for Fedora 30 and newer, you can install it with

```bash
sudo dnf install bats
```

#### Other Linux

For other Linux distributions the implementation of `bats` we use may not be conveniently packaged.
The best way to install it is from source.
If you want to install it under `/usr/local` then
```bash
git clone https://github.com/bats-core/bats-core
cd bats-core/
sudo ./install.sh /usr/local
```
Following that, assuming `/usr/local/bin` is in your $PATH, you can now do:
```
$ bats
Error: Must specify at least one <test>
Usage: bats [-cr] [-f <regex>] [-j <jobs>] [-p | -t] <test>...
       bats [-h | -v]
...
```

### For Windows (MINGW64/Cygwin)

```
$ git clone https://github.com/bats-core/bats-core.git
$ cd bats
$ ./install.sh $HOME
```
Note: When you are using the outdated `https://github.com/sstephenson/bats.git` and you discover an error like `cp: cannot create symbolic link '${HOME}/bin/bats': No such file or directory`, you have to copy the `bin/bats/libexec/` folder content to `${HOME}/bin/` manually.

There are reports that [newer bats versions don't behave well on MinGW bash][mingw-issues] -- before you run the install script, you might want to:
```
$ git checkout v1.1.0
```

## bats-assert

For help on the meaning of the various `assert*` commands in the tests, refer to the documentation for the [bats-assert][bats-assert] library.

## Skipped tests

Solving an exercise means making all its tests pass.
By default, only one test (the first one) is executed when you run the tests.
This is intentional, as it allows you to focus on just making that one test pass.
Once it passes, you can enable the next test by commenting out or removing the

    [[ $BATS_RUN_SKIPPED == true ]] || skip

annotations prepending other tests.

### Overriding skips

To run all tests, including the ones with `skip` annotations, you can set an environment variable `BATS_RUN_SKIPPED` to the value `true`. 
One way to set this just for the duration of running bats is:
```bash
BATS_RUN_SKIPPED=true bats exercise_name.bats
```

It can be convenient to use a wrapper function to save on typing:
```bash
bats() {
    BATS_RUN_SKIPPED=true command bats *.bats
}
```
Then run tests with just:
```bash
bats
```

## Legacy `bats`

`bats-core` was forked from [the original `bats` implementation][sstephenson-bats].
The `sstephenson/bats` project was quite buggy and had been abandoned.
Ownership was handed over in 2017: [sstephenson/bats#150 (comment)][bats-fork].

If you have the original sstephenson/bats installed (check with `bats -v` reporting a version number less than 1.0), then you should switch to bats-core; otherwise you may find yourself [experiencing unexplained test failures][legacy-failures].


[exercism-cli]: https://exercism.org/docs/using/solving-exercises/working-locally
[bats]: https://github.com/bats-core/bats-core
[bats-assert]: https://github.com/bats-core/bats-assert
[homebrew]: https://brew.sh/
[mingw-issues]: https://github.com/bats-core/bats-core/issues/256
[sstephenson-bats]: https://github.com/sstephenson/bats
[bats-fork]: https://github.com/sstephenson/bats/issues/150#issuecomment-323845404
[legacy-failures]: https://github.com/exercism/bash/pull/445
