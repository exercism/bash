#!/usr/bin/env bats

@test "An empty string" {
  #skip
  run bash reverse_string.sh ""

  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "A word" {
  skip
  run bash reverse_string.sh "robot"

  [ "$status" -eq 0 ]
  [ "$output" = "tobor" ]
}

@test "A capitalised word" {
  skip
  run bash reverse_string.sh "Ramen"

  [ "$status" -eq 0 ]
  [ "$output" = "nemaR" ]
}

@test "A sentence with punctuation" {
  skip
  run bash reverse_string.sh "I'm hungry!"

  [ "$status" -eq 0 ]
  [ "$output" = "!yrgnuh m'I" ]
}

@test "A palindrome" {
  skip
  run bash reverse_string.sh "racecar"

  [ "$status" -eq 0 ]
  [ "$output" = "racecar" ]
}
