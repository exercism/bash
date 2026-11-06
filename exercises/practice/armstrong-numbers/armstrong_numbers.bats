#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T04:26:49+00:00

test_zero_is_an_armstrong_number() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 0
    assert_success
    assert_output "true"
}

test_single_digit_numbers_are_armstrong_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 5
    assert_success
    assert_output "true"
}

test_there_are_no_two_digit_armstrong_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 10
    assert_success
    assert_output "false"
}

test_three_digit_number_that_is_an_armstrong_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 153
    assert_success
    assert_output "true"
}

test_three_digit_number_that_is_not_an_armstrong_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 100
    assert_success
    assert_output "false"
}

test_four_digit_number_that_is_an_armstrong_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 9474
    assert_success
    assert_output "true"
}

test_four_digit_number_that_is_not_an_armstrong_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 9475
    assert_success
    assert_output "false"
}

test_seven_digit_number_that_is_an_armstrong_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 9926315
    assert_success
    assert_output "true"
}

test_seven_digit_number_that_is_not_an_armstrong_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash armstrong_numbers.sh 9926314
    assert_success
    assert_output "false"
}
