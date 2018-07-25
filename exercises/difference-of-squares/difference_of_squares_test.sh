#!/usr/bin/env bats

# Version = 1.2.0

# Test to Square the sum of the numbers up to the given number
@test "square of sum 1" {
  #skip
  run bash difference_of_squares.sh 1 -S
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]
}

@test "square of sum 5" {
  skip
  run bash difference_of_squares.sh 5 -S
  [ "$status" -eq 0 ]
  [ "$output" = "225" ]
}

@test "square of sum 100" {
  skip
  run bash difference_of_squares.sh 100 -S
  [ "$status" -eq 0 ]
  [ "$output" = "25502500" ]
}

# Test to Sum the squares of the numbers up to the given number
@test "sum of squares 1" {
  skip
  run bash difference_of_squares.sh 1 -s
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]
}

@test "sum of squares 5" {
  skip
  run bash difference_of_squares.sh 5 -s
  [ "$status" -eq 0 ]
  [ "$output" = "55" ]
}

@test "sum of squares 100" {
  skip
  run bash difference_of_squares.sh 100 -s
  [ "$status" -eq 0 ]
  [ "$output" = "338350" ]
}

# Test to Subtract sum of squares from square of sums
@test "difference of squares 1" {
  skip
  run bash difference_of_squares.sh 1
  [ "$status" -eq 0 ]
  [ "$output" = "0" ]
}

@test "difference of squares 5" {
  skip
  run bash difference_of_squares.sh 5
  [ "$status" -eq 0 ]
  [ "$output" = "170" ]
}

@test "difference of squares 100" {
  skip
  run bash difference_of_squares.sh 100
  [ "$status" -eq 0 ]
  [ "$output" = "25164150" ]
}

