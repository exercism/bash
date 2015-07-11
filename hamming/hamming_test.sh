@test "Short identical strands have hamming distance of zero" {
  run ./hamming.sh C C

  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "Long identical strands have hamming distance of zero" {
  run ./hamming.sh CATSCATS CATSCATS

  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "Single char different strings have hamming distance of one" {
  run ./hamming.sh C A

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "Distance with all chars different in small strings" {
  run ./hamming.sh GC AT

  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ]
}

@test "small distance with small strands" {
  run ./hamming.sh GC GT

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "small distance" {
  run ./hamming.sh GGACG GGTCG

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "small distance in long strands" {
  run ./hamming.sh ACCAGGG ACTATGG

  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ]
}

@test "non unique char in first strand" {
  run ./hamming.sh AGA AGG

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "non unique char in second strand" {
  run ./hamming.sh AGG AGA

  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test "large distance" {
  run ./hamming.sh GATACA GCATAA

  [ "$status" -eq 0 ]
  [ "$output" -eq 4 ]
}

@test "large distance in off by one strand" {
  run ./hamming.sh GGACGGATTCTG AGGACGGATTCT

  [ "$status" -eq 0 ]
  [ "$output" -eq 9 ]
}

@test "empty strands" {
  run ./hamming.sh "" ""

  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "first string longer" {
  run ./hamming.sh AGT AG

  [ "$status" -eq 1 ]
  [ "$output" = "The two strands must have the same length." ]
}

@test "second string longer" {
  run ./hamming.sh AGT AGTC

  [ "$status" -eq 1 ]
  [ "$output" = "The two strands must have the same length." ]
}

@test "no input" {
  run ./hamming.sh

  [ "$status" -eq 1 ]
  [ "$output" = "Usage: ./hamming.sh <string1> <string2>" ]
}
