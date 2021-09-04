#!/usr/bin/env bash
load bats-extra.bash

# local version: 2.3.0.0

@test 'single bit to one decimal' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1" 10
    assert_success
    assert_output "1"
}

@test 'binary to single decimal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1" 10
    assert_success
    assert_output "5"
}

@test 'single decimal to binary' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "5" 2
    assert_success
    assert_output "1 0 1"
}

@test 'binary to multiple decimal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 10
    assert_success
    assert_output "4 2"
}

@test 'decimal to binary' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "4 2" 2
    assert_success
    assert_output "1 0 1 0 1 0"
}

@test 'trinary to hexadecimal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 3 "1 1 2 0" 16
    assert_success
    assert_output "2 10"
}

@test 'hexadecimal to trinary' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 16 "2 10" 3
    assert_success
    assert_output "1 1 2 0"
}

@test '15 bit integer' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 97 "3 46 60" 73
    assert_success
    assert_output "6 10 45"
}

@test 'empty list' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "" 10
    assert_success
    assert_output ""
}

@test 'single zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "0" 2
    assert_success
    assert_output ""
}

@test 'multiple zeroes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "0 0 0" 2
    assert_success
    assert_output ""
}

@test 'leading zeros' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 7 "0 6 0" 10
    assert_success
    assert_output "4 2"
}

@test 'input base is one' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 1 "0" 10
    assert_failure
    assert_output    # there is _some_ output
}

@test 'input base is zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 0 "" 10
    assert_failure
    assert_output    # there is _some_ output
}

@test 'input base is negative' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh -2 "1" 10
    assert_failure
    assert_output    # there is _some_ output
}

@test 'negative digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 -1 1 0 1 0" 10
    assert_failure
    assert_output    # there is _some_ output
}

@test 'invalid positive digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 2 1 0 1 0" 10
    assert_failure
    assert_output    # there is _some_ output
}

@test 'output base is one' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 1
    assert_failure
    assert_output    # there is _some_ output
}

@test 'output base is zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "7" 0
    assert_failure
    assert_output    # there is _some_ output
}

@test 'output base is negative' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1" -7
    assert_failure
    assert_output    # there is _some_ output
}

@test 'both bases are negative' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh -2 "1" -7
    assert_failure
    assert_output    # there is _some_ output
}
