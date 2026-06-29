#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test 'year not divisible by 4 in common year' {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2015

  assert_success
  assert_output "false"
}

@test 'year divisible by 2, not divisible by 4 in common year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1970

  assert_success
  assert_output "false"
}

@test 'year divisible by 4, not divisible by 100 in leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1996

  assert_success
  assert_output "true"
}

@test 'year divisible by 4 and 5 is still a leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1960

  assert_success
  assert_output "true"
}

@test 'year divisible by 100, not divisible by 400 in common year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2100

  assert_success
  assert_output "false"
}

@test 'year divisible by 100 but not by 3 is still not a leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1900

  assert_success
  assert_output "false"
}

@test 'year divisible by 400 is leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2000

  assert_success
  assert_output "true"
}

@test 'year divisible by 400 but not by 125 is still a leap year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2400

  assert_success
  assert_output "true"
}

@test 'year divisible by 200, not divisible by 400 in common year' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 1800

  assert_success
  assert_output "false"
}

@test 'No input should return an error' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh

  assert_failure
  assert_output "Usage: leap.sh <year>"
}

@test 'Too many arguments should return an error' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2016 4562 4566

  assert_failure
  assert_output "Usage: leap.sh <year>"
}

@test 'Float number input should return an error' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 2016.54

  assert_failure
  assert_output "Usage: leap.sh <year>"
}

@test 'Alpha input should return an error' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash leap.sh 'abcd'

  assert_failure
  assert_output "Usage: leap.sh <year>"
}
