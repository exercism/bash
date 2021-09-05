#!/usr/bin/env bash
load bats-extra

# local version: 1.2.0.0

@test "1 is a single I" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 1
  assert_success
  assert_output "I"
}

@test "2 is two I's" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 2
  assert_success
  assert_output "II"
}

@test "3 is three I's" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 3
  assert_success
  assert_output "III"
}

@test "4, being 5 - 1, is IV" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 4
  assert_success
  assert_output "IV"
}

@test "5 is a single V" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 5
  assert_success
  assert_output "V"
}

@test "6, being 5 + 1, is VI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 6
  assert_success
  assert_output "VI"
}

@test "9, being 10 - 1, is IX" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 9
  assert_success
  assert_output "IX"
}

@test "20 is two X's" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 27
  assert_success
  assert_output "XXVII"
}

@test "48 is not 50 - 2 but rather 40 + 8" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 48
  assert_success
  assert_output "XLVIII"
}

@test "49 is not 40 + 5 + 4 but rather 50 - 10 + 10 - 1" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 49
  assert_success
  assert_output "XLIX"
}

@test "50 is a single L" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 59
  assert_success
  assert_output "LIX"
}

@test "90, being 100 - 10, is XC" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 93
  assert_success
  assert_output "XCIII"
}

@test "100 is a single C" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 141
  assert_success
  assert_output "CXLI"
}

@test "60, being 50 + 10, is LX" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 163
  assert_success
  assert_output "CLXIII"
}

@test "400, being 500 - 100, is CD" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 402
  assert_success
  assert_output "CDII"
}

@test "500 is a single D" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 575
  assert_success
  assert_output "DLXXV"
}

@test "900, being 1000 - 100, is CM" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 911
  assert_success
  assert_output "CMXI"
}

@test "1000 is a single M" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 1024
  assert_success
  assert_output "MXXIV"
}

@test "3000 is three M's" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 3000
  assert_success
  assert_output "MMM"
}
