As there isn't much of a bash ecosystem, there also isn't really a defacto leader in the bash testing area. For these examples we are using [bats](https://github.com/sstephenson/bats). You should be able to install it from your favorite package manager, on OS X with homebrew this would look something like this:

### For Mac (brew)
```
$ brew install bats
==> Downloading
https://github.com/sstephenson/bats/archive/v0.4.0.tar.gz
==> Downloading from
https://codeload.github.com/sstephenson/bats/tar.gz/v0.4.0
######################################################################## 100.0%
==> ./install.sh /opt/boxen/homebrew/Cellar/bats/0.4.0
/opt/boxen/homebrew/Cellar/bats/0.4.0: 10 files, 60K, built in 2 seconds  
```

### For Ubuntu 15.10 or later  
```
sudo apt-get install bats  
```

### For Red Hat, Scientific Linux, and CentOS 6 or later bats is found in the EPEL repository.  
```
sudo yum install bats  
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
