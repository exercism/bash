#!/usr/bin/env bats
load bats-extra

# local version: 1.0.0.0

@test "slices of one from one" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="1"
    run bash series.sh 1 1
    assert_success
    assert_output "$expected"
}

@test "slices of one from two" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="1 2"
    run bash series.sh 12 1
    assert_success
    assert_output "$expected"
}

@test "slices of two" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="35"
    run bash series.sh 35 2
    assert_success
    assert_output "$expected"
}

@test "slices of two overlap" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="91 14 42"
    run bash series.sh 9142 2
    assert_success
    assert_output "$expected"
}

@test "slices can include duplicates" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="777 777 777 777"
    run bash series.sh 777777 3
    assert_success
    assert_output "$expected"
}

@test "slices of a long series" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="91849 18493 84939 49390 93904 39042 90424 04243"
    run bash series.sh 918493904243 5
    assert_success
    assert_output "$expected"
}

@test "slice length is too large" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="slice length cannot be greater than series length"
    run bash series.sh 12345 6
    assert_failure
    assert_output --partial "$expected"
}

@test "slice length is way too large" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="slice length cannot be greater than series length"
    run bash series.sh 12345 42
    assert_failure
    assert_output --partial "$expected"
}

@test "slice length cannot be zero" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="slice length cannot be zero"
    run bash series.sh 12345 0
    assert_failure
    assert_output --partial "$expected"
}

@test "slice length cannot be negative" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="slice length cannot be negative"
    run bash series.sh 123 -1
    assert_failure
    assert_output --partial "$expected"
}

@test "empty series is invalid" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="series cannot be empty"
    run bash series.sh "" 1
    assert_failure
    assert_output --partial "$expected"
}
