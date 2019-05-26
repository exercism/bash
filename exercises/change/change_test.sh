#!/usr/bin/env bash


@test "single coin change" {
    #skip
    expected="25"
    coins=(1 5 10 25 100)
    run bash change.sh 25 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "multiple coin change" {
    skip
    expected="5 10"
    coins=(1 5 10 25 100)
    run bash change.sh 15 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "change with Lilliputian Coins" {
    skip
    expected="4 4 15"
    coins=(1 4 15 20 50)
    run bash change.sh 23 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "change with Lower Elbonia Coins" {
    skip
    expected="21 21 21"
    coins=(1 5 10 21 25)
    run bash change.sh 63 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "large target values" {
    skip
    expected="2 2 5 20 20 50 100 100 100 100 100 100 100 100 100"
    coins=(1 2 5 10 20 50 100)
    run bash change.sh 999 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "possible change without unit coins available" {
    skip
    expected="2 2 2 5 10"
    coins=(2 5 10 20 50)
    run bash change.sh 21 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "another possible change without unit coins available" {
    skip
    expected="4 4 4 5 5 5"
    coins=(4 5)
    run bash change.sh 27 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "no coins make 0 change" {
    skip
    expected=""
    coins=(1 5 10 21 25)
    run bash change.sh 0 "${coins[@]}"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "error testing for change smaller than the smallest of coins" {
    skip
    expected="can't make target with given coins"
    coins=(5 10)
    run bash change.sh 3 "${coins[@]}"
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

@test "error if no combination can add up to target" {
    skip
    expected="can't make target with given coins"
    coins=(5 10)
    run bash change.sh 94 "${coins[@]}"
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

@test "cannot find negative change values" {
    skip
    expected="target can't be negative"
    coins=(1 2 5)
    run bash change.sh -5 "${coins[@]}"
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

