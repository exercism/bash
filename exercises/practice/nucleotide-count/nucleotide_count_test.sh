#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.3.0.0

# count all nucleotides in a strand

@test "empty strand" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash nucleotide_count.sh ""
  assert_success
  assert_output $'A: 0\nC: 0\nG: 0\nT: 0'
}

@test "can count one nucleotide in single-character input" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash nucleotide_count.sh "G"
  assert_success
  assert_output $'A: 0\nC: 0\nG: 1\nT: 0'
}

@test "strand with repeated nucleotide" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash nucleotide_count.sh "GGGGGGG"
  assert_success
  assert_output $'A: 0\nC: 0\nG: 7\nT: 0'
}

@test "strand with multiple nucleotides" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash nucleotide_count.sh "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
  assert_success
  assert_output $'A: 20\nC: 12\nG: 17\nT: 21'
}

@test "strand with invalid nucleotides" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash nucleotide_count.sh "AGXXACT"
  assert_failure
  assert_output "Invalid nucleotide in strand"
}

