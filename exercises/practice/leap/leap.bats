#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T22:03:12+00:00

test_year_not_divisible_by_4_in_common_year() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 2015

    assert_success
    assert_output "false"
}

test_year_divisible_by_2_not_divisible_by_4_in_common_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 1970

    assert_success
    assert_output "false"
}

test_year_divisible_by_4_not_divisible_by_100_in_leap_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 1996

    assert_success
    assert_output "true"
}

test_year_divisible_by_4_and_5_is_still_a_leap_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 1960

    assert_success
    assert_output "true"
}

test_year_divisible_by_100_not_divisible_by_400_in_common_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 2100

    assert_success
    assert_output "false"
}

test_year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 1900

    assert_success
    assert_output "false"
}

test_year_divisible_by_400_is_leap_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 2000

    assert_success
    assert_output "true"
}

test_year_divisible_by_400_but_not_by_125_is_still_a_leap_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 2400

    assert_success
    assert_output "true"
}

test_year_divisible_by_200_not_divisible_by_400_in_common_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 1800

    assert_success
    assert_output "false"
}

test_no_input_should_return_an_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh

    assert_failure
    assert_output "Usage: leap.sh <year>"
}

test_too_many_arguments_should_return_an_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 2016 4562 4566

    assert_failure
    assert_output "Usage: leap.sh <year>"
}

test_float_number_input_should_return_an_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 2016.54

    assert_failure
    assert_output "Usage: leap.sh <year>"
}

test_alpha_input_should_return_an_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash leap.sh 'abcd'

    assert_failure
    assert_output "Usage: leap.sh <year>"
}
