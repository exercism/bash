#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_missed_target() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh -9 9
    assert_success
    assert_output "0"
}

test_on_the_outer_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 0 10
    assert_success
    assert_output "1"
}

test_on_the_middle_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh -5 0
    assert_success
    assert_output "5"
}

test_on_the_inner_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 0 -1
    assert_success
    assert_output "10"
}

test_exactly_on_center() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 0 0
    assert_success
    assert_output "10"
}

test_near_the_center() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh -0.1 -0.1
    assert_success
    assert_output "10"
}

test_just_within_the_inner_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 0.7 0.7
    assert_success
    assert_output "10"
}

test_just_outside_the_inner_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 0.8 -0.8
    assert_success
    assert_output "5"
}

test_just_within_the_middle_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh -3.5 3.5
    assert_success
    assert_output "5"
}

test_just_outside_the_middle_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh -3.6 -3.6
    assert_success
    assert_output "1"
}

test_just_within_the_outer_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh -7.0 7.0
    assert_success
    assert_output "1"
}

test_just_outside_the_outer_circle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 7.1 -7.1
    assert_success
    assert_output "0"
}

test_asymmetric_position_between_the_inner_and_middle_circles() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 0.5 -4
    assert_success
    assert_output "5"
}

# bash-specific test: Input validation

test_invalid_args_no_args() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh
    assert_failure
    assert_output    # there is _some_ output
}

test_invalid_args_only_1_arg() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 10
    assert_failure
    assert_output    # there is _some_ output
}

test_invalid_args_first_arg_non-numeric() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh foo 10
    assert_failure
    assert_output    # there is _some_ output
}

test_invalid_args_second_arg_non-numeric() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash darts.sh 10 bar5
    assert_failure
    assert_output    # there is _some_ output
}
