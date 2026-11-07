#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00
# The canonical cases call for the implementation of
# _methods_ `score` and `roll`. That's not feasible for a
# shell script. We'll just pass in all the individual rolls
# and expect the score (or error) as output.


test_should_be_able_to_score_a_game_with_all_zeros() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    assert_success
    assert_output "0"
}

test_should_be_able_to_score_a_game_with_no_strikes_or_spares() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 3 6 3 6 3 6 3 6 3 6 3 6 3 6 3 6 3 6 3 6
    assert_success
    assert_output "90"
}

test_a_spare_followed_by_zeros_is_worth_ten_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 6 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    assert_success
    assert_output "10"
}

test_points_scored_in_the_roll_after_a_spare_are_counted_twice() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 6 4 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    assert_success
    assert_output "16"
}

test_consecutive_spares_each_get_a_one_roll_bonus() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 5 5 3 7 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    assert_success
    assert_output "31"
}

test_a_spare_in_the_last_frame_gets_a_one_roll_bonus_that_is_counted_once() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 3 7
    assert_success
    assert_output "17"
}

test_a_strike_earns_ten_points_in_a_frame_with_a_single_roll() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    assert_success
    assert_output "10"
}

test_points_scored_in_the_two_rolls_after_a_strike_are_counted_twice_as_a_bonus() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 10 5 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    assert_success
    assert_output "26"
}

test_consecutive_strikes_each_get_the_two_roll_bonus() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 10 10 10 5 3 0 0 0 0 0 0 0 0 0 0 0 0
    assert_success
    assert_output "81"
}

test_a_strike_in_the_last_frame_gets_a_two_roll_bonus_that_is_counted_once() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 7 1
    assert_success
    assert_output "18"
}

test_rolling_a_spare_with_the_two_roll_bonus_does_not_get_a_bonus_roll() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 7 3
    assert_success
    assert_output "20"
}

test_strikes_with_the_two_roll_bonus_do_not_get_bonus_rolls() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10
    assert_success
    assert_output "30"
}

test_last_two_strikes_followed_by_only_last_bonus_with_non_strike_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 0 1
    assert_success
    assert_output "31"
}

test_a_strike_with_the_one_roll_bonus_after_a_spare_in_the_last_frame_does_not_get_a_bonus() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 3 10
    assert_success
    assert_output "20"
}

test_all_strikes_is_a_perfect_game() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 10 10 10 10 10 10 10 10 10 10 10 10
    assert_success
    assert_output "300"
}

test_rolls_cannot_score_negative_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh -1
    assert_failure
    assert_output --partial "Negative roll is invalid"
}

test_a_roll_cannot_score_more_than_10_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 11
    assert_failure
    assert_output --partial "Pin count exceeds pins on the lane"
}

test_two_rolls_in_a_frame_cannot_score_more_than_10_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 5 6
    assert_failure
    assert_output --partial "Pin count exceeds pins on the lane"
}

test_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 11
    assert_failure
    assert_output --partial "Pin count exceeds pins on the lane"
}

test_two_bonus_rolls_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 5 6
    assert_failure
    assert_output --partial "Pin count exceeds pins on the lane"
}

test_two_bonus_rolls_after_a_strike_in_the_last_frame_can_score_more_than_10_points_if_one_is_a_strike() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 6
    assert_success
    assert_output "26"
}

test_the_second_bonus_rolls_after_a_strike_in_the_last_frame_cannot_be_a_strike_if_the_first_one_is_not_a_strike() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 6 10
    assert_failure
    assert_output --partial "Pin count exceeds pins on the lane"
}

test_second_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 11
    assert_failure
    assert_output --partial "Pin count exceeds pins on the lane"
}

test_an_unstarted_game_cannot_be_scored() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh
    assert_failure
    assert_output --partial "Score cannot be taken until the end of the game"
}

test_an_incomplete_game_cannot_be_scored() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0
    assert_failure
    assert_output --partial "Score cannot be taken until the end of the game"
}

test_cannot_roll_if_game_already_has_ten_frames() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    assert_failure
    assert_output --partial "Cannot roll after game is over"
}

test_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
    assert_failure
    assert_output --partial "Score cannot be taken until the end of the game"
}

test_both_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10
    assert_failure
    assert_output --partial "Score cannot be taken until the end of the game"
}

test_bonus_roll_for_a_spare_in_the_last_frame_must_be_rolled_before_score_can_be_calculated() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 3
    assert_failure
    assert_output --partial "Score cannot be taken until the end of the game"
}

test_cannot_roll_after_bonus_roll_for_spare() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 3 2 2
    assert_failure
    assert_output --partial "Cannot roll after game is over"
}

test_cannot_roll_after_bonus_rolls_for_strike() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bowling.sh 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 3 2 2
    assert_failure
    assert_output --partial "Cannot roll after game is over"
}
