#!/usr/bin/env bash

# local version: 1.2.0.0

@test "1" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 1
  (( status == 0 ))
  [[ $output == "1" ]]
}

@test "2" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 2
  (( status == 0 ))
  [[ $output == "2" ]]
}

@test "3" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 3
  (( status == 0 ))
  [[ $output == "4" ]]
}

@test "4" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 4
  (( status == 0 ))
  [[ $output == "8" ]]
}

@test "16" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 16
  (( status == 0 ))
  [[ $output == "32768" ]]
}

@test "32" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 32
  (( status == 0 ))
  [[ $output == "2147483648" ]]
}

@test "64" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 64
  (( status == 0 ))
  [[ $output == "9223372036854775808" ]]
}

@test "square 0 raises an exception" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 0
  (( status == 1 ))
  [[ $output == "Error: invalid input" ]]
}

@test "negative square raises an exception" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh -1
  (( status == 1 ))
  [[ $output == "Error: invalid input" ]]
}

@test "square greater than 64 raises an exception" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh 65
  (( status == 1 ))
  [[ $output == "Error: invalid input" ]]
}

@test "returns the total number of grains on the board" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash grains.sh total
  (( status == 0 ))
  [[ $output == "18446744073709551615" ]]
}
