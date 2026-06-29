#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test 'empty string' {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh ''
  assert_success
  assert_output "true"
}

@test 'isogram with only lower case characters' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'isogram'
  assert_success
  assert_output "true"
}

@test 'word with one duplicated character' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'eleven'
  assert_success
  assert_output "false"
}

@test 'word with one duplicated character from the end of the alphabet' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'zzyzx'
  assert_success
  assert_output "false"
}

@test 'longest reported english isogram' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'subdermatoglyphic'
  assert_success
  assert_output "true"
}

@test 'word with duplicated character in mixed case' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'Alphabet'
  assert_success
  assert_output "false"
}

@test 'word with duplicated character in mixed case, lowercase first' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'alphAbet'
  assert_success
  assert_output "false"
}

@test 'hypothetical isogrammic word with hyphen' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'thumbscrew-japingly'
  assert_success
  assert_output "true"
}

@test 'hypothetical word with duplicated character following hyphen' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'thumbscrew-jappingly'
  assert_success
  assert_output "false"
}

@test 'isogram with duplicated hyphen' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'six-year-old'
  assert_success
  assert_output "true"
}

@test 'made-up name that is an isogram' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'Emily Jung Schwartzkopf'
  assert_success
  assert_output "true"
}

@test 'duplicated character in the middle' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'accentor'
  assert_success
  assert_output "false"
}

@test 'same first and last characters' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'angola'
  assert_success
  assert_output "false"
}

@test 'word with duplicated character and with two hyphens' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash isogram.sh 'up-to-date'
  assert_success
  assert_output "false"
}
