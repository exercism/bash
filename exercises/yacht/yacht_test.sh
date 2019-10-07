#!/usr/bin/env bash

# local version: 1.2.0.0

@test "Yacht" {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "yacht" 5 5 5 5 5
    [[ $status -eq 0 ]]
    [[ $output == "50" ]]
}

@test "Not Yacht" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "yacht" 1 3 3 2 5
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Ones" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "ones" 1 1 1 3 5
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test "Ones, out of order" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "ones" 3 1 1 5 1
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test "No ones" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "ones" 4 3 6 5 5
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Twos" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "twos" 2 3 4 5 6
    [[ $status -eq 0 ]]
    [[ $output == "2" ]]
}

@test "Fours" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "fours" 1 4 1 4 1
    [[ $status -eq 0 ]]
    [[ $output == "8" ]]
}

@test "Yacht counted as threes" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "threes" 3 3 3 3 3
    [[ $status -eq 0 ]]
    [[ $output == "15" ]]
}

@test "Yacht of 3s counted as fives" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "fives" 3 3 3 3 3
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Sixes" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "sixes" 2 3 4 5 6
    [[ $status -eq 0 ]]
    [[ $output == "6" ]]
}

@test "Full house two small, three big" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "full house" 2 2 4 4 4
    [[ $status -eq 0 ]]
    [[ $output == "16" ]]
}

@test "Full house three small, two big" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "full house" 5 3 3 5 3
    [[ $status -eq 0 ]]
    [[ $output == "19" ]]
}

@test "Two pair is not a full house" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "full house" 2 2 4 4 5
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Four of a kind is not a full house" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "full house" 1 4 4 4 4
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Yacht is not a full house" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "full house" 2 2 2 2 2
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Four of a Kind" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "four of a kind" 6 6 4 6 6
    [[ $status -eq 0 ]]
    [[ $output == "24" ]]
}

@test "Yacht can be scored as Four of a Kind" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "four of a kind" 3 3 3 3 3
    [[ $status -eq 0 ]]
    [[ $output == "12" ]]
}

@test "Full house is not Four of a Kind" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "four of a kind" 3 3 3 5 5
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Little Straight" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "little straight" 3 5 4 1 2
    [[ $status -eq 0 ]]
    [[ $output == "30" ]]
}

@test "Little Straight as Big Straight" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "big straight" 1 2 3 4 5
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Four in order but not a little straight" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "little straight" 1 1 2 3 4
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "No pairs but not a little straight" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "little straight" 1 2 3 4 6
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Minimum is 1, maximum is 5, but not a little straight" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "little straight" 1 1 3 4 5
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Big Straight" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "big straight" 4 6 2 5 3
    [[ $status -eq 0 ]]
    [[ $output == "30" ]]
}

@test "Big Straight as little straight" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "little straight" 6 5 4 3 2
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "No pairs but not a big straight" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "big straight" 6 5 4 3 1
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "Choice" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "choice" 3 3 5 6 6
    [[ $status -eq 0 ]]
    [[ $output == "23" ]]
}

@test "Yacht as choice" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash yacht.sh "choice" 2 2 2 2 2
    [[ $status -eq 0 ]]
    [[ $output == "10" ]]
}
