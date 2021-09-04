#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.2.0.1

@test "no name given" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip

  # The above line controls whether to skip the test.
  # Normally, we skip every test except for the first one
  # (the first one is always commented out).  This allows for
  # a person to focus on solving a test at a time: you can
  # comment out or delete the
  # `[[ $BATS_RUN_SKIPPED == "true" ]] || skip`
  # line to run the test when you are ready.
  #
  # You can also run all the tests by setting the
  # `$BATS_RUN_SKIPPED` environment variable, like this:
  #
  #     $ BATS_RUN_SKIPPED=true bats two_fer_test.sh

  run bash two_fer.sh
  assert_success
  assert_output "One for you, one for me."
}

@test "a name given" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash two_fer.sh Alice
  assert_success
  assert_output "One for Alice, one for me."
}

@test "another name given" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash two_fer.sh Bob
  assert_success
  assert_output "One for Bob, one for me."
}

# bash-specific test: Focus the student's attention on the effects of
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "handle arg with spaces" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash two_fer.sh "John Smith" "Mary Ann"
  assert_success
  assert_output "One for John Smith, one for me."
}

@test "handle arg with glob char" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash two_fer.sh "* "
  assert_success
  assert_output "One for * , one for me."
}
