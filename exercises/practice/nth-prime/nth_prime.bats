#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_first_prime() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 1
    assert_success
    assert_output "2"
}

test_second_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 2
    assert_success
    assert_output "3"
}

test_sixth_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 6
    assert_success
    assert_output "13"
}

test_big_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 10001
    assert_success
    assert_output "104743"
}

test_there_is_no_zeroth_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 0
    assert_failure
    assert_output "invalid input"
}
