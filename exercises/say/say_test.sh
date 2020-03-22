#!/usr/bin/env bash

# local version: 1.2.0.0

@test zero {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 0
    (( status == 0 ))
    [[ $output == "zero" ]]
}

@test one {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 1
    (( status == 0 ))
    [[ $output == "one" ]]
}

@test fourteen {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 14
    (( status == 0 ))
    [[ $output == "fourteen" ]]
}

@test twenty {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 20
    (( status == 0 ))
    [[ $output == "twenty" ]]
}

@test "twenty-two" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 22
    (( status == 0 ))
    [[ $output == "twenty-two" ]]
}

@test "one hundred" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 100
    (( status == 0 ))
    [[ $output == "one hundred" ]]
}

@test "one hundred twenty-three" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 123
    (( status == 0 ))
    [[ $output == "one hundred twenty-three" ]]
}

@test "one thousand" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 1000
    (( status == 0 ))
    [[ $output == "one thousand" ]]
}

@test "one thousand two hundred thirty-four" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 1234
    (( status == 0 ))
    [[ $output == "one thousand two hundred thirty-four" ]]
}

@test "one million" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 1000000
    (( status == 0 ))
    [[ $output == "one million" ]]
}

@test "one million two thousand three hundred forty-five" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 1002345
    (( status == 0 ))
    [[ $output == "one million two thousand three hundred forty-five" ]]
}

@test "one billion" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 1000000000
    (( status == 0 ))
    [[ $output == "one billion" ]]
}

@test "a big number" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh  987654321123
    (( status == 0 ))
    [[ $output == "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three" ]]
}

@test "numbers below zero are out of range" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh -1
    (( status == 1 ))
    [[ $output == "input out of range" ]]
}

@test "numbers above 999,999,999,999 are out of range" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash say.sh 1000000000000
    (( status == 1 ))
    [[ $output == "input out of range" ]]
}
