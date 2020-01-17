As there isn't much of a bash ecosystem, there also isn't really a defacto
leader in the bash testing area. For these examples we are using
[bats](https://github.com/bats-core/bats-core). You should be able to
install it from your favorite package manager, on OS X with
[Homebrew](https://brew.sh/) this would look something like this:

### For Mac (brew)
```
$ brew install bats-core
==> Downloading https://github.com/bats-core/bats-core/archive/v1.1.0.tar.gz
==> Downloading from https://codeload.github.com/bats-core/bats-core/tar.gz/v1.1.0
######################################################################## 100.0%
==> ./install.sh /usr/local/Cellar/bats-core/1.1.0
🍺  /usr/local/Cellar/bats-core/1.1.0: 13 files, 55KB, built in 4 seconds
```

### For Linux
The implementation of `bats` we use is not conveniently packaged. The best way to install it is from source: if you want to install it under `/usr/local` then
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

---

Run the tests with `bats whatever_test.sh` or `./whatever_test.sh`.
