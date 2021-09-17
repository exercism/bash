# Tests

Each exercise contains a test file.
Run the tests using the `bats` program.
```bash
bats hello_world.bats
```

`bats` will need to be installed.
See the [Testing on the Bash track](/docs/tracks/bash/tests) page for
instructions to install `bats` for your system.

## Help for assert functions

The tests use functions from the
[bats-assert](https://github.com/bats-core/bats-assert) library.
Help for the various `assert*` functions can be found there.

## Skipped tests

Solving an exercise means making all its tests pass. By default, only one
test (the first one) is executed when you run the tests. This is
intentional, as it allows you to focus on just making that one test pass.
Once it passes, you can enable the next test by commenting out or removing the

    [[ $BATS_RUN_SKIPPED == true ]] || skip

annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, you can run:
```bash
BATS_RUN_SKIPPED=true bats exercise_name.bats
```
