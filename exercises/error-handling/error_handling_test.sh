#!/usr/bin/env bash

@test "correct arguments" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash error_handling.sh Alice

  [[ $status -eq 0 ]]
  [[ $output = "Hello, Alice" ]]
}

@test "one long argument" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash error_handling.sh "Alice and Bob"

  [[ $status -eq 0 ]]
  [[ $output = "Hello, Alice and Bob" ]]
}

@test "incorrect arguments" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash error_handling.sh Alice Bob

  [[ $status -eq 1 ]]
  [[ $output = "Usage: ./error_handling <greetee>" ]]
}

@test "print usage banner with no value given" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash error_handling.sh

  [[ $status -eq 1 ]]
  [[ $output = "Usage: ./error_handling <greetee>" ]]
}

@test "empty argument" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash error_handling.sh ""

  [[ $status -eq 0 ]]
  [[ $output = "Hello, " ]]
}
