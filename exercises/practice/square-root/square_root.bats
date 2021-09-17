#!/usr/bin/env bats
load bats-extra

@test "root of 1" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh 1
    assert_success
    assert_output "1"
}

@test "root of 4" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "4"
    assert_success
    assert_output "2"
}

@test "root of 25" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "25"
    assert_success
    assert_output "5"
}

@test "root of 81" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "81"
    assert_success
    assert_output "9"
}

@test "root of 196" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "196"
    assert_success
    assert_output "14"
}

@test "root of 65025" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "65025"
    assert_success
    assert_output "255"
}
