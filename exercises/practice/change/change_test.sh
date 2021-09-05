#!/usr/bin/env bash
load bats-extra

# local version: 1.3.0.0

@test "change for 1 cent" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="1"
    coins=(1 5 10 25)
    run bash change.sh 1 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "single coin change" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="25"
    coins=(1 5 10 25 100)
    run bash change.sh 25 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "multiple coin change" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="5 10"
    coins=(1 5 10 25 100)
    run bash change.sh 15 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "change with Lilliputian Coins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="4 4 15"
    coins=(1 4 15 20 50)
    run bash change.sh 23 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "change with Lower Elbonia Coins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="21 21 21"
    coins=(1 5 10 21 25)
    run bash change.sh 63 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "large target values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 2 5 20 20 50 100 100 100 100 100 100 100 100 100"
    coins=(1 2 5 10 20 50 100)
    run bash change.sh 999 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "possible change without unit coins available" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 2 2 5 10"
    coins=(2 5 10 20 50)
    run bash change.sh 21 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "another possible change without unit coins available" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="4 4 4 5 5 5"
    coins=(4 5)
    run bash change.sh 27 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "no coins make 0 change" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=""
    coins=(1 5 10 21 25)
    run bash change.sh 0 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

@test "error testing for change smaller than the smallest of coins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="can't make target with given coins"
    coins=(5 10)
    run bash change.sh 3 "${coins[@]}"
    assert_failure
    assert_output --partial "$expected"
}

@test "error if no combination can add up to target" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="can't make target with given coins"
    coins=(5 10)
    run bash change.sh 94 "${coins[@]}"
    assert_failure
    assert_output --partial "$expected"
}

@test "cannot find negative change values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="target can't be negative"
    coins=(1 2 5)
    run bash change.sh -5 "${coins[@]}"
    assert_failure
    assert_output --partial "$expected"
}
