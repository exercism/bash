#!/usr/bin/env bats
load bats-extra

# local version: 2.7.0.0

@test 'valid isbn number' {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3-598-21508-8'
  assert_success
  assert_output "true"
}

@test 'invalid isbn check digit' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3-598-21508-9'
  assert_success
  assert_output "false"
}

@test 'valid isbn number with a check digit of 10' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3-598-21507-X'
  assert_success
  assert_output "true"
}

@test 'check digit is a character other than X' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3-598-21507-A'
  assert_success
  assert_output "false"
}

@test 'invalid character in isbn' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3-598-P1581-X'
  assert_success
  assert_output "false"
}

@test 'X is only valid as a check digit' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3-598-2X507-9'
  assert_success
  assert_output "false"
}

@test 'valid isbn without separating dashes' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3598215088'
  assert_success
  assert_output "true"
}

@test 'isbn without separating dashes and X as check digit' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '359821507X'
  assert_success
  assert_output "true"
}

@test 'isbn without check digit and dashes' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '359821507'
  assert_success
  assert_output "false"
}

@test 'too long isbn and no dashes' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3598215078X'
  assert_success
  assert_output "false"
}

@test 'too short isbn' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '00'
  assert_success
  assert_output "false"
}

@test 'isbn without check digit' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3-598-21507'
  assert_success
  assert_output "false"
}

@test 'check digit of X should not be used for 0' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3-598-21515-X'
  assert_success
  assert_output "false"
}

@test 'empty isbn' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh ''
  assert_success
  assert_output "false"
}

@test 'input is 9 characters' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '134456729'
  assert_success
  assert_output "false"
}

@test 'invalid characters are not ignored' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '3132P34035'
  assert_success
  assert_output "false"
}

@test 'input is too long but contains a valid isbn' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isbn_verifier.sh '98245726788'
  assert_success
  assert_output "false"
}
