#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test "grains on square 1" {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 1
  assert_success
  assert_output "1"
}

@test "grains on square 2" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 2
  assert_success
  assert_output "2"
}

@test "grains on square 3" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 3
  assert_success
  assert_output "4"
}

@test "grains on square 4" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 4
  assert_success
  assert_output "8"
}

@test "grains on square 16" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 16
  assert_success
  assert_output "32768"
}

@test "grains on square 32" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 32
  assert_success
  assert_output "2147483648"
}

@test "grains on square 64" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 64
  assert_success
  assert_output "9223372036854775808"
}

@test "square 0 is invalid" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh 0
  assert_failure
  assert_output "Error: invalid input"
}

@test "negative square is invalid" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash grains.sh -1
  assert_failure
  assert_output "Error: invalid input"
}

@test "square greater than 64 is invalid" {
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
