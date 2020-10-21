#!/usr/bin/env bash

@test "root of 1" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh 1
    (( status == 0 ))
    [[ $output == "1" ]]
}

@test "root of 4" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "4"
    (( status == 0 ))
    [[ $output == "2" ]]
}

@test "root of 25" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "25"
    (( status == 0 ))
    [[ $output == "5" ]]
}

@test "root of 81" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "81"
    (( status == 0 ))
    [[ $output == "9" ]]
}

@test "root of 196" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "196"
    (( status == 0 ))
    [[ $output == "14" ]]
}

@test "root of 65025" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "65025"
    (( status == 0 ))
    [[ $output == "255" ]]
}
