#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test "square of sum 1" {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh square_of_sum 1
  assert_success
  assert_output "1"
}

@test "square of sum 5" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh square_of_sum 5
  assert_success
  assert_output "225"
}

@test "square of sum 100" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh square_of_sum 100
  assert_success
  assert_output "25502500"
}

@test "sum of squares 1" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh sum_of_squares 1
  assert_success
  assert_output "1"
}

@test "sum of squares 5" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh sum_of_squares 5
  assert_success
  assert_output "55"
}

@test "sum of squares 100" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh sum_of_squares 100
  assert_success
  assert_output "338350"
}

@test "difference of squares 1" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh difference 1
  assert_success
  assert_output "0"
}

@test "difference of squares 5" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh difference 5
  assert_success
  assert_output "170"
}

@test "difference of squares 100" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash difference_of_squares.sh difference 100
  assert_success
  assert_output "25164150"
}
