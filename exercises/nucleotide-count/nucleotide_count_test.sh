#!/usr/bin/env bats

# count all nucleotides in a strand

@test "empty strand" {
  #skip
  run bash nucleotide_count.sh ""
  [ "$status" -eq 0 ]
  [ "$output" == $'A: 0\nC: 0\nG: 0\nT: 0' ]
}

@test "can count one nucleotide in single-character input" {
  skip
  run bash nucleotide_count.sh "G"
  [ "$status" -eq 0 ]
  [ "$output" == $'A: 0\nC: 0\nG: 1\nT: 0' ]
}

@test "strand with repeated nucleotide" {
  skip
  run bash nucleotide_count.sh "GGGGGGG"
  [ "$status" -eq 0 ]
  [ "$output" == $'A: 0\nC: 0\nG: 7\nT: 0' ]
}

@test "strand with multiple nucleotides" {
  skip
  run bash nucleotide_count.sh "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
  [ "$status" -eq 0 ]
  [ "$output" == $'A: 20\nC: 12\nG: 17\nT: 21' ]
}

@test "strand with invalid nucleotides" {
  skip
  run bash nucleotide_count.sh "AGXXACT"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid nucleotide in strand" ]
}

