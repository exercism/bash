# Tests

Each exercise contains a test file.
Run the tests using the `bats` program.

```bash
bats hello_world.bats
```

`bats` will need to be installed.
See the [Testing on the Bash track][tests] page for instructions to install `bats` for your system.

[tests]: https://exercism.org/docs/tracks/bash/tests

## Help for assert functions

The tests use functions from the [bats-assert][bats-assert] library.
Help for the various `assert*` functions can be found there.

[bats-assert]: https://github.com/bats-core/bats-assert

## Debugging output

```exercism/caution
This works locally with `bats`, but **not** in the Exercism online editor.
```

When running tests, `bats` captures both stdout and stderr for comparison with the expected output.
If you print debug messages to stdout (`echo`) or stderr (`>&2`), they will be included in the captured output and may cause the test to fail.

To print debug information without affecting the test results, `bats` provides file descriptor **3** for this purpose.
Anything redirected to `>&3` will be shown during the test run but will not be included in the captured output used for assertions.

Example:

```bash
#!/usr/bin/env bash

# This debug message will not interfere with test output comparison
echo "debug message" >&3

# Normal program output (this is what your tests will see and compare)
echo "Hello, World!"
```

Example run:

```none
$ bats hello_world.bats
hello_world.bats
 ✓ Say Hi!
debug message
1 test, 0 failures
```

This allows you to see helpful debug output without affecting the tests.

## Skipped tests

Solving an exercise means making all its tests pass.
By default, only one test (the first one) is executed when you run the tests.
This is intentional, as it allows you to focus on just making that one test pass.
Once it passes, you can enable the next test by commenting out or removing the next annotation:

```bash
[[ $BATS_RUN_SKIPPED == true ]] || skip
```

## Overriding skips

To run all tests, including the ones with `skip` annotations, you can run:

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
