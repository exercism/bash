#!/usr/bin/env bats

@test "Square 1" {
  #skip
  run bash grains.sh 1
  [ "$status" -eq 0 ]
  [ "$output" == "1" ]
}

@test "Square 2" {
  skip
  run bash grains.sh 2
  [ "$status" -eq 0 ]
  [ "$output" == "2" ]
}

@test "Square 3" {
  skip
  run bash grains.sh 3
  [ "$status" -eq 0 ]
  [ "$output" == "4" ]
}

@test "Square 4" {
  skip
  run bash grains.sh 4
  [ "$status" -eq 0 ]
  [ "$output" == "8" ]
}

@test "Square 16" {
  skip
  run bash grains.sh 16
  [ "$status" -eq 0 ]
  [ "$output" == "32768" ]
}

@test "Square 32" {
  skip
  run bash grains.sh 32
  [ "$status" -eq 0 ]
  [ "$output" == "2147483648" ]
}

@test "Square 64" {
  skip
  run bash grains.sh 64
  [ "$status" -eq 0 ]
  [ "$output" == "9223372036854775808" ]
}

@test "Square 0 raises an exception" {
  skip
  run bash grains.sh 0
  [ "$status" -eq 1 ]
  [ "$output" == "Error: invalid input" ]
}

@test "Negative square raises an exception" {
  skip
  run bash grains.sh -1
  [ "$status" -eq 1 ]
  [ "$output" == "Error: invalid input" ]
}

@test "Square greater than 64 raises an exception" {
  skip
  run bash grains.sh 65
  [ "$status" -eq 1 ]
  [ "$output" == "Error: invalid input" ]
}

@test "returns the total number of grains on the board" {
  skip
  run bash grains.sh -A
  [ "$status" -eq 0 ]
  [ "$output" == "18446744073709551615" ]
}

