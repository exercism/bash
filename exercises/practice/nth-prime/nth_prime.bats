#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test "first prime" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 1
    assert_success
    assert_output "2"
}

@test "second prime" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 2
    assert_success
    assert_output "3"
}

@test "sixth prime" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 6
    assert_success
    assert_output "13"
}

@test "big prime" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 10001
    assert_success
    assert_output "104743"
}

@test "there is no zeroth prime" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nth_prime.sh 0
    assert_failure
    assert_output "invalid input"
}
