#!/usr/bin/env bash
load bats-extra

# local version: 1.3.0.0

@test "Empty RNA sequence" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh
  assert_success
  [[ -z $output ]]
}

@test "RNA complement of cytosine is guanine" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh C
  assert_success
  assert_output "G"
}

@test "RNA complement of guanine is cytosine" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh G
  assert_success
  assert_output "C"
}

@test "RNA complement of thymine is adenine" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh T
  assert_success
  assert_output "A"
}

@test "RNA complement of adenine is uracil" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh A
  assert_success
  assert_output "U"
}

@test "RNA complement" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh ACGTGGTCTTAA
  assert_success
  assert_output "UGCACCAGAAUU"
}

@test "Handles invalid character" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh ACGTXCTTA
  assert_failure
  assert_output "Invalid nucleotide detected."
}

@test "Handles completely invalid string" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh XXXX
  assert_failure
  assert_output "Invalid nucleotide detected."
}

@test "Handles partially invalid string" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh ACGTXCTTAA
  assert_failure
  assert_output "Invalid nucleotide detected."
}
