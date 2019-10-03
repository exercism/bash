#!/usr/bin/env bash

@test "an empty string" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh ""

  [[ $status -eq 0 ]]
  [[ $output = "" ]]
}

@test "a word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "robot"

  [[ $status -eq 0 ]]
  [[ $output = "tobor" ]]
}

@test "a capitalised word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "Ramen"

  [[ $status -eq 0 ]]
  [[ $output = "nemaR" ]]
}

@test "a sentence with punctuation" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "I'm hungry!"

  [[ $status -eq 0 ]]
  [[ $output = "!yrgnuh m'I" ]]
}

@test "a palindrome" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "racecar"

  [[ $status -eq 0 ]]
  [[ $output = "racecar" ]]
}

@test "an even-sized word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "drawer"

  [[ $status -eq 0 ]]
  [[ $output = "reward" ]]
}

@test "avoid globbing" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh " a *  b"

  [[ $status -eq 0 ]]
  [[ $output = "b  * a " ]]
}
