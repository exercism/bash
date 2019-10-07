#!/usr/bin/env bash

# local version: 1.4.0.0

@test "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one" {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="moves: 4, goalBucket: one, otherBucket: 5"
    run bash two_bucket.sh 3 5 1 "one"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="moves: 8, goalBucket: two, otherBucket: 3"
    run bash two_bucket.sh 3 5 1 "two"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="moves: 14, goalBucket: one, otherBucket: 11"
    run bash two_bucket.sh 7 11 2 "one"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="moves: 18, goalBucket: two, otherBucket: 7"
    run bash two_bucket.sh 7 11 2 "two"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="moves: 1, goalBucket: two, otherBucket: 0"
    run bash two_bucket.sh 1 3 3 "two"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected="moves: 2, goalBucket: two, otherBucket: 2"
    run bash two_bucket.sh 2 3 3 "one"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

# error cases
@test "goal is too big for the buckets" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash two_bucket.sh 1 2 3 "one"
    [[ $status -ne 0 ]]
    [[ $output == *"invalid goal"* ]]
}

@test "cannot satisfy the goal" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash two_bucket.sh 6 8 3 "one"
    [[ $status -ne 0 ]]
    [[ $output == *"invalid goal"* ]]
}
