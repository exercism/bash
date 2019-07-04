#!/usr/bin/env bash

@test 'Zero is Armstrong numbers' {
  # [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 0
  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'Single digits are Armstrong numbers' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 5

  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'There are no two digit Armstrong numbers' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 10

  [ "$status" -eq 0 ]
  [ "$output" = "false" ]
}

@test 'A three digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 153

  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'A three digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 100

  [ "$status" -eq 0 ]
  [ "$output" = "false" ]
}

@test 'A four digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 9474

  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'A four digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 9475

  [ "$status" -eq 0 ]
  [ "$output" = "false" ]
}

@test 'A seven digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 9926315

  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'A seven digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 9926314

  [ "$status" -eq 0 ]
  [ "$output" = "false" ]
}

