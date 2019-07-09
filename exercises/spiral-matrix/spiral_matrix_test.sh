#!/usr/bin/env bash

@test "empty spiral" {
    #[[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash spiral_matrix.sh 0
    expected=""
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "trivial spiral" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash spiral_matrix.sh 1
    expected="1"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "spiral of size 2" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash spiral_matrix.sh 2
    expected=$'1 2\n4 3'
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "spiral of size 3" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash spiral_matrix.sh 3
    expected=$'1 2 3\n8 9 4\n7 6 5'
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "spiral of size 4" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash spiral_matrix.sh 4
    expected="1 2 3 4
12 13 14 5
11 16 15 6
10 9 8 7"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "spiral of size 5" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash spiral_matrix.sh 5
    expected="1 2 3 4 5
16 17 18 19 6
15 24 25 20 7
14 23 22 21 8
13 12 11 10 9"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}
