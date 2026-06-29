#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test "1 is I" {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 1
  assert_success
  assert_output "I"
}

@test "2 is II" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 2
  assert_success
  assert_output "II"
}

@test "3 is III" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 3
  assert_success
  assert_output "III"
}

@test "4 is IV" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 4
  assert_success
  assert_output "IV"
}

@test "5 is V" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 5
  assert_success
  assert_output "V"
}

@test "6 is VI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 6
  assert_success
  assert_output "VI"
}

@test "9 is IX" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 9
  assert_success
  assert_output "IX"
}

@test "16 is XVI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 16
  assert_success
  assert_output "XVI"
}

@test "27 is XXVII" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 27
  assert_success
  assert_output "XXVII"
}

@test "48 is XLVIII" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 48
  assert_success
  assert_output "XLVIII"
}

@test "49 is XLIX" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 49
  assert_success
  assert_output "XLIX"
}

@test "59 is LIX" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 59
  assert_success
  assert_output "LIX"
}

@test "66 is LXVI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 66
  assert_success
  assert_output "LXVI"
}

@test "93 is XCIII" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 93
  assert_success
  assert_output "XCIII"
}

@test "141 is CXLI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 141
  assert_success
  assert_output "CXLI"
}

@test "163 is CLXIII" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 163
  assert_success
  assert_output "CLXIII"
}

@test "166 is CLXVI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 166
  assert_success
  assert_output "CLXVI"
}

@test "402 is CDII" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 402
  assert_success
  assert_output "CDII"
}

@test "575 is DLXXV" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 575
  assert_success
  assert_output "DLXXV"
}

@test "666 is DCLXVI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 666
  assert_success
  assert_output "DCLXVI"
}

@test "911 is CMXI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 911
  assert_success
  assert_output "CMXI"
}

@test "1024 is MXXIV" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 1024
  assert_success
  assert_output "MXXIV"
}

@test "1666 is MDCLXVI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 1666
  assert_success
  assert_output "MDCLXVI"
}

@test "3000 is MMM" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 3000
  assert_success
  assert_output "MMM"
}

@test "3001 is MMMI" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 3001
  assert_success
  assert_output "MMMI"
}

@test "3888 is MMMDCCCLXXXVIII" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 3888
  assert_success
  assert_output "MMMDCCCLXXXVIII"
}

@test "3999 is MMMCMXCIX" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash roman_numerals.sh 3999
  assert_success
  assert_output "MMMCMXCIX"
}
