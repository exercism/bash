#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_wink_for_1() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 1
    assert_success
    assert_output "wink"
}

test_double_blink_for_10() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 2
    assert_success
    assert_output "double blink"
}

test_close_your_eyes_for_100() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 4
    assert_success
    assert_output "close your eyes"
}

test_jump_for_1000() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 8
    assert_success
    assert_output "jump"
}

test_combine_two_actions() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 3
    assert_success
    assert_output "wink,double blink"
}

test_reverse_two_actions() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 19
    assert_success
    assert_output "double blink,wink"
}

test_reversing_one_action_gives_the_same_action() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 24
    assert_success
    assert_output "jump"
}

test_reversing_no_actions_still_gives_no_actions() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 16
    assert_success
    assert_output ""
}

test_all_possible_actions() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 15
    assert_success
    assert_output "wink,double blink,close your eyes,jump"
}

test_reverse_all_possible_actions() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 31
    assert_success
    assert_output "jump,close your eyes,double blink,wink"
}

test_do_nothing_for_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash secret_handshake.sh 0
    assert_success
    assert_output ""
}
