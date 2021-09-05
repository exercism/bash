#!/usr/bin/env bash
load bats-extra

# local version: 1.1.0.0

@test 'Zero is Armstrong numbers' {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 0
  assert_success
  assert_output "true"
}

@test 'Single digits are Armstrong numbers' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 5
  assert_success
  assert_output "true"
}

@test 'There are no two digit Armstrong numbers' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 10
  assert_success
  assert_output "false"
}

@test 'A three digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 153
  assert_success
  assert_output "true"
}

@test 'A three digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 100
  assert_success
  assert_output "false"
}

@test 'A four digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 9474
  assert_success
  assert_output "true"
}

@test 'A four digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 9475
  assert_success
  assert_output "false"
}

@test 'A seven digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 9926315
  assert_success
  assert_output "true"
}

@test 'A seven digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash armstrong_numbers.sh 9926314
  assert_success
  assert_output "false"
}
