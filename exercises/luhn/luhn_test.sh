#!/usr/bin/env bash

@test "single digit strings can not be valid" {
  #skip
  run bash luhn.sh "1"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "a single zero is invalid" {
  skip
  run bash luhn.sh "0"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "a simple valid SIN that remains valid if reversed" {
  skip
  run bash luhn.sh "059"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "a simple valid SIN that becomes invalid if reversed" {
  skip
  run bash luhn.sh "59"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "a valid Canadian SIN" {
  skip
  run bash luhn.sh "055 444 285"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "invalid Canadian SIN" {
  skip
  run bash luhn.sh "055 444 286"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "invalid credit card" {
  skip
  run bash luhn.sh "8273 1232 7352 0569"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "valid strings with a non-digit included become invalid" {
  skip
  run bash luhn.sh "055a 444 285"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "valid strings with punctuation included become invalid" {
  skip
  run bash luhn.sh "055-444-285"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "valid strings with symbols included become invalid" {
  skip
  run bash luhn.sh "055£ 444$ 285"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "single zero with space is invalid" {
  skip
  run bash luhn.sh " 0"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "more than a single zero is valid" {
  skip
  run bash luhn.sh "0000 0"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "input digit 9 is correctly converted to output digit 9" {
  skip
  run bash luhn.sh "091"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "strings with non-digits is invalid" {
  skip
  run bash luhn.sh ":9"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}
