#!/usr/bin/env bash

# local version: 1.4.0.1
#
# additional tests for satisfiability of the goal

@test "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 4, goalBucket: one, otherBucket: 5"
    run bash two_bucket.sh 3 5 1 "one"
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 8, goalBucket: two, otherBucket: 3"
    run bash two_bucket.sh 3 5 1 "two"
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 14, goalBucket: one, otherBucket: 11"
    run bash two_bucket.sh 7 11 2 "one"
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 18, goalBucket: two, otherBucket: 7"
    run bash two_bucket.sh 7 11 2 "two"
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 1, goalBucket: two, otherBucket: 0"
    run bash two_bucket.sh 1 3 3 "two"
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 2, goalBucket: two, otherBucket: 2"
    run bash two_bucket.sh 2 3 3 "one"
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "Not possible to reach the goal" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash two_bucket.sh 6 15 5 "one"
    (( status == 1 ))
    [[ $output == *"invalid goal"* ]]
}

@test "With the same buckets but a different goal, then it is possible" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 10, goalBucket: two, otherBucket: 0"
    run bash two_bucket.sh 6 15 9 "one"
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "Goal larger than both buckets is impossible" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash two_bucket.sh 5 7 8 "one"
    (( status == 1 ))
    [[ $output == *"invalid goal"* ]]
}
