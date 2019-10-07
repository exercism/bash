#!/usr/bin/env bash

# local version: 1.3.0.0


@test "single coin change" {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="25"
    coins=(1 5 10 25 100)
    run bash change.sh 25 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "multiple coin change" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="5 10"
    coins=(1 5 10 25 100)
    run bash change.sh 15 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "change with Lilliputian Coins" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="4 4 15"
    coins=(1 4 15 20 50)
    run bash change.sh 23 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "change with Lower Elbonia Coins" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="21 21 21"
    coins=(1 5 10 21 25)
    run bash change.sh 63 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "large target values" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="2 2 5 20 20 50 100 100 100 100 100 100 100 100 100"
    coins=(1 2 5 10 20 50 100)
    run bash change.sh 999 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "possible change without unit coins available" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="2 2 2 5 10"
    coins=(2 5 10 20 50)
    run bash change.sh 21 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "another possible change without unit coins available" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="4 4 4 5 5 5"
    coins=(4 5)
    run bash change.sh 27 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "no coins make 0 change" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected=""
    coins=(1 5 10 21 25)
    run bash change.sh 0 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "error testing for change smaller than the smallest of coins" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="can't make target with given coins"
    coins=(5 10)
    run bash change.sh 3 "${coins[@]}"
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

@test "error if no combination can add up to target" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="can't make target with given coins"
    coins=(5 10)
    run bash change.sh 94 "${coins[@]}"
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

@test "cannot find negative change values" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="target can't be negative"
    coins=(1 2 5)
    run bash change.sh -5 "${coins[@]}"
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

