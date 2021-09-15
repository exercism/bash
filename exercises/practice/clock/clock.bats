#!/usr/bin/env bats
load bats-extra

# local version: 2.4.0.1
#
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


# Create a new clock with an initial time

@test "on the hour" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 8 0
    assert_success
    assert_output "08:00"
}

@test "past the hour" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 11 9
    assert_success
    assert_output "11:09"
}

@test "midnight is zero hours" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 24 0
    assert_success
    assert_output "00:00"
}

@test "hour rolls over" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 25 0
    assert_success
    assert_output "01:00"
}

@test "hour rolls over continuously" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 100 0
    assert_success
    assert_output "04:00"
}

@test "sixty minutes is next hour" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 60
    assert_success
    assert_output "02:00"
}

@test "minutes roll over" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 160
    assert_success
    assert_output "02:40"
}

@test "minutes roll over continuously" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 1723
    assert_success
    assert_output "04:43"
}

@test "hour and minutes roll over" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 25 160
    assert_success
    assert_output "03:40"
}

@test "hour and minutes roll over continuously" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 201 3001
    assert_success
    assert_output "11:01"
}

@test "hour and minutes roll over to exactly midnight" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 72 8640
    assert_success
    assert_output "00:00"
}

@test "negative hour" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -1 15
    assert_success
    assert_output "23:15"
}

@test "negative hour rolls over" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -25 0
    assert_success
    assert_output "23:00"
}

@test "negative hour rolls over continuously" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -91 0
    assert_success
    assert_output "05:00"
}

@test "negative minutes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 -40
    assert_success
    assert_output "00:20"
}

@test "negative minutes roll over" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 -160
    assert_success
    assert_output "22:20"
}

@test "negative minutes roll over continuously" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 -4820
    assert_success
    assert_output "16:40"
}

@test "negative sixty minutes is previous hour" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 2 -60
    assert_success
    assert_output "01:00"
}

@test "negative hour and minutes both roll over" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -25 -160
    assert_success
    assert_output "20:20"
}

@test "negative hour and minutes both roll over continuously" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh -121 -5810
    assert_success
    assert_output "22:10"
}


# Add minutes

@test "add minutes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 0 + 3
    assert_success
    assert_output "10:03"
}

@test "add no minutes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 6 41 + 0
    assert_success
    assert_output "06:41"
}

@test "add to next hour" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 45 + 40
    assert_success
    assert_output "01:25"
}

@test "add more than one hour" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 0 + 61
    assert_success
    assert_output "11:01"
}

@test "add more than two hours with carry" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 45 + 160
    assert_success
    assert_output "03:25"
}

@test "add across midnight" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 23 59 + 2
    assert_success
    assert_output "00:01"
}

@test "add more than one day (1500 min = 25 hrs)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 5 32 + 1500
    assert_success
    assert_output "06:32"
}

@test "add more than two days" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 1 + 3500
    assert_success
    assert_output "11:21"
}


# Subtract minutes

@test "subtract minutes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 3 - 3
    assert_success
    assert_output "10:00"
}

@test "subtract to previous hour" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 3 - 30
    assert_success
    assert_output "09:33"
}

@test "subtract more than an hour" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 10 3 - 70
    assert_success
    assert_output "08:53"
}

@test "subtract across midnight" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 3 - 4
    assert_success
    assert_output "23:59"
}

@test "subtract more than two hours" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 0 0 - 160
    assert_success
    assert_output "21:20"
}

@test "subtract more than two hours with borrow" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 6 15 - 160
    assert_success
    assert_output "03:35"
}

@test "subtract more than one day (1500 min = 25 hrs)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 5 32 - 1500
    assert_success
    assert_output "04:32"
}

@test "subtract more than two days" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 2 20 - 3000
    assert_success
    assert_output "00:20"
}


# Error conditions: We expect non-zero exit status, and
# some error message to be output (your choice for wording).

@test "no args" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh
    assert_failure
    assert_output --partial "invalid arguments"
}

@test "too many args" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 2 3 4 5
    assert_failure
    assert_output --partial "invalid arguments"
}

@test "three args" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 2 +
    assert_failure
    assert_output --partial "invalid arguments"
}

@test "invalid delta" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 2 / 3
    assert_failure
    assert_output --partial "invalid arguments"
}

@test "non-numeric args are errors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh foo bar
    assert_failure
    assert_output    # there is _some_ output
}

@test "non-numeric delta errors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash clock.sh 1 2 - 3delta
    assert_failure
    assert_output    # there is _some_ output
}
