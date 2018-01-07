#!/usr/bin/env bats

@test "Cleans the number" {
  #skip
  run bash phone_number.sh "(223) 456-7890"
  [ "$status" -eq 0 ]
  [ "$output" = "2234567890" ]
}

@test "Cleans numbers with dots" {
  skip
  run bash phone_number.sh "223.456.7890"
  [ "$status" -eq 0 ]
  [ "$output" = "2234567890" ]
}

@test "Cleans numbers with multiple spaces" {
  skip
  run bash phone_number.sh "223 456   7890   "
  [ "$status" -eq 0 ]
  [ "$output" = "2234567890" ]
}

@test "Invalid when 9 digits" {
  skip
  run bash phone_number.sh "123456789"
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "Invalid when 11 digits does not start with 1" {
  skip
  run bash phone_number.sh "22234567890"
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "Valid when 11 digits and starting with 1" {
  skip
  run bash phone_number.sh "12234567890"
  [ "$status" -eq 0 ]
  [ "$output" = "2234567890" ]
}

@test "Valid when 11 digits and starting with 1 even with punctuation" {
  skip
  run bash phone_number.sh "+1 (223) 456-7890"
  [ "$status" -eq 0 ]
  [ "$output" = "2234567890" ]
}

@test "Invalid with more than 11 digits" {
  skip
  run bash phone_number.sh "321234567890"
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "Invalid with letters" {
  skip
  run bash phone_number.sh "123-abc-7890"
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "Invalid with punctuations" {
  skip
  run bash phone_number.sh "123-@:!-7890"
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "Invalid if area code does not start with 2-9" {
  skip
  run bash phone_number.sh "(123) 456-7890"
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}

@test "Invalid if exchange code does not start with 2-9" {
  skip
  run bash phone_number.sh "(223) 056-7890"
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]
}
