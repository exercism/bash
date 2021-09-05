#!/usr/bin/env bash
load bats-extra

# local version: 0.0.1

@test "correct arguments" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh Alice

  assert_success
  assert_output "Hello, Alice"
}

@test "one long argument" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh "Alice and Bob"

  assert_success
  assert_output "Hello, Alice and Bob"
}

@test "incorrect arguments" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh Alice Bob

  assert_failure
  assert_output "Usage: error_handling.sh <person>"
}

@test "print usage banner with no value given" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh

  assert_failure
  assert_output "Usage: error_handling.sh <person>"
}

@test "empty argument" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh ""

  assert_success
  assert_output "Hello, "
}
