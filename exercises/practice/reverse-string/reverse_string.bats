#!/usr/bin/env bats
load bats-extra

# local version: 1.2.0.1

@test "an empty string" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash reverse_string.sh ""

  assert_success
  assert_output ""
}

@test "a word" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash reverse_string.sh "robot"

  assert_success
  assert_output "tobor"
}

@test "a capitalised word" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash reverse_string.sh "Ramen"

  assert_success
  assert_output "nemaR"
}

@test "a sentence with punctuation" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash reverse_string.sh "I'm hungry!"

  assert_success
  assert_output "!yrgnuh m'I"
}

@test "a palindrome" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash reverse_string.sh "racecar"

  assert_success
  assert_output "racecar"
}

@test "an even-sized word" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash reverse_string.sh "drawer"

  assert_success
  assert_output "reward"
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "avoid globbing" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash reverse_string.sh " a *  b"

  assert_success
  assert_output "b  * a "
}

# The program should reverse the entire input, not each line individually
@test "treats a newline like any other character" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash reverse_string.sh $'Hello,\nWorld!'

  assert_success
  assert_output $'!dlroW\n,olleH'
}
