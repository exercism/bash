#!/usr/bin/env bash

# local version: 1.0.0.0

# Output your triplets, comma-separated, one per line.


@test "triplets whose sum is 12" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash pythagorean_triplet.sh 12
    [[ $status -eq 0 ]]
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected="3,4,5"
    [[ $actual == "$expected" ]]
}

@test "triplets whose sum is 108" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash pythagorean_triplet.sh 108
    [[ $status -eq 0 ]]
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected="27,36,45"
    [[ $actual == "$expected" ]]
}

@test "triplets whose sum is 1000" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash pythagorean_triplet.sh 1000
    [[ $status -eq 0 ]]
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected="200,375,425"
    [[ $actual == "$expected" ]]
}

@test "no matching triplets for 1001" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash pythagorean_triplet.sh 1001
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "returns all matching triplets" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash pythagorean_triplet.sh 90
    [[ $status -eq 0 ]]
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$'9,40,41\n15,36,39'
    [[ $actual == "$expected" ]]
}

@test "several matching triplets" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash pythagorean_triplet.sh 840
    [[ $status -eq 0 ]]
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected="40,399,401
56,390,394
105,360,375
120,350,370
140,336,364
168,315,357
210,280,350
240,252,348"
    [[ $actual == "$expected" ]]
}

# This test is very time-consuming for a brute force solution.
# Uncomment and run only for extra credit (or punishment).

#@test "triplets for large number" {
#    [[ $BATS_RUN_SKIPPED = true ]] || skip
#    run bash pythagorean_triplet.sh 30000
#    [[ $status -eq 0 ]]
#    actual=$( sort -t, -n -k1,1 <<< "$output" )
#    expected="1200,14375,14425
#1875,14000,14125
#5000,12000,13000
#6000,11250,12750
#7500,10000,12500"
#    [[ $actual == "$expected" ]]
#}
