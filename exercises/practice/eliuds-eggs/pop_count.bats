#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_0_eggs() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pop_count.sh 0
    assert_success
    assert_output 0
}

test_1_egg() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pop_count.sh 16
    assert_success
    assert_output 1
}

test_4_eggs() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pop_count.sh 89
    assert_success
    assert_output 4
}

test_13_eggs() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pop_count.sh 2000000000
    assert_success
    assert_output 13
}
