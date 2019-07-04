#!/usr/bin/env bash

@test 'single bit to one decimal' {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1" ]]
}

@test 'binary to single decimal' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 0 1" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "5" ]]
}

@test 'single decimal to binary' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "5" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 0 1" ]]
}

@test 'binary to multiple decimal' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "4 2" ]]
}

@test 'decimal to binary' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "4 2" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 0 1 0 1 0" ]]
}

@test 'trinary to hexadecimal' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 3 "1 1 2 0" 16
    [[ "$status" -eq 0 ]]
    [[ "$output" == "2 10" ]]
}

@test 'hexadecimal to trinary' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 16 "2 10" 3
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 1 2 0" ]]
}

@test '15 bit integer' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 97 "3 46 60" 73
    [[ "$status" -eq 0 ]]
    [[ "$output" == "6 10 45" ]]
}

@test 'empty list' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'single zero' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "0" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'multiple zeroes' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "0 0 0" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'leading zeros' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 7 "0 6 0" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "4 2" ]]
}

@test 'input base is one' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 1 "0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'input base is zero' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 0 "" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'input base is negative' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh -2 "1" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'negative digit' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 -1 1 0 1 0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'invalid positive digit' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 2 1 0 1 0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output base is one' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 1
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output base is zero' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "7" 0
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output base is negative' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1" -7
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'both bases are negative' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh -2 "1" -7
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}
