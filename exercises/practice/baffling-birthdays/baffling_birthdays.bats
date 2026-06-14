#!/usr/bin/env bats
load bats-extra

@test "shared birthday -> one birthdate" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2000-01-01")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

@test "shared birthday -> two birthdates with same year, month, and day" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2000-01-01" "2000-01-01")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

@test "shared birthday -> two birthdates with same year and month, but different day" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2012-05-09" "2012-05-17")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

@test "shared birthday -> two birthdates with same month and day, but different year" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("1999-10-23" "1988-10-23")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

@test "shared birthday -> two birthdates with same year, but different month and day" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2007-12-19" "2007-04-27")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

@test "shared birthday -> two birthdates with different year, month, and day" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("1997-08-04" "1963-11-23")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

@test "shared birthday -> multiple birthdates without shared birthday" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=(
        "1966-07-29"
        "1977-02-12"
        "2001-12-25"
        "1980-11-10"
    )
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

@test "shared birthday -> multiple birthdates with one shared birthday" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=(
        "1966-07-29"
        "1977-02-12"
        "2001-07-29"
        "1980-11-10"
    )
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

@test "shared birthday -> multiple birthdates with more than one shared birthday" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=(
        "1966-07-29"
        "1977-02-12"
        "2001-12-25"
        "1980-07-29"
        "2019-02-12"
    )
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

@test "random birthdates -> generate requested number of birthdates" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    generate=500
    run bash baffling_birthdays.sh random_birthdates "$generate"
    assert_success
    num_output_dates=$( wc -w <<< "$output" )
    assert_equal "$num_output_dates" "$generate"
}

@test "random birthdates -> years are not leap years" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    generate=500
    seen_leap=0
    run bash baffling_birthdays.sh random_birthdates "$generate"
    assert_success
    read -ra output_dates <<< "$output"
    for date in "${output_dates[@]}"; do
        year=${date:0:4}
        if (( year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) )); then
            (( ++seen_leap ))
        fi
    done
    assert_equal "${seen_leap}" 0
}

@test "random birthdates -> months are random" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    declare -A seen_month
    generate=500
    run bash baffling_birthdays.sh random_birthdates "$generate"
    assert_success
    read -ra output_dates <<< "$output"
    for date in "${output_dates[@]}"; do
        month=${date:5:2}

        seen_month[$month]=true
    done
    assert_equal "${#seen_month[@]}" 12
}

@test "random birthdates -> days are random" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    declare -A seen_day
    generate=500
    run bash baffling_birthdays.sh random_birthdates "$generate"
    assert_success
    read -ra output_dates <<< "$output"
    for date in "${output_dates[@]}"; do
        day=${date:8}

        seen_day[$day]=true
    done
    assert_equal "${#seen_day[@]}" 31
}

# "The expected probability values should be compared using some tolerance to allow for small deviations."
@test "estimated probability of at least one shared birthday -> for one person" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # The expected probability is 0.0
    run bash baffling_birthdays.sh estimated_probability_of_share_birthday 1
    assert_success
    assert_equal "$output" 0
}

@test "estimated probability of at least one shared birthday -> among ten people" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # The expected probability is 11.694818
    run bash baffling_birthdays.sh estimated_probability_of_share_birthday 10
    assert_success
    assert_between 10 13
}

@test "estimated probability of at least one shared birthday -> among twenty-three people" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # The expected probability is 50.729723
    run bash baffling_birthdays.sh estimated_probability_of_share_birthday 23
    assert_success
    assert_between 48 53
}

@test "estimated probability of at least one shared birthday -> among seventy people" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # The expected probability is 99.915958
    run bash baffling_birthdays.sh estimated_probability_of_share_birthday 70
    assert_success
    assert_between 98 100
}
