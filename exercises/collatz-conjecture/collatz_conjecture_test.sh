#!/usr/bin/env bats

@test "zero steps for one" {
  #skip
  run bash collatz_conjecture.sh 1
  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "divide if even" {
  skip
  run bash collatz_conjecture.sh 16
  [ "$status" -eq 0 ]
  [ "$output" -eq 4 ]
}

@test "even and odd steps" {
  skip
  run bash collatz_conjecture.sh 12
  [ "$status" -eq 0 ]
  [ "$output" -eq 9 ]
}

@test "large number of even and odd steps" {
  skip
  run bash collatz_conjecture.sh 1000000
  [ "$status" -eq 0 ]
  [ "$output" -eq 152 ]
}

@test "zero is an error" {
  skip
  run bash collatz_conjecture.sh 0
  [ "$status" -eq 1 ]
  [ "$output" == "Error: Only positive numbers are allowed" ]
}

@test "negative value is an error" {
  skip
  run bash collatz_conjecture.sh -15
  [ "$status" -eq 1 ]
  [ "$output" == "Error: Only positive numbers are allowed" ]
}

