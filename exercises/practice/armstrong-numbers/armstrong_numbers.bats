#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test 'Zero is an Armstrong number' {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 0
  assert_success
  assert_output "true"
}

@test 'Single-digit numbers are Armstrong numbers' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 5
  assert_success
  assert_output "true"
}

@test 'There are no two-digit Armstrong numbers' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 10
  assert_success
  assert_output "false"
}

@test 'Three-digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 153
  assert_success
  assert_output "true"
}

@test 'Three-digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 100
  assert_success
  assert_output "false"
}

@test 'Four-digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 9474
  assert_success
  assert_output "true"
}

@test 'Four-digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 9475
  assert_success
  assert_output "false"
}

@test 'Seven-digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 9926315
  assert_success
  assert_output "true"
}

@test 'Seven-digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 9926314
  assert_success
  assert_output "false"
}
