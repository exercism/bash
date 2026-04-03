# Debugging Locally

When you run Bash track tests with [Bats](https://github.com/bats-core/bats-core), Bats captures both STDOUT and STDERR for output assertions.

```exercism/caution
This works locally with `bats`, but **not** in the Exercism online editor.
```

If you want to print debug output without affecting the test result, write it to file descriptor (fd) 3.

```bash
echo 'debug message' >&3
```

Bats shows output written to fd 3 during the test run, but it does not include that output in assertions such as `assert_output`.

Example run:

```none
$ bats hello_world.bats
hello_world.bats
 ✓ Say Hi!
debug message
1 test, 0 failures
```

This is useful when you are running the tests locally.
