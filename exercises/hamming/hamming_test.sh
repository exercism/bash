#!/usr/bin/env bats

@test "empty strands" {
  #skip
  run bash hamming.sh "" ""
  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "identical strands" {
  skip
  run bash hamming.sh "A" "A"
  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "long identical strands" {
  skip
  run bash hamming.sh "GGACTGA" "GGACTGA"
  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "complete distance in single nucleotide strands" {
  skip
  run bash hamming.sh "A" "G"
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "complete distance in small strands" {
  skip
  run bash hamming.sh "AG" "CT"
  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ]
}

@test "small distance in small strands" {
  skip
  run bash hamming.sh "AT" "CT"
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "small distance" {
  skip
  run bash hamming.sh "GGACG" "GGTCG"
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "small distance in long strands" {
  skip
  run bash hamming.sh "ACCAGGG" "ACTATGG"
  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ]
}

@test "non-unique character in first strand" {
  skip
  run bash hamming.sh "AAG" "AAA"
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "non-unique character in second strand" {
  skip
  run bash hamming.sh "AAA" "AAG"
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "same nucleotides in different positions" {
  skip
  run bash hamming.sh "TAG" "GAT"
  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ]
}

@test "large distance" {
  skip
  run bash hamming.sh "GATACA" "GCATAA"
  [ "$status" -eq 0 ]
  [ "$output" -eq 4 ]
}

@test "large distance in off-by-one strand" {
  skip
  run bash hamming.sh "GGACGGATTCTG" "AGGACGGATTCT"
  [ "$status" -eq 0 ]
  [ "$output" -eq 9 ]
}

@test "disallow first strand longer" {
  skip
  run bash hamming.sh "AATG" "AAA"
  [ "$status" -eq 1 ]
  [ "$output" == "left and right strands must be of equal length" ]
}

@test "disallow second strand longer" {
  skip
  run bash hamming.sh "ATA" "AGTG"
  [ "$status" -eq 1 ]
  [ "$output" == "left and right strands must be of equal length" ]
}

@test "no input" {
  skip
  run bash hamming.sh
  [ "$status" -eq 1 ]
  [ "$output" == "Usage: hamming.sh <strand1> <strand2>" ]
}
