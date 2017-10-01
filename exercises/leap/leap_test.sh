#!/usr/bin/env bats

@test "Leap year should return leap year" {
  #skip
  run ./leap.sh 1996

  [ "$status" -eq 0 ]
  [ "$output" = "This is a leap year." ]
}

@test 'Non-leap year should return non-leap year' {
  skip
  run ./leap.sh 1997

  [ "$status" -eq 0 ]
  [ "$output" = "This is not a leap year." ]
}

@test 'Non-leap even year should return non-leap year' {
  skip
  run ./leap.sh 1998

  [ "$status" -eq 0 ]
  [ "$output" = "This is not a leap year." ]
}

@test 'Century non-leap year should return non-leap year' {
  skip
  run ./leap.sh 1900

  [ "$status" -eq 0 ]
  [ "$output" = "This is not a leap year." ]
}

@test 'Fourth century should return leap year' {
  skip
  run ./leap.sh 2400

  [ "$status" -eq 0 ]
  [ "$output" = "This is a leap year." ]
}

@test 'Y2K should return leap year' {
  skip
  run ./leap.sh 2000

  [ "$status" -eq 0 ]
  [ "$output" = "This is a leap year." ]
}

@test 'No input should return an error' {
  skip
  run ./leap.sh

  [ "$status" -eq 1 ]
  [ "$output" = "Usage: leap.sh <year>" ]
}

@test 'Too much input should return an error' {
  skip
  run ./leap.sh 2016 4562 4566

  [ "$status" -eq 1 ]
  [ "$output" = "Usage: leap.sh <year>" ]
}

@test 'Float number input should return an error' {
  skip
  run ./leap.sh 2016.54

  [ "$status" -eq 1 ]
  [ "$output" = "Usage: leap.sh <year>" ]
}

@test 'Alpha input should return an error' {
  skip
  run ./leap.sh abcd

  [ "$status" -eq 1 ]
  [ "$output" = "Usage: leap.sh <year>" ]
}
