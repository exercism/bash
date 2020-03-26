#!/usr/bin/env bash

# local version: 1.3.0.0

@test "Empty RNA sequence" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh
  (( status == 0 ))
  [[ -z $output ]]
}

@test "RNA complement of cytosine is guanine" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh C
  (( status == 0 ))
  [[ $output == "G" ]]
}

@test "RNA complement of guanine is cytosine" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh G
  (( status == 0 ))
  [[ $output == "C" ]]
}

@test "RNA complement of thymine is adenine" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh T
  (( status == 0 ))
  [[ $output == "A" ]]
}

@test "RNA complement of adenine is uracil" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh A
  (( status == 0 ))
  [[ $output == "U" ]]
}

@test "RNA complement" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh ACGTGGTCTTAA
  (( status == 0 ))
  [[ $output == "UGCACCAGAAUU" ]]
}

@test "Handles invalid character" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh ACGTXCTTA
  (( status == 1 ))
  [[ $output == "Invalid nucleotide detected." ]]
}

@test "Handles completely invalid string" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh XXXX
  (( status == 1 ))
  [[ $output == "Invalid nucleotide detected." ]]
}

@test "Handles partially invalid string" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash rna_transcription.sh ACGTXCTTAA
  (( status == 1 ))
  [[ $output == "Invalid nucleotide detected." ]]
}
