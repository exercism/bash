#!/usr/bin/env bats
load bats-extra

@test "0 eggs" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pop_count.sh 0
    assert_success
    assert_output 0
}

@test "1 egg" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pop_count.sh 16
    assert_success
    assert_output 1
}

@test "4 eggs" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pop_count.sh 89
    assert_success
    assert_output 4
}

@test "13 eggs" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pop_count.sh 2000000000
    assert_success
    assert_output 13
}
