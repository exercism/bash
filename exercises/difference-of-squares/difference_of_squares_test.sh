#!/usr/bin/env bats

@test 'difference of squares 1' {
    run bash difference_of_squares.sh 1

    [ "$status" -eq 0 ]
    [ "$output" == 0 ]
}

@test 'difference of squares 5' {
    run bash difference_of_squares.sh 5

    [ "$status" -eq 0 ]
    [ "$output" == 170 ]
}

@test 'difference of squares 100' {
    run bash difference_of_squares.sh 100

    [ "$status" -eq 0 ]
    [ "$output" == 25164150 ]
}

