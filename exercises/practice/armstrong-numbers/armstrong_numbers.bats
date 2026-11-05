#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-05T22:34:09+00:00

function zero_is_an_armstrong_number { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 0
    assert_success
    assert_output "true"
}

function single_digit_numbers_are_armstrong_numbers { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 5
    assert_success
    assert_output "true"
}

function there_are_no_two_digit_armstrong_numbers { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 10
    assert_success
    assert_output "false"
}

function three_digit_number_that_is_an_armstrong_number { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 153
    assert_success
    assert_output "true"
}

function three_digit_number_that_is_not_an_armstrong_number { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 100
    assert_success
    assert_output "false"
}

function four_digit_number_that_is_an_armstrong_number { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 9474
    assert_success
    assert_output "true"
}

function four_digit_number_that_is_not_an_armstrong_number { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 9475
    assert_success
    assert_output "false"
}

function seven_digit_number_that_is_an_armstrong_number { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 9926315
    assert_success
    assert_output "true"
}

function seven_digit_number_that_is_not_an_armstrong_number { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 9926314
    assert_success
    assert_output "false"
}
