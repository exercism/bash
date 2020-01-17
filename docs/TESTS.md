As there isn't much of a bash ecosystem, there also isn't really a defacto
leader in the bash testing area. For these examples we are using
[bats](https://github.com/bats-core/bats-core). You should be able to
install it from your favorite package manager, on OS X with
[Homebrew](https://brew.sh/) this would look something like this:

```
$ brew install bats-core
==> Downloading https://github.com/bats-core/bats-core/archive/v1.1.0.tar.gz
==> Downloading from https://codeload.github.com/bats-core/bats-core/tar.gz/v1.1.0
######################################################################## 100.0%
==> ./install.sh /usr/local/Cellar/bats-core/1.1.0
🍺  /usr/local/Cellar/bats-core/1.1.0: 13 files, 55KB, built in 4 seconds
```

For Ubuntu 15.10 or later  
```
sudo apt-get install bats  
```

For Red Hat, Scientific Linux, and CentOS 6 or later bats is found in the EPEL repository.  
```
sudo yum install bats  
```

Run the tests with `bats whatever_test.sh` or `./whatever_test.sh`.
