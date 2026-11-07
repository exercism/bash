#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_when_teenth_monday_is_the_13th_the_first_day_of_the_teenth_week() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Monday
    assert_success
    assert_output "2013-05-13"
}

test_when_teenth_monday_is_the_19th_the_last_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Monday
    assert_success
    assert_output "2013-08-19"
}

test_when_teenth_monday_is_some_day_in_the_middle_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Monday
    assert_success
    assert_output "2013-09-16"
}

test_when_teenth_tuesday_is_the_19th_the_last_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 teenth Tuesday
    assert_success
    assert_output "2013-03-19"
}

test_when_teenth_tuesday_is_some_day_in_the_middle_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Tuesday
    assert_success
    assert_output "2013-04-16"
}

test_when_teenth_tuesday_is_the_13th_the_first_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Tuesday
    assert_success
    assert_output "2013-08-13"
}

test_when_teenth_wednesday_is_some_day_in_the_middle_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 teenth Wednesday
    assert_success
    assert_output "2013-01-16"
}

test_when_teenth_wednesday_is_the_13th_the_first_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 teenth Wednesday
    assert_success
    assert_output "2013-02-13"
}

test_when_teenth_wednesday_is_the_19th_the_last_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Wednesday
    assert_success
    assert_output "2013-06-19"
}

test_when_teenth_thursday_is_some_day_in_the_middle_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Thursday
    assert_success
    assert_output "2013-05-16"
}

test_when_teenth_thursday_is_the_13th_the_first_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Thursday
    assert_success
    assert_output "2013-06-13"
}

test_when_teenth_thursday_is_the_19th_the_last_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Thursday
    assert_success
    assert_output "2013-09-19"
}

test_when_teenth_friday_is_the_19th_the_last_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Friday
    assert_success
    assert_output "2013-04-19"
}

test_when_teenth_friday_is_some_day_in_the_middle_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Friday
    assert_success
    assert_output "2013-08-16"
}

test_when_teenth_friday_is_the_13th_the_first_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Friday
    assert_success
    assert_output "2013-09-13"
}

test_when_teenth_saturday_is_some_day_in_the_middle_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 teenth Saturday
    assert_success
    assert_output "2013-02-16"
}

test_when_teenth_saturday_is_the_13th_the_first_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Saturday
    assert_success
    assert_output "2013-04-13"
}

test_when_teenth_saturday_is_the_19th_the_last_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 teenth Saturday
    assert_success
    assert_output "2013-10-19"
}

test_when_teenth_sunday_is_the_19th_the_last_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Sunday
    assert_success
    assert_output "2013-05-19"
}

test_when_teenth_sunday_is_some_day_in_the_middle_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Sunday
    assert_success
    assert_output "2013-06-16"
}

test_when_teenth_sunday_is_the_13th_the_first_day_of_the_teenth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 teenth Sunday
    assert_success
    assert_output "2013-10-13"
}

test_when_first_monday_is_some_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 first Monday
    assert_success
    assert_output "2013-03-04"
}

test_when_first_monday_is_the_1st_the_first_day_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 first Monday
    assert_success
    assert_output "2013-04-01"
}

test_when_first_tuesday_is_the_7th_the_last_day_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 first Tuesday
    assert_success
    assert_output "2013-05-07"
}

test_when_first_tuesday_is_some_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 first Tuesday
    assert_success
    assert_output "2013-06-04"
}

test_when_first_wednesday_is_some_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 first Wednesday
    assert_success
    assert_output "2013-07-03"
}

test_when_first_wednesday_is_the_7th_the_last_day_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 first Wednesday
    assert_success
    assert_output "2013-08-07"
}

test_when_first_thursday_is_some_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 first Thursday
    assert_success
    assert_output "2013-09-05"
}

test_when_first_thursday_is_another_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 first Thursday
    assert_success
    assert_output "2013-10-03"
}

test_when_first_friday_is_the_1st_the_first_day_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 first Friday
    assert_success
    assert_output "2013-11-01"
}

test_when_first_friday_is_some_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 first Friday
    assert_success
    assert_output "2013-12-06"
}

test_when_first_saturday_is_some_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 first Saturday
    assert_success
    assert_output "2013-01-05"
}

test_when_first_saturday_is_another_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 first Saturday
    assert_success
    assert_output "2013-02-02"
}

test_when_first_sunday_is_some_day_in_the_middle_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 first Sunday
    assert_success
    assert_output "2013-03-03"
}

test_when_first_sunday_is_the_7th_the_last_day_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 first Sunday
    assert_success
    assert_output "2013-04-07"
}

test_when_second_monday_is_some_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 second Monday
    assert_success
    assert_output "2013-03-11"
}

test_when_second_monday_is_the_8th_the_first_day_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 second Monday
    assert_success
    assert_output "2013-04-08"
}

test_when_second_tuesday_is_the_14th_the_last_day_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 second Tuesday
    assert_success
    assert_output "2013-05-14"
}

test_when_second_tuesday_is_some_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 second Tuesday
    assert_success
    assert_output "2013-06-11"
}

test_when_second_wednesday_is_some_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 second Wednesday
    assert_success
    assert_output "2013-07-10"
}

test_when_second_wednesday_is_the_14th_the_last_day_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 second Wednesday
    assert_success
    assert_output "2013-08-14"
}

test_when_second_thursday_is_some_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 second Thursday
    assert_success
    assert_output "2013-09-12"
}

test_when_second_thursday_is_another_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 second Thursday
    assert_success
    assert_output "2013-10-10"
}

test_when_second_friday_is_the_8th_the_first_day_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 second Friday
    assert_success
    assert_output "2013-11-08"
}

test_when_second_friday_is_some_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 second Friday
    assert_success
    assert_output "2013-12-13"
}

test_when_second_saturday_is_some_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 second Saturday
    assert_success
    assert_output "2013-01-12"
}

test_when_second_saturday_is_another_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 second Saturday
    assert_success
    assert_output "2013-02-09"
}

test_when_second_sunday_is_some_day_in_the_middle_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 second Sunday
    assert_success
    assert_output "2013-03-10"
}

test_when_second_sunday_is_the_14th_the_last_day_of_the_second_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 second Sunday
    assert_success
    assert_output "2013-04-14"
}

test_when_third_monday_is_some_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 third Monday
    assert_success
    assert_output "2013-03-18"
}

test_when_third_monday_is_the_15th_the_first_day_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 third Monday
    assert_success
    assert_output "2013-04-15"
}

test_when_third_tuesday_is_the_21st_the_last_day_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 third Tuesday
    assert_success
    assert_output "2013-05-21"
}

test_when_third_tuesday_is_some_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 third Tuesday
    assert_success
    assert_output "2013-06-18"
}

test_when_third_wednesday_is_some_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 third Wednesday
    assert_success
    assert_output "2013-07-17"
}

test_when_third_wednesday_is_the_21st_the_last_day_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 third Wednesday
    assert_success
    assert_output "2013-08-21"
}

test_when_third_thursday_is_some_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 third Thursday
    assert_success
    assert_output "2013-09-19"
}

test_when_third_thursday_is_another_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 third Thursday
    assert_success
    assert_output "2013-10-17"
}

test_when_third_friday_is_the_15th_the_first_day_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 third Friday
    assert_success
    assert_output "2013-11-15"
}

test_when_third_friday_is_some_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 third Friday
    assert_success
    assert_output "2013-12-20"
}

test_when_third_saturday_is_some_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 third Saturday
    assert_success
    assert_output "2013-01-19"
}

test_when_third_saturday_is_another_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 third Saturday
    assert_success
    assert_output "2013-02-16"
}

test_when_third_sunday_is_some_day_in_the_middle_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 third Sunday
    assert_success
    assert_output "2013-03-17"
}

test_when_third_sunday_is_the_21st_the_last_day_of_the_third_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 third Sunday
    assert_success
    assert_output "2013-04-21"
}

test_when_fourth_monday_is_some_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 fourth Monday
    assert_success
    assert_output "2013-03-25"
}

test_when_fourth_monday_is_the_22nd_the_first_day_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 fourth Monday
    assert_success
    assert_output "2013-04-22"
}

test_when_fourth_tuesday_is_the_28th_the_last_day_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 fourth Tuesday
    assert_success
    assert_output "2013-05-28"
}

test_when_fourth_tuesday_is_some_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 fourth Tuesday
    assert_success
    assert_output "2013-06-25"
}

test_when_fourth_wednesday_is_some_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 fourth Wednesday
    assert_success
    assert_output "2013-07-24"
}

test_when_fourth_wednesday_is_the_28th_the_last_day_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 fourth Wednesday
    assert_success
    assert_output "2013-08-28"
}

test_when_fourth_thursday_is_some_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 fourth Thursday
    assert_success
    assert_output "2013-09-26"
}

test_when_fourth_thursday_is_another_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 fourth Thursday
    assert_success
    assert_output "2013-10-24"
}

test_when_fourth_friday_is_the_22nd_the_first_day_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 fourth Friday
    assert_success
    assert_output "2013-11-22"
}

test_when_fourth_friday_is_some_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 fourth Friday
    assert_success
    assert_output "2013-12-27"
}

test_when_fourth_saturday_is_some_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 fourth Saturday
    assert_success
    assert_output "2013-01-26"
}

test_when_fourth_saturday_is_another_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 fourth Saturday
    assert_success
    assert_output "2013-02-23"
}

test_when_fourth_sunday_is_some_day_in_the_middle_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 fourth Sunday
    assert_success
    assert_output "2013-03-24"
}

test_when_fourth_sunday_is_the_28th_the_last_day_of_the_fourth_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 fourth Sunday
    assert_success
    assert_output "2013-04-28"
}

test_last_monday_in_a_month_with_four_mondays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 last Monday
    assert_success
    assert_output "2013-03-25"
}

test_last_monday_in_a_month_with_five_mondays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 last Monday
    assert_success
    assert_output "2013-04-29"
}

test_last_tuesday_in_a_month_with_four_tuesdays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 last Tuesday
    assert_success
    assert_output "2013-05-28"
}

test_last_tuesday_in_another_month_with_four_tuesdays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 last Tuesday
    assert_success
    assert_output "2013-06-25"
}

test_last_wednesday_in_a_month_with_five_wednesdays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 last Wednesday
    assert_success
    assert_output "2013-07-31"
}

test_last_wednesday_in_a_month_with_four_wednesdays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 last Wednesday
    assert_success
    assert_output "2013-08-28"
}

test_last_thursday_in_a_month_with_four_thursdays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 last Thursday
    assert_success
    assert_output "2013-09-26"
}

test_last_thursday_in_a_month_with_five_thursdays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 last Thursday
    assert_success
    assert_output "2013-10-31"
}

test_last_friday_in_a_month_with_five_fridays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 last Friday
    assert_success
    assert_output "2013-11-29"
}

test_last_friday_in_a_month_with_four_fridays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 last Friday
    assert_success
    assert_output "2013-12-27"
}

test_last_saturday_in_a_month_with_four_saturdays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 last Saturday
    assert_success
    assert_output "2013-01-26"
}

test_last_saturday_in_another_month_with_four_saturdays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 last Saturday
    assert_success
    assert_output "2013-02-23"
}

test_last_sunday_in_a_month_with_five_sundays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 last Sunday
    assert_success
    assert_output "2013-03-31"
}

test_last_sunday_in_a_month_with_four_sundays() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 last Sunday
    assert_success
    assert_output "2013-04-28"
}

test_when_last_wednesday_in_february_in_a_leap_year_is_the_29th() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2012 2 last Wednesday
    assert_success
    assert_output "2012-02-29"
}

test_last_wednesday_in_december_that_is_also_the_last_day_of_the_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2014 12 last Wednesday
    assert_success
    assert_output "2014-12-31"
}

test_when_last_sunday_in_february_in_a_non_leap_year_is_not_the_29th() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2015 2 last Sunday
    assert_success
    assert_output "2015-02-22"
}

test_when_first_friday_is_the_7th_the_last_day_of_the_first_week() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2012 12 first Friday
    assert_success
    assert_output "2012-12-07"
}
