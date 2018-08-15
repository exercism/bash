#!/usr/bin/env bats

# Check if the given string is an isogram

@test "empty string" {
  #skip
  run bash isogram.sh ""
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "isogram with only lower case characters" {
  skip
  run bash isogram.sh "isogram"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "word with one duplicated character" {
  skip
  run bash isogram.sh "eleven"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "word with one duplicated character from the end of the alphabet" {
  skip
  run bash isogram.sh "zzyzx"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "longest reported english isogram" {
  skip
  run bash isogram.sh "subdermatoglyphic"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "word with duplicated character in mixed case" {
  skip
  run bash isogram.sh "Alphabet"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "hypothetical isogrammic word with hyphen" {
  skip
  run bash isogram.sh "thumbscrew-japingly"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "isogram with duplicated hyphen" {
  skip
  run bash isogram.sh "six-year-old"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "made-up name that is an isogram" {
  skip
  run bash isogram.sh "Emily Jung Schwartzkopf"
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "duplicated character in the middle" {
  skip
  run bash isogram.sh "accentor"
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

