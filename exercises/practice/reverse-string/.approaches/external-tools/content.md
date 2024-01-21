# External Tools

The GNU Linux core utilities contain lots of goodies.
To reverse strings, use `rev`.

```bash
$ echo "Hello, World!" | rev
!dlroW ,olleH
```

`rev` also works with files to reverse each line.

```bash
$ printf '%s\n' one two three > myfile
$ rev myfile
eno
owt
eerht
```

There are other ways to do this, but none are a simple as `rev`.

```bash
grep -o . <<< "$string" | tac | paste -s -d ''
perl -lne 'print scalar reverse' <<< "$string"
# etc
```
