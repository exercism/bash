#!/usr/bin/env bats

@test "Empty RNA sequence" {
  #skip
  run bash rna_transcription.sh
  [ "$status" -eq 0 ]
  [ "$output" == "" ]
}

@test "RNA complement of cytosine is guanine" {
  skip
  run bash rna_transcription.sh C
  [ "$status" -eq 0 ]
  [ "$output" == "G" ]
}

@test "RNA complement of guanine is cytosine" {
  skip
  run bash rna_transcription.sh G
  [ "$status" -eq 0 ]
  [ "$output" == "C" ]
}

@test "RNA complement of thymine is adenine" {
  skip
  run bash rna_transcription.sh T
  [ "$status" -eq 0 ]
  [ "$output" == "A" ]
}

@test "RNA complement of adenine is uracil" {
  skip
  run bash rna_transcription.sh A
  [ "$status" -eq 0 ]
  [ "$output" == "U" ]
}

@test "RNA complement" {
  skip
  run bash rna_transcription.sh ACGTGGTCTTAA
  [ "$status" -eq 0 ]
  [ "$output" == "UGCACCAGAAUU" ]
}

@test "Handles invalid character" {
  skip
  run bash rna_transcription.sh ACGTXCTTA
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid nucleotide detected." ]
}

@test "Handles completely invalid string" {
  skip
  run bash rna_transcription.sh XXXX
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid nucleotide detected." ]
}

@test "Handles partially invalid string" {
  skip
  run bash rna_transcription.sh ACGTXCTTAA
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid nucleotide detected." ]
}

