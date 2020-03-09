#!/usr/bin/env bash

# local version: 1.7.0.0

@test "single digit strings can not be valid" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "1"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "a single zero is invalid" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "0"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "a simple valid SIN that remains valid if reversed" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "059"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "a simple valid SIN that becomes invalid if reversed" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "59"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "a valid Canadian SIN" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "055 444 285"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "invalid Canadian SIN" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "055 444 286"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "invalid credit card" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "8273 1232 7352 0569"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test  "invalid long number with an even remainder" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "1 2345 6789 1234 5678 9012"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "valid number with an even number of digits" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "095 245 88"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "valid number with an odd number of spaces" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "234 567 891 234"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "valid strings with a non-digit included become invalid" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "055a 444 285"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "valid strings with punctuation included become invalid" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "055-444-285"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "valid strings with symbols included become invalid" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "055£ 444$ 285"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "single zero with space is invalid" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh " 0"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "more than a single zero is valid" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "0000 0"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "input digit 9 is correctly converted to output digit 9" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "091"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "using ascii value for non-doubled non-digit isn't allowed" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh "055b 444 285"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "using ascii value for doubled non-digit isn't allowed" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash luhn.sh ":9"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}
