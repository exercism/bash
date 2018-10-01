#!/usr/bin/env bash

@test "cleans the number" {
  #skip
  run bash phone_number.sh "(223) 456-7890"
  [ "$status" -eq 0 ]
  [ "$output" == "2234567890" ]
}

@test "cleans numbers with dots" {
  skip
  run bash phone_number.sh "223.456.7890"
  [ "$status" -eq 0 ]
  [ "$output" == "2234567890" ]
}

@test "cleans numbers with multiple spaces" {
  skip
  run bash phone_number.sh "223 456   7890   "
  [ "$status" -eq 0 ]
  [ "$output" == "2234567890" ]
}

@test "invalid when 9 digits" {
  skip
  run bash phone_number.sh "123456789"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "invalid when 11 digits does not start with a 1" {
  skip
  run bash phone_number.sh "22234567890"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "valid when 11 digits and starting with 1" {
  skip
  run bash phone_number.sh "12234567890"
  [ "$status" -eq 0 ]
  [ "$output" == "2234567890" ]
}

@test "valid when 11 digits and starting with 1 even with punctuation" {
  skip
  run bash phone_number.sh "+1 (223) 456-7890"
  [ "$status" -eq 0 ]
  [ "$output" == "2234567890" ]
}

@test "invalid when more than 11 digits" {
  skip
  run bash phone_number.sh "321234567890"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "invalid with letters" {
  skip
  run bash phone_number.sh "123-abc-7890"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "invalid with punctuations" {
  skip
  run bash phone_number.sh "123-@:!-7890"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "invalid if area code starts with 0" {
  skip
  run bash phone_number.sh "(023) 456-7890"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "invalid if area code starts with 1" {
  skip
  run bash phone_number.sh "(123) 456-7890"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "invalid if exchange code starts with 0" {
  skip
  run bash phone_number.sh "(223) 056-7890"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "invalid if exchange code starts with 1" {
  skip
  run bash phone_number.sh "(223) 156-7890"
  [ "$status" -eq 1 ]
  [ "$output" == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

