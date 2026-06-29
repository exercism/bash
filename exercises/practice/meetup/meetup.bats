#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test "when teenth Monday is the 13th, the first day of the teenth week" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Monday
    assert_success
    assert_output "2013-05-13"
}

@test "when teenth Monday is the 19th, the last day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Monday
    assert_success
    assert_output "2013-08-19"
}

@test "when teenth Monday is some day in the middle of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Monday
    assert_success
    assert_output "2013-09-16"
}

@test "when teenth Tuesday is the 19th, the last day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 teenth Tuesday
    assert_success
    assert_output "2013-03-19"
}

@test "when teenth Tuesday is some day in the middle of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Tuesday
    assert_success
    assert_output "2013-04-16"
}

@test "when teenth Tuesday is the 13th, the first day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Tuesday
    assert_success
    assert_output "2013-08-13"
}

@test "when teenth Wednesday is some day in the middle of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 teenth Wednesday
    assert_success
    assert_output "2013-01-16"
}

@test "when teenth Wednesday is the 13th, the first day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 teenth Wednesday
    assert_success
    assert_output "2013-02-13"
}

@test "when teenth Wednesday is the 19th, the last day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Wednesday
    assert_success
    assert_output "2013-06-19"
}

@test "when teenth Thursday is some day in the middle of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Thursday
    assert_success
    assert_output "2013-05-16"
}

@test "when teenth Thursday is the 13th, the first day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Thursday
    assert_success
    assert_output "2013-06-13"
}

@test "when teenth Thursday is the 19th, the last day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Thursday
    assert_success
    assert_output "2013-09-19"
}

@test "when teenth Friday is the 19th, the last day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Friday
    assert_success
    assert_output "2013-04-19"
}

@test "when teenth Friday is some day in the middle of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Friday
    assert_success
    assert_output "2013-08-16"
}

@test "when teenth Friday is the 13th, the first day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Friday
    assert_success
    assert_output "2013-09-13"
}

@test "when teenth Saturday is some day in the middle of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 teenth Saturday
    assert_success
    assert_output "2013-02-16"
}

@test "when teenth Saturday is the 13th, the first day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Saturday
    assert_success
    assert_output "2013-04-13"
}

@test "when teenth Saturday is the 19th, the last day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 teenth Saturday
    assert_success
    assert_output "2013-10-19"
}

@test "when teenth Sunday is the 19th, the last day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Sunday
    assert_success
    assert_output "2013-05-19"
}

@test "when teenth Sunday is some day in the middle of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Sunday
    assert_success
    assert_output "2013-06-16"
}

@test "when teenth Sunday is the 13th, the first day of the teenth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 teenth Sunday
    assert_success
    assert_output "2013-10-13"
}

@test "when first Monday is some day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 first Monday
    assert_success
    assert_output "2013-03-04"
}

@test "when first Monday is the 1st, the first day of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 first Monday
    assert_success
    assert_output "2013-04-01"
}

@test "when first Tuesday is the 7th, the last day of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 first Tuesday
    assert_success
    assert_output "2013-05-07"
}

@test "when first Tuesday is some day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 first Tuesday
    assert_success
    assert_output "2013-06-04"
}

@test "when first Wednesday is some day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 first Wednesday
    assert_success
    assert_output "2013-07-03"
}

@test "when first Wednesday is the 7th, the last day of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 first Wednesday
    assert_success
    assert_output "2013-08-07"
}

@test "when first Thursday is some day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 first Thursday
    assert_success
    assert_output "2013-09-05"
}

@test "when first Thursday is another day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 first Thursday
    assert_success
    assert_output "2013-10-03"
}

@test "when first Friday is the 1st, the first day of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 first Friday
    assert_success
    assert_output "2013-11-01"
}

@test "when first Friday is some day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 first Friday
    assert_success
    assert_output "2013-12-06"
}

@test "when first Saturday is some day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 first Saturday
    assert_success
    assert_output "2013-01-05"
}

@test "when first Saturday is another day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 first Saturday
    assert_success
    assert_output "2013-02-02"
}

@test "when first Sunday is some day in the middle of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 first Sunday
    assert_success
    assert_output "2013-03-03"
}

@test "when first Sunday is the 7th, the last day of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 first Sunday
    assert_success
    assert_output "2013-04-07"
}

@test "when second Monday is some day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 second Monday
    assert_success
    assert_output "2013-03-11"
}

@test "when second Monday is the 8th, the first day of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 second Monday
    assert_success
    assert_output "2013-04-08"
}

@test "when second Tuesday is the 14th, the last day of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 second Tuesday
    assert_success
    assert_output "2013-05-14"
}

@test "when second Tuesday is some day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 second Tuesday
    assert_success
    assert_output "2013-06-11"
}

@test "when second Wednesday is some day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 second Wednesday
    assert_success
    assert_output "2013-07-10"
}

@test "when second Wednesday is the 14th, the last day of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 second Wednesday
    assert_success
    assert_output "2013-08-14"
}

@test "when second Thursday is some day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 second Thursday
    assert_success
    assert_output "2013-09-12"
}

@test "when second Thursday is another day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 second Thursday
    assert_success
    assert_output "2013-10-10"
}

@test "when second Friday is the 8th, the first day of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 second Friday
    assert_success
    assert_output "2013-11-08"
}

@test "when second Friday is some day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 second Friday
    assert_success
    assert_output "2013-12-13"
}

@test "when second Saturday is some day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 second Saturday
    assert_success
    assert_output "2013-01-12"
}

@test "when second Saturday is another day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 second Saturday
    assert_success
    assert_output "2013-02-09"
}

@test "when second Sunday is some day in the middle of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 second Sunday
    assert_success
    assert_output "2013-03-10"
}

@test "when second Sunday is the 14th, the last day of the second week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 second Sunday
    assert_success
    assert_output "2013-04-14"
}

@test "when third Monday is some day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 third Monday
    assert_success
    assert_output "2013-03-18"
}

@test "when third Monday is the 15th, the first day of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 third Monday
    assert_success
    assert_output "2013-04-15"
}

@test "when third Tuesday is the 21st, the last day of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 third Tuesday
    assert_success
    assert_output "2013-05-21"
}

@test "when third Tuesday is some day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 third Tuesday
    assert_success
    assert_output "2013-06-18"
}

@test "when third Wednesday is some day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 third Wednesday
    assert_success
    assert_output "2013-07-17"
}

@test "when third Wednesday is the 21st, the last day of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 third Wednesday
    assert_success
    assert_output "2013-08-21"
}

@test "when third Thursday is some day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 third Thursday
    assert_success
    assert_output "2013-09-19"
}

@test "when third Thursday is another day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 third Thursday
    assert_success
    assert_output "2013-10-17"
}

@test "when third Friday is the 15th, the first day of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 third Friday
    assert_success
    assert_output "2013-11-15"
}

@test "when third Friday is some day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 third Friday
    assert_success
    assert_output "2013-12-20"
}

@test "when third Saturday is some day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 third Saturday
    assert_success
    assert_output "2013-01-19"
}

@test "when third Saturday is another day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 third Saturday
    assert_success
    assert_output "2013-02-16"
}

@test "when third Sunday is some day in the middle of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 third Sunday
    assert_success
    assert_output "2013-03-17"
}

@test "when third Sunday is the 21st, the last day of the third week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 third Sunday
    assert_success
    assert_output "2013-04-21"
}

@test "when fourth Monday is some day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 fourth Monday
    assert_success
    assert_output "2013-03-25"
}

@test "when fourth Monday is the 22nd, the first day of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 fourth Monday
    assert_success
    assert_output "2013-04-22"
}

@test "when fourth Tuesday is the 28th, the last day of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 fourth Tuesday
    assert_success
    assert_output "2013-05-28"
}

@test "when fourth Tuesday is some day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 fourth Tuesday
    assert_success
    assert_output "2013-06-25"
}

@test "when fourth Wednesday is some day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 fourth Wednesday
    assert_success
    assert_output "2013-07-24"
}

@test "when fourth Wednesday is the 28th, the last day of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 fourth Wednesday
    assert_success
    assert_output "2013-08-28"
}

@test "when fourth Thursday is some day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 fourth Thursday
    assert_success
    assert_output "2013-09-26"
}

@test "when fourth Thursday is another day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 fourth Thursday
    assert_success
    assert_output "2013-10-24"
}

@test "when fourth Friday is the 22nd, the first day of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 fourth Friday
    assert_success
    assert_output "2013-11-22"
}

@test "when fourth Friday is some day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 fourth Friday
    assert_success
    assert_output "2013-12-27"
}

@test "when fourth Saturday is some day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 fourth Saturday
    assert_success
    assert_output "2013-01-26"
}

@test "when fourth Saturday is another day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 fourth Saturday
    assert_success
    assert_output "2013-02-23"
}

@test "when fourth Sunday is some day in the middle of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 fourth Sunday
    assert_success
    assert_output "2013-03-24"
}

@test "when fourth Sunday is the 28th, the last day of the fourth week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 fourth Sunday
    assert_success
    assert_output "2013-04-28"
}

@test "last Monday in a month with four Mondays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 last Monday
    assert_success
    assert_output "2013-03-25"
}

@test "last Monday in a month with five Mondays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 last Monday
    assert_success
    assert_output "2013-04-29"
}

@test "last Tuesday in a month with four Tuesdays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 last Tuesday
    assert_success
    assert_output "2013-05-28"
}

@test "last Tuesday in another month with four Tuesdays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 last Tuesday
    assert_success
    assert_output "2013-06-25"
}

@test "last Wednesday in a month with five Wednesdays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 last Wednesday
    assert_success
    assert_output "2013-07-31"
}

@test "last Wednesday in a month with four Wednesdays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 last Wednesday
    assert_success
    assert_output "2013-08-28"
}

@test "last Thursday in a month with four Thursdays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 last Thursday
    assert_success
    assert_output "2013-09-26"
}

@test "last Thursday in a month with five Thursdays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 last Thursday
    assert_success
    assert_output "2013-10-31"
}

@test "last Friday in a month with five Fridays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 last Friday
    assert_success
    assert_output "2013-11-29"
}

@test "last Friday in a month with four Fridays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 last Friday
    assert_success
    assert_output "2013-12-27"
}

@test "last Saturday in a month with four Saturdays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 last Saturday
    assert_success
    assert_output "2013-01-26"
}

@test "last Saturday in another month with four Saturdays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 last Saturday
    assert_success
    assert_output "2013-02-23"
}

@test "last Sunday in a month with five Sundays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 last Sunday
    assert_success
    assert_output "2013-03-31"
}

@test "last Sunday in a month with four Sundays" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 last Sunday
    assert_success
    assert_output "2013-04-28"
}

@test "when last Wednesday in February in a leap year is the 29th" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2012 2 last Wednesday
    assert_success
    assert_output "2012-02-29"
}

@test "last Wednesday in December that is also the last day of the year" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2014 12 last Wednesday
    assert_success
    assert_output "2014-12-31"
}

@test "when last Sunday in February in a non-leap year is not the 29th" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2015 2 last Sunday
    assert_success
    assert_output "2015-02-22"
}

@test "when first Friday is the 7th, the last day of the first week" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2012 12 first Friday
    assert_success
    assert_output "2012-12-07"
}
