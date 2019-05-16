#!/usr/bin/env bash

@test "An empty string" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh ""

  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "A word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "robot"

  [ "$status" -eq 0 ]
  [ "$output" = "tobor" ]
}

@test "A capitalised word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "Ramen"

  [ "$status" -eq 0 ]
  [ "$output" = "nemaR" ]
}

@test "A sentence with punctuation" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "I'm hungry!"

  [ "$status" -eq 0 ]
  [ "$output" = "!yrgnuh m'I" ]
}

@test "A palindrome" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash reverse_string.sh "racecar"

  [ "$status" -eq 0 ]
  [ "$output" = "racecar" ]
}
