#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-28T21:02:53+00:00
# local version: 2.0.0.0

@test "zero steps for one" {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash collatz_conjecture.sh 1
  assert_success
  assert_output "0"
}

@test "divide if even" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash collatz_conjecture.sh 16
  assert_success
  assert_output "4"
}

@test "even and odd steps" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash collatz_conjecture.sh 12
  assert_success
  assert_output "9"
}

@test "large number of even and odd steps" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash collatz_conjecture.sh 1000000
  assert_success
  assert_output "152"
}

@test "zero is an error" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash collatz_conjecture.sh 0
  assert_failure
  assert_output "Error: Only positive integers are allowed"
}

@test "negative value is an error" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash collatz_conjecture.sh -15
  assert_failure
  assert_output "Error: Only positive integers are allowed"
}
