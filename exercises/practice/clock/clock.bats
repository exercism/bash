#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:23:17+00:00

# * The canonical "Compare two clocks for equality" tests
#   have not been included: for bash they will simply be 
#   string equality tests, so no added value.
#
# * Some extra tests have been added to detect invalid arguments.


# usage: clock.sh h m [{+|-} delta]
# where:
#       h = an hour value
#       m = a minute value
# optional:
#       a time delta (in minutes) to apply to the initial clock value
#
# The clock script will output the clock value in %H:%M format


test_create_a_new_clock_with_an_initial_time_on_the_hour() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 8 0
    assert_success
    assert_output "08:00"
}

test_create_a_new_clock_with_an_initial_time_past_the_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 11 9
    assert_success
    assert_output "11:09"
}

test_create_a_new_clock_with_an_initial_time_midnight_is_zero_hours() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 24 0
    assert_success
    assert_output "00:00"
}

test_create_a_new_clock_with_an_initial_time_hour_rolls_over() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 25 0
    assert_success
    assert_output "01:00"
}

test_create_a_new_clock_with_an_initial_time_hour_rolls_over_continuously() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 100 0
    assert_success
    assert_output "04:00"
}

test_create_a_new_clock_with_an_initial_time_sixty_minutes_is_next_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 60
    assert_success
    assert_output "02:00"
}

test_create_a_new_clock_with_an_initial_time_minutes_roll_over() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 160
    assert_success
    assert_output "02:40"
}

test_create_a_new_clock_with_an_initial_time_minutes_roll_over_continuously() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 1723
    assert_success
    assert_output "04:43"
}

test_create_a_new_clock_with_an_initial_time_hour_and_minutes_roll_over() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 25 160
    assert_success
    assert_output "03:40"
}

test_create_a_new_clock_with_an_initial_time_hour_and_minutes_roll_over_continuously() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 201 3001
    assert_success
    assert_output "11:01"
}

test_create_a_new_clock_with_an_initial_time_hour_and_minutes_roll_over_to_exactly_midnight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 72 8640
    assert_success
    assert_output "00:00"
}

test_create_a_new_clock_with_an_initial_time_negative_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -1 15
    assert_success
    assert_output "23:15"
}

test_create_a_new_clock_with_an_initial_time_negative_hour_rolls_over() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -25 0
    assert_success
    assert_output "23:00"
}

test_create_a_new_clock_with_an_initial_time_negative_hour_rolls_over_continuously() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -91 0
    assert_success
    assert_output "05:00"
}

test_create_a_new_clock_with_an_initial_time_negative_minutes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 -40
    assert_success
    assert_output "00:20"
}

test_create_a_new_clock_with_an_initial_time_negative_minutes_roll_over() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 -160
    assert_success
    assert_output "22:20"
}

test_create_a_new_clock_with_an_initial_time_negative_minutes_roll_over_continuously() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 -4820
    assert_success
    assert_output "16:40"
}

test_create_a_new_clock_with_an_initial_time_negative_sixty_minutes_is_previous_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 2 -60
    assert_success
    assert_output "01:00"
}

test_create_a_new_clock_with_an_initial_time_negative_hour_and_minutes_both_roll_over() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -25 -160
    assert_success
    assert_output "20:20"
}

test_create_a_new_clock_with_an_initial_time_negative_hour_and_minutes_both_roll_over_continuously() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -121 -5810
    assert_success
    assert_output "22:10"
}

test_add_minutes_add_minutes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 0 + 3
    assert_success
    assert_output "10:03"
}

test_add_minutes_add_no_minutes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 6 41 + 0
    assert_success
    assert_output "06:41"
}

test_add_minutes_add_to_next_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 45 + 40
    assert_success
    assert_output "01:25"
}

test_add_minutes_add_more_than_one_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 0 + 61
    assert_success
    assert_output "11:01"
}

test_add_minutes_add_more_than_two_hours_with_carry() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 45 + 160
    assert_success
    assert_output "03:25"
}

test_add_minutes_add_across_midnight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 23 59 + 2
    assert_success
    assert_output "00:01"
}

test_add_minutes_add_more_than_one_day_1500_min_25_hrs() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 5 32 + 1500
    assert_success
    assert_output "06:32"
}

test_add_minutes_add_more_than_two_days() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 1 + 3500
    assert_success
    assert_output "11:21"
}

test_subtract_minutes_subtract_minutes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 3 - 3
    assert_success
    assert_output "10:00"
}

test_subtract_minutes_subtract_to_previous_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 3 - 30
    assert_success
    assert_output "09:33"
}

test_subtract_minutes_subtract_more_than_an_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 3 - 70
    assert_success
    assert_output "08:53"
}

test_subtract_minutes_subtract_across_midnight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 3 - 4
    assert_success
    assert_output "23:59"
}

test_subtract_minutes_subtract_more_than_two_hours() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 0 - 160
    assert_success
    assert_output "21:20"
}

test_subtract_minutes_subtract_more_than_two_hours_with_borrow() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 6 15 - 160
    assert_success
    assert_output "03:35"
}

test_subtract_minutes_subtract_more_than_one_day_1500_min_25_hrs() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 5 32 - 1500
    assert_success
    assert_output "04:32"
}

test_subtract_minutes_subtract_more_than_two_days() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 2 20 - 3000
    assert_success
    assert_output "00:20"
}

test_compare_two_clocks_for_equality_clocks_with_same_time() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 15 37 = 15 37
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_a_minute_apart() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 15 36 = 15 37
    assert_success
    assert_output "false"
}

test_compare_two_clocks_for_equality_clocks_an_hour_apart() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 14 37 = 15 37
    assert_success
    assert_output "false"
}

test_compare_two_clocks_for_equality_clocks_with_hour_overflow() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 37 = 34 37
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_hour_overflow_by_several_days() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 3 11 = 99 11
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_negative_hour() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 22 40 = -2 40
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_negative_hour_that_wraps() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 17 3 = -31 3
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_negative_hour_that_wraps_multiple_times() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 13 49 = -83 49
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_minute_overflow() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 1 = 0 1441
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_minute_overflow_by_several_days() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 2 2 = 2 4322
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_negative_minute() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 2 40 = 3 -20
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_negative_minute_that_wraps() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 4 10 = 5 -1490
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_negative_minute_that_wraps_multiple_times() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 6 15 = 6 -4305
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_negative_hours_and_minutes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 7 32 = -12 -268
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_clocks_with_negative_hours_and_minutes_that_wrap() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 18 7 = -54 -11513
    assert_success
    assert_output "true"
}

test_compare_two_clocks_for_equality_full_clock_and_zeroed_clock() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 24 0 = 0 0
    assert_success
    assert_output "true"
}


# Error conditions: We expect non-zero exit status, and
# some error message to be output (your choice for wording).

test_no_args() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh
    assert_failure
    assert_output --partial "invalid arguments"
}

test_too_many_args() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 2 3 4 5
    assert_failure
    assert_output --partial "invalid arguments"
}

test_three_args() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 2 +
    assert_failure
    assert_output --partial "invalid arguments"
}

test_invalid_delta() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 2 / 3
    assert_failure
    assert_output --partial "invalid arguments"
}

test_non_numeric_args_are_errors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh foo bar
    assert_failure
    assert_output    # there is _some_ output
}

test_non_numeric_delta_errors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 2 - 3delta
    assert_failure
    assert_output    # there is _some_ output
}
