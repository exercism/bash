#!/usr/bin/env bats
load bats-extra

# local version: 1.2.0.0

@test "1" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 1
  assert_success
  assert_output "1"
}

@test "2" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 2
  assert_success
  assert_output "2"
}

@test "3" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 3
  assert_success
  assert_output "4"
}

@test "4" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 4
  assert_success
  assert_output "8"
}

@test "16" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 16
  assert_success
  assert_output "32768"
}

@test "32" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 32
  assert_success
  assert_output "2147483648"
}

@test "64" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 64
  assert_success
  assert_output "9223372036854775808"
}

@test "square 0 raises an exception" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 0
  assert_failure
  assert_output "Error: invalid input"
}

@test "negative square raises an exception" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh -1
  assert_failure
  assert_output "Error: invalid input"
}

@test "square greater than 64 raises an exception" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 65
  assert_failure
  assert_output "Error: invalid input"
}

@test "returns the total number of grains on the board" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh total
  assert_success
  assert_output "18446744073709551615"
}
