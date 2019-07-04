#!/usr/bin/env bash

@test 'year not divisible by 4: common year' {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 2015

  [ "$status" -eq 0 ]
  [ "$output" = 'false' ]
}

@test 'year divisible by 2, not divisible by 4 in common year' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 1970

  [ "$status" -eq 0 ]
  [ "$output" = 'false' ]
}

@test 'year divisible by 4, not divisible by 100: leap year' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 1996

  [ "$status" -eq 0 ]
  [ "$output" = 'true' ]
}

@test 'year divisible by 100, not divisible by 400: common year' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 2100

  [ "$status" -eq 0 ]
  [ "$output" = 'false' ]
}

@test 'year divisible by 400: leap year' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 2000

  [ "$status" -eq 0 ]
  [ "$output" = 'true' ]
}

@test 'year divisible by 200, not divisible by 400 in common year' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 1800

  [ "$status" -eq 0 ]
  [ "$output" = 'false' ]
}

@test 'No input should return an error' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh

  [ "$status" -eq 1 ]
  [ "$output" = 'Usage: leap.sh <year>' ]
}

@test 'Too many arguments should return an error' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 2016 4562 4566

  [ "$status" -eq 1 ]
  [ "$output" = 'Usage: leap.sh <year>' ]
}

@test 'Float number input should return an error' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 2016.54

  [ "$status" -eq 1 ]
  [ "$output" = 'Usage: leap.sh <year>' ]
}

@test 'Alpha input should return an error' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash leap.sh 'abcd'

  [ "$status" -eq 1 ]
  [ "$output" = 'Usage: leap.sh <year>' ]
}
