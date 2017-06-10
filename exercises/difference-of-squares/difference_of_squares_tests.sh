#!/usr/bin/env bats

@test "square of sum 1" {
    source difference-of-squares.sh
    run squareOfSum 1
    [ "$status" -eq 0 ]
    [ "$output" = "1" ]
}

@test "square of sum 5" {
    skip
    source difference-of-squares.sh
    run squareOfSum 5
    [ "$status" -eq 0 ]
    [ "$output" = "225" ]
}

@test "square of sum 100" {
    skip
    source difference-of-squares.sh
    run squareOfSum 100
    [ "$status" -eq 0 ]
    [ "$output" = "25502500" ]
}

@test "sum of squares 1" {
    skip
    source difference-of-squares.sh
    run sumOfSquares 1
    [ "$status" -eq 0 ]
    [ "$output" = "1" ]
}

@test "sum of squares 5" {
    skip
    source difference-of-squares.sh
    run sumOfSquares 5
    [ "$status" -eq 0 ]
    [ "$output" = "55" ]
}

@test "sum of squares 100" {
    skip
    source difference-of-squares.sh
    run sumOfSquares 100
    [ "$status" -eq 0 ]
    [ "$output" = "338350" ]
}

@test "difference of squares 1" {
    skip
    source difference-of-squares.sh
    run differenceOfSquares 1
    [ "$status" -eq 0 ]
    [ "$output" = "0" ]
}

@test "difference of squares 5" {
    skip
    source difference-of-squares.sh
    run differenceOfSquares 5
    [ "$status" -eq 0 ]
    [ "$output" = "170" ]
}

@test "difference of squares 100" {
    skip
    source difference-of-squares.sh
    run differenceOfSquares 100
    [ "$status" -eq 0 ]
    [ "$output" = "25164150" ]
}

