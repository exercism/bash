#!/usr/bin/env bash

# local version: 1.1.0.0

@test 'Zero is Armstrong numbers' {
  # [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 0
  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'Single digits are Armstrong numbers' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 5

  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'There are no two digit Armstrong numbers' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 10

  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'A three digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 153

  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'A three digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 100

  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'A four digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 9474

  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'A four digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 9475

  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'A seven digit number that is an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 9926315

  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'A seven digit number that is not an Armstrong number' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash armstrong_numbers.sh 9926314

  (( status == 0 ))
  [[ $output == "false" ]]
}

