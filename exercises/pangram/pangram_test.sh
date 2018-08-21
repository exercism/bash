#!/usr/bin/env bash

# Check if the given string is a pangram

@test "sentence empty" {
  #skip
  run bash pangram.sh ""
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "recognizes a perfect lower case pangram" {
  skip
  run bash pangram.sh "abcdefghijklmnopqrstuvwxyz"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "pangram with only lower case" {
  skip
  run bash pangram.sh "the quick brown fox jumps over the lazy dog"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "missing character 'x'" {
  skip
  run bash pangram.sh "a quick movement of the enemy will jeopardize five gunboats"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "another missing character, e.g. 'h'" {
  skip
  run bash pangram.sh "five boxing wizards jump quickly at it"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "pangram with underscores" {
  skip
  run bash pangram.sh "the_quick_brown_fox_jumps_over_the_lazy_dog"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "pangram with numbers" {
  skip
  run bash pangram.sh "the 1 quick brown fox jumps over the 2 lazy dogs"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "missing letters replaced by numbers" {
  skip
  run bash pangram.sh "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "pangram with mixed case and punctuation" {
  skip
  run bash pangram.sh "\"Five quacking Zephyrs jolt my wax bed.\""
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "upper and lower case versions of the same character should not be counted separately" {
  skip
  run bash pangram.sh "the quick brown fox jumps over with lazy FX"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

