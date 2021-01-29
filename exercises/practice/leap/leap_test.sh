#!/usr/bin/env bash

# local version: 1.6.0.1
# bash-specific test: Input validation

@test 'year not divisible by 4: common year' {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2015

  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'year divisible by 2, not divisible by 4 in common year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1970

  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'year divisible by 4, not divisible by 100: leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1996

  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'year divisible by 4 and 5 is still a leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1960

  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'year divisible by 100, not divisible by 400: common year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2100

  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'year divisible by 100 but not by 3 is still not a leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1900

  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'year divisible by 400: leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2000

  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'year divisible by 400 but not by 125 is still a leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2400

  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'year divisible by 200, not divisible by 400 in common year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1800

  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'No input should return an error' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh

  (( status == 1 ))
  [[ $output == "Usage: leap.sh <year>" ]]
}

@test 'Too many arguments should return an error' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2016 4562 4566

  (( status == 1 ))
  [[ $output == "Usage: leap.sh <year>" ]]
}

@test 'Float number input should return an error' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2016.54

  (( status == 1 ))
  [[ $output == "Usage: leap.sh <year>" ]]
}

@test 'Alpha input should return an error' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 'abcd'

  (( status == 1 ))
  [[ $output == "Usage: leap.sh <year>" ]]
}
