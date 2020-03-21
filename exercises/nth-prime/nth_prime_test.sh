#!/usr/bin/env bash

# local version: 2.1.0.0

@test "first prime" {
    #[[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash nth_prime.sh 1
    (( status == 0 ))
    [[ $output == "2" ]]
}

@test "second prime" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash nth_prime.sh 2
    (( status == 0 ))
    [[ $output == "3" ]]
}

@test "sixth prime" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash nth_prime.sh 6
    (( status == 0 ))
    [[ $output == "13" ]]
}

@test "hundredth prime" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash nth_prime.sh 100
    (( status == 0 ))
    [[ $output == "541" ]]
}

@test "big prime" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash nth_prime.sh 10001
    (( status == 0 ))
    [[ $output == "104743" ]]
}

@test "there is no zeroth prime" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash nth_prime.sh 0
    (( status == 1 ))
    [[ $output == "invalid input" ]]
}

@test "there is no negativeth prime" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash nth_prime.sh -2
    (( status == 1 ))
    [[ $output == "invalid input" ]]
}
