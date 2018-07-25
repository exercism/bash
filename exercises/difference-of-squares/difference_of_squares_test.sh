#!/usr/bin/env bats

# Square the sum of the numbers up to the given number
@test "square of sum 1" {
  skip
  run bash difference_of_squares.sh square_of_sum 1
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]
}

@test "square of sum 5" {
  skip
  run bash difference_of_squares.sh square_of_sum 5
  [ "$status" -eq 0 ]
  [ "$output" = "225" ]
}

@test "square of sum 100" {
  skip
  run bash difference_of_squares.sh square_of_sum 100
  [ "$status" -eq 0 ]
  [ "$output" = "25502500" ]
}
# Sum the squares of the numbers up to the given number
@test "sum of squares 1" {
  skip
  run bash difference_of_squares.sh sum_of_squares 1
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]
}

@test "sum of squares 5" {
  skip
  run bash difference_of_squares.sh sum_of_squares 5
  [ "$status" -eq 0 ]
  [ "$output" = "55" ]
}

@test "sum of squares 100" {
  skip
  run bash difference_of_squares.sh sum_of_squares 100
  [ "$status" -eq 0 ]
  [ "$output" = "338350" ]
}
# Subtract sum of squares from square of sums
@test "difference of squares 1" {
  skip
  run bash difference_of_squares.sh difference_of_squares 1
  [ "$status" -eq 0 ]
  [ "$output" = "0" ]
}

@test "difference of squares 5" {
  skip
  run bash difference_of_squares.sh difference_of_squares 5
  [ "$status" -eq 0 ]
  [ "$output" = "170" ]
}

@test "difference of squares 100" {
  skip
  run bash difference_of_squares.sh difference_of_squares 100
  [ "$status" -eq 0 ]
  [ "$output" = "25164150" ]
}

