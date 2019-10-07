#!/usr/bin/env bash

# local version: 1.2.0.0

@test "no name given" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip

  # The above line controls whether to skip the test.
  # Normally, we skip every test except for the first one
  # (the first one is always commented out).  This allows for
  # a person to focus on solving a test at a time: you can
  # comment out or delete the
  # `[[ $BATS_RUN_SKIPPED == true  ]] || skip`
  # line to run the test when you are ready.
  #
  # You can also run all the tests by setting the
  # `$BATS_RUN_SKIPPED` environment variable, like this:
  #
  #     $ BATS_RUN_SKIPPED=true bats two_fer_test.sh

  run bash two_fer.sh
  [[ $status -eq 0 ]]
  [[ $output == "One for you, one for me." ]]
}

@test "a name given" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash two_fer.sh Alice
  [[ $status -eq 0 ]]
  [[ $output == "One for Alice, one for me." ]]
}

@test "another name given" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash two_fer.sh Bob
  [[ $status -eq 0 ]]
  [[ $output == "One for Bob, one for me." ]]
}

@test "handle arg1 properly" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash two_fer.sh "John Smith" "Mary Ann"
  [[ $status -eq 0 ]]
  [[ $output == "One for John Smith, one for me." ]]
}

