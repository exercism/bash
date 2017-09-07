#!/usr/bin/env bats

@test "Short identical strands have hamming distance of zero" {
  run bash hamming.sh C C

  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "Long identical strands have hamming distance of zero" {
  skip
  run bash hamming.sh CATGCATG CATGCATG

  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "Single char different strings have hamming distance of one" {
  skip
  run bash hamming.sh C A

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "Distance with all chars different in small strings" {
  skip
  run bash hamming.sh GC AT

  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ]
}

@test "small distance with small strands" {
  skip
  run bash hamming.sh GC GT

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "small distance" {
  skip
  run bash hamming.sh GGACG GGTCG

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "small distance in long strands" {
  skip
  run bash hamming.sh ACCAGGG ACTATGG

  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ]
}

@test "non unique char in first strand" {
  skip
  run bash hamming.sh AGA AGG

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "non unique char in second strand" {
  skip
  run bash hamming.sh AGG AGA

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "large distance" {
  skip
  run bash hamming.sh GATACA GCATAA

  [ "$status" -eq 0 ]
  [ "$output" -eq 4 ]
}

@test "large distance in off by one strand" {
  skip
  run bash hamming.sh GGACGGATTCTG AGGACGGATTCT

  [ "$status" -eq 0 ]
  [ "$output" -eq 9 ]
}

@test "empty strands" {
  skip
  run bash hamming.sh "" ""

  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "first string longer" {
  skip
  run bash hamming.sh AGT AG

  [ "$status" -eq 1 ]
  [ "$output" = "The two strands must have the same length." ]
}

@test "second string longer" {
  skip
  run bash hamming.sh AGT AGTC

  [ "$status" -eq 1 ]
  [ "$output" = "The two strands must have the same length." ]
}

@test "no input" {
  skip
  run bash hamming.sh

  [ "$status" -eq 1 ]
  [ "$output" = "Usage: hamming.sh <string1> <string2>" ]
}
