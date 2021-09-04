#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.1.0.0


@test "monteenth of May 2013" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Monday
    assert_success
    assert_output  "2013-05-13"
}

@test "monteenth of August 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Monday
    assert_success
    assert_output "2013-08-19"
}

@test "monteenth of September 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Monday
    assert_success
    assert_output "2013-09-16"
}

@test "tuesteenth of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 teenth Tuesday
    assert_success
    assert_output "2013-03-19"
}

@test "tuesteenth of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Tuesday
    assert_success
    assert_output "2013-04-16"
}

@test "tuesteenth of August 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Tuesday
    assert_success
    assert_output "2013-08-13"
}

@test "wednesteenth of January 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 teenth Wednesday
    assert_success
    assert_output "2013-01-16"
}

@test "wednesteenth of February 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 teenth Wednesday
    assert_success
    assert_output "2013-02-13"
}

@test "wednesteenth of June 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Wednesday
    assert_success
    assert_output "2013-06-19"
}

@test "thursteenth of May 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Thursday
    assert_success
    assert_output "2013-05-16"
}

@test "thursteenth of June 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Thursday
    assert_success
    assert_output "2013-06-13"
}

@test "thursteenth of September 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Thursday
    assert_success
    assert_output "2013-09-19"
}

@test "friteenth of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Friday
    assert_success
    assert_output "2013-04-19"
}

@test "friteenth of August 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 teenth Friday
    assert_success
    assert_output "2013-08-16"
}

@test "friteenth of September 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 teenth Friday
    assert_success
    assert_output "2013-09-13"
}

@test "saturteenth of February 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 teenth Saturday
    assert_success
    assert_output "2013-02-16"
}

@test "saturteenth of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 teenth Saturday
    assert_success
    assert_output "2013-04-13"
}

@test "saturteenth of October 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 teenth Saturday
    assert_success
    assert_output "2013-10-19"
}

@test "sunteenth of May 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 teenth Sunday
    assert_success
    assert_output "2013-05-19"
}

@test "sunteenth of June 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 teenth Sunday
    assert_success
    assert_output "2013-06-16"
}

@test "sunteenth of October 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 teenth Sunday
    assert_success
    assert_output "2013-10-13"
}

@test "first Monday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 first Monday
    assert_success
    assert_output "2013-03-04"
}

@test "first Monday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 first Monday
    assert_success
    assert_output "2013-04-01"
}

@test "first Tuesday of May 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 first Tuesday
    assert_success
    assert_output "2013-05-07"
}

@test "first Tuesday of June 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 first Tuesday
    assert_success
    assert_output "2013-06-04"
}

@test "first Wednesday of July 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 first Wednesday
    assert_success
    assert_output "2013-07-03"
}

@test "first Wednesday of August 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 first Wednesday
    assert_success
    assert_output "2013-08-07"
}

@test "first Thursday of September 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 first Thursday
    assert_success
    assert_output "2013-09-05"
}

@test "first Thursday of October 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 first Thursday
    assert_success
    assert_output "2013-10-03"
}

@test "first Friday of November 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 first Friday
    assert_success
    assert_output "2013-11-01"
}

@test "first Friday of December 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 first Friday
    assert_success
    assert_output "2013-12-06"
}

@test "first Saturday of January 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 first Saturday
    assert_success
    assert_output "2013-01-05"
}

@test "first Saturday of February 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 first Saturday
    assert_success
    assert_output "2013-02-02"
}

@test "first Sunday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 first Sunday
    assert_success
    assert_output "2013-03-03"
}

@test "first Sunday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 first Sunday
    assert_success
    assert_output "2013-04-07"
}

@test "second Monday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 second Monday
    assert_success
    assert_output "2013-03-11"
}

@test "second Monday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 second Monday
    assert_success
    assert_output "2013-04-08"
}

@test "second Tuesday of May 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 second Tuesday
    assert_success
    assert_output "2013-05-14"
}

@test "second Tuesday of June 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 second Tuesday
    assert_success
    assert_output "2013-06-11"
}

@test "second Wednesday of July 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 second Wednesday
    assert_success
    assert_output "2013-07-10"
}

@test "second Wednesday of August 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 second Wednesday
    assert_success
    assert_output "2013-08-14"
}

@test "second Thursday of September 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 second Thursday
    assert_success
    assert_output "2013-09-12"
}

@test "second Thursday of October 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 second Thursday
    assert_success
    assert_output "2013-10-10"
}

@test "second Friday of November 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 second Friday
    assert_success
    assert_output "2013-11-08"
}

@test "second Friday of December 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 second Friday
    assert_success
    assert_output "2013-12-13"
}

@test "second Saturday of January 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 second Saturday
    assert_success
    assert_output "2013-01-12"
}

@test "second Saturday of February 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 second Saturday
    assert_success
    assert_output "2013-02-09"
}

@test "second Sunday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 second Sunday
    assert_success
    assert_output "2013-03-10"
}

@test "second Sunday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 second Sunday
    assert_success
    assert_output "2013-04-14"
}

@test "third Monday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 third Monday
    assert_success
    assert_output "2013-03-18"
}

@test "third Monday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 third Monday
    assert_success
    assert_output "2013-04-15"
}

@test "third Tuesday of May 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 third Tuesday
    assert_success
    assert_output "2013-05-21"
}

@test "third Tuesday of June 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 third Tuesday
    assert_success
    assert_output "2013-06-18"
}

@test "third Wednesday of July 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 third Wednesday
    assert_success
    assert_output "2013-07-17"
}

@test "third Wednesday of August 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 third Wednesday
    assert_success
    assert_output "2013-08-21"
}

@test "third Thursday of September 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 third Thursday
    assert_success
    assert_output "2013-09-19"
}

@test "third Thursday of October 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 third Thursday
    assert_success
    assert_output "2013-10-17"
}

@test "third Friday of November 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 third Friday
    assert_success
    assert_output "2013-11-15"
}

@test "third Friday of December 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 third Friday
    assert_success
    assert_output "2013-12-20"
}

@test "third Saturday of January 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 third Saturday
    assert_success
    assert_output "2013-01-19"
}

@test "third Saturday of February 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 third Saturday
    assert_success
    assert_output "2013-02-16"
}

@test "third Sunday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 third Sunday
    assert_success
    assert_output "2013-03-17"
}

@test "third Sunday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 third Sunday
    assert_success
    assert_output "2013-04-21"
}

@test "fourth Monday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 fourth Monday
    assert_success
    assert_output "2013-03-25"
}

@test "fourth Monday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 fourth Monday
    assert_success
    assert_output "2013-04-22"
}

@test "fourth Tuesday of May 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 fourth Tuesday
    assert_success
    assert_output "2013-05-28"
}

@test "fourth Tuesday of June 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 fourth Tuesday
    assert_success
    assert_output "2013-06-25"
}

@test "fourth Wednesday of July 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 fourth Wednesday
    assert_success
    assert_output "2013-07-24"
}

@test "fourth Wednesday of August 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 fourth Wednesday
    assert_success
    assert_output "2013-08-28"
}

@test "fourth Thursday of September 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 fourth Thursday
    assert_success
    assert_output "2013-09-26"
}

@test "fourth Thursday of October 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 fourth Thursday
    assert_success
    assert_output "2013-10-24"
}

@test "fourth Friday of November 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 fourth Friday
    assert_success
    assert_output "2013-11-22"
}

@test "fourth Friday of December 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 fourth Friday
    assert_success
    assert_output "2013-12-27"
}

@test "fourth Saturday of January 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 fourth Saturday
    assert_success
    assert_output "2013-01-26"
}

@test "fourth Saturday of February 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 fourth Saturday
    assert_success
    assert_output "2013-02-23"
}

@test "fourth Sunday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 fourth Sunday
    assert_success
    assert_output "2013-03-24"
}

@test "fourth Sunday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 fourth Sunday
    assert_success
    assert_output "2013-04-28"
}

@test "last Monday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 last Monday
    assert_success
    assert_output "2013-03-25"
}

@test "last Monday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 last Monday
    assert_success
    assert_output "2013-04-29"
}

@test "last Tuesday of May 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 5 last Tuesday
    assert_success
    assert_output "2013-05-28"
}

@test "last Tuesday of June 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 6 last Tuesday
    assert_success
    assert_output "2013-06-25"
}

@test "last Wednesday of July 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 7 last Wednesday
    assert_success
    assert_output "2013-07-31"
}

@test "last Wednesday of August 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 8 last Wednesday
    assert_success
    assert_output "2013-08-28"
}

@test "last Thursday of September 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 9 last Thursday
    assert_success
    assert_output "2013-09-26"
}

@test "last Thursday of October 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 10 last Thursday
    assert_success
    assert_output "2013-10-31"
}

@test "last Friday of November 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 11 last Friday
    assert_success
    assert_output "2013-11-29"
}

@test "last Friday of December 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 12 last Friday
    assert_success
    assert_output "2013-12-27"
}

@test "last Saturday of January 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 1 last Saturday
    assert_success
    assert_output "2013-01-26"
}

@test "last Saturday of February 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 2 last Saturday
    assert_success
    assert_output "2013-02-23"
}

@test "last Sunday of March 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 3 last Sunday
    assert_success
    assert_output "2013-03-31"
}

@test "last Sunday of April 2013" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2013 4 last Sunday
    assert_success
    assert_output "2013-04-28"
}

@test "last Wednesday of February 2012" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2012 2 last Wednesday
    assert_success
    assert_output "2012-02-29"
}

@test "last Wednesday of December 2014" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2014 12 last Wednesday
    assert_success
    assert_output "2014-12-31"
}

@test "last Sunday of February 2015" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2015 2 last Sunday
    assert_success
    assert_output "2015-02-22"
}

@test "first Friday of December 2012" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash meetup.sh 2012 12 first Friday
    assert_success
    assert_output "2012-12-07"
}
