#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_zero_steps_for_one() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash collatz_conjecture.sh 1
    assert_success
    assert_output "0"
}

test_divide_if_even() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash collatz_conjecture.sh 16
    assert_success
    assert_output "4"
}

test_even_and_odd_steps() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash collatz_conjecture.sh 12
    assert_success
    assert_output "9"
}

test_large_number_of_even_and_odd_steps() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash collatz_conjecture.sh 1000000
    assert_success
    assert_output "152"
}

test_zero_is_an_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash collatz_conjecture.sh 0
    assert_failure
    assert_output "Error: Only positive integers are allowed"
}

test_negative_value_is_an_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash collatz_conjecture.sh -15
    assert_failure
    assert_output "Error: Only positive integers are allowed"
}
