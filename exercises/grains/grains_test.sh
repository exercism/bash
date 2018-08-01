#!/usr/bin/env bats

@test "1" {
  #skip
  run bash grains.sh 1
  [ "$status" -eq 0 ]
  [ "$output" == "1" ]
}

@test "2" {
  skip
  run bash grains.sh 2
  [ "$status" -eq 0 ]
  [ "$output" == "2" ]
}

@test "3" {
  skip
  run bash grains.sh 3
  [ "$status" -eq 0 ]
  [ "$output" == "4" ]
}

@test "4" {
  skip
  run bash grains.sh 4
  [ "$status" -eq 0 ]
  [ "$output" == "8" ]
}

@test "16" {
  skip
  run bash grains.sh 16
  [ "$status" -eq 0 ]
  [ "$output" == "32768" ]
}

@test "32" {
  skip
  run bash grains.sh 32
  [ "$status" -eq 0 ]
  [ "$output" == "2147483648" ]
}

@test "64" {
  skip
  run bash grains.sh 64
  [ "$status" -eq 0 ]
  [ "$output" == "9223372036854775808" ]
}

@test "square 0 raises an exception" {
  skip
  run bash grains.sh 0
  [ "$status" -eq 1 ]
  [ "$output" == "Error: invalid input" ]
}

@test "negative square raises an exception" {
  skip
  run bash grains.sh -1
  [ "$status" -eq 1 ]
  [ "$output" == "Error: invalid input" ]
}

@test "square greater than 64 raises an exception" {
  skip
  run bash grains.sh 65
  [ "$status" -eq 1 ]
  [ "$output" == "Error: invalid input" ]
}

@test "returns the total number of grains on the board" {
  skip
  run bash grains.sh total
  [ "$status" -eq 0 ]
  [ "$output" == "18446744073709551615" ]
}

