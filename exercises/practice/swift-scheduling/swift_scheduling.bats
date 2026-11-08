#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_now_translates_to_two_hours_later() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "NOW" "2012-02-13T09:00:00"
    assert_success
    assert_output "2012-02-13T11:00:00"
}

test_asap_before_one_in_the_afternoon_translates_to_today_at_five_in_the_afternoon() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "ASAP" "1999-06-03T09:45:00"
    assert_success
    assert_output "1999-06-03T17:00:00"
}

test_asap_at_one_in_the_afternoon_translates_to_tomorrow_at_one_in_the_afternoon() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "ASAP" "2008-12-21T13:00:00"
    assert_success
    assert_output "2008-12-22T13:00:00"
}

test_asap_after_one_in_the_afternoon_translates_to_tomorrow_at_one_in_the_afternoon() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "ASAP" "2008-12-21T14:50:00"
    assert_success
    assert_output "2008-12-22T13:00:00"
}

test_eow_on_monday_translates_to_friday_at_five_in_the_afternoon() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "EOW" "2025-02-03T16:00:00"
    assert_success
    assert_output "2025-02-07T17:00:00"
}

test_eow_on_tuesday_translates_to_friday_at_five_in_the_afternoon() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "EOW" "1997-04-29T10:50:00"
    assert_success
    assert_output "1997-05-02T17:00:00"
}

test_eow_on_wednesday_translates_to_friday_at_five_in_the_afternoon() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "EOW" "2005-09-14T11:00:00"
    assert_success
    assert_output "2005-09-16T17:00:00"
}

test_eow_on_thursday_translates_to_sunday_at_eight_in_the_evening() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "EOW" "2011-05-19T08:30:00"
    assert_success
    assert_output "2011-05-22T20:00:00"
}

test_eow_on_friday_translates_to_sunday_at_eight_in_the_evening() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "EOW" "2022-08-05T14:00:00"
    assert_success
    assert_output "2022-08-07T20:00:00"
}

test_eow_translates_to_leap_day() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "EOW" "2008-02-25T10:30:00"
    assert_success
    assert_output "2008-02-29T17:00:00"
}

test_2m_before_the_second_month_of_this_year_translates_to_the_first_workday_of_the_second_month_of_this_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "2M" "2007-01-02T14:15:00"
    assert_success
    assert_output "2007-02-01T08:00:00"
}

test_11m_in_the_eleventh_month_translates_to_the_first_workday_of_the_eleventh_month_of_next_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "11M" "2013-11-21T15:30:00"
    assert_success
    assert_output "2014-11-03T08:00:00"
}

test_4m_in_the_ninth_month_translates_to_the_first_workday_of_the_fourth_month_of_next_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "4M" "2019-11-18T15:15:00"
    assert_success
    assert_output "2020-04-01T08:00:00"
}

test_q1_in_the_first_quarter_translates_to_the_last_workday_of_the_first_quarter_of_this_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "Q1" "2003-01-01T10:45:00"
    assert_success
    assert_output "2003-03-31T08:00:00"
}

test_q4_in_the_second_quarter_translates_to_the_last_workday_of_the_fourth_quarter_of_this_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "Q4" "2001-04-09T09:00:00"
    assert_success
    assert_output "2001-12-31T08:00:00"
}

test_q3_in_the_fourth_quarter_translates_to_the_last_workday_of_the_third_quarter_of_next_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "Q3" "2022-10-06T11:00:00"
    assert_success
    assert_output "2023-09-29T08:00:00"
}

test_q2_starting_in_the_last_month_of_the_second_quarter_translates_to_the_last_workday_of_the_second_quarter_of_this_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash swift_scheduling.sh "Q2" "2019-06-15T09:50:00"
    assert_success
    assert_output "2019-06-28T08:00:00"
}
