#!/usr/bin/env bats
load bats-extra

@test "shared birthday -> one birthdate" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2000-01-01")
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

@test "shared birthday -> two birthdates with same year, month, and day" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2000-01-01" "2000-01-01")
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

@test "shared birthday -> two birthdates with same year and month, but different day" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2012-05-09" "2012-05-17")
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

@test "shared birthday -> two birthdates with same month and day, but different year" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("1999-10-23" "1988-10-23")
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

@test "shared birthday -> two birthdates with same year, but different month and day" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2007-12-19" "2007-04-27")
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

@test "shared birthday -> two birthdates with different year, month, and day" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("1997-08-04" "1963-11-23")
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
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
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
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
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
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
    run bash baffling_birthdays.sh sharedBirthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

@test "random birthdates -> generate requested number of birthdates" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    generate=$(shuf -n 1 -i 100-1000)
    run bash baffling_birthdays.sh randomBirthdates $generate
    assert_success
    read -ra output_dates <<< "$output"
    assert_equal ${#output_dates[@]} $generate
}

@test "random birthdates -> years are not leap years" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    generate=$(shuf -n 1 -i 100-1000)
    seen_leap=0
    run bash baffling_birthdays.sh randomBirthdates $generate
    assert_success
    read -ra output_dates <<< "$output"
    for date in "${output_dates[@]}"; do
        year=${date:0:4}
        if (( year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) )); then
            (( ++ seen_leap ))
        fi
    done
    assert_equal $seen_leap 0
}

@test "random birthdates -> months are random" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    declare -A seen_month
    generate=$(shuf -n 1 -i 100-1000)
    run bash baffling_birthdays.sh randomBirthdates $generate
    assert_success
    read -ra output_dates <<< "$output"
    for date in "${output_dates[@]}"; do
        month=${date:5:2}

        seen_month[$month]=true
    done
    assert_equal ${#seen_month[@]} 12
}

@test "random birthdates -> days are random" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    declare -A seen_day
    generate=$(shuf -n 1 -i 100-1000)
    run bash baffling_birthdays.sh randomBirthdates $generate
    assert_success
    read -ra output_dates <<< "$output"
    for date in "${output_dates[@]}"; do
        day=${date:8}

        seen_day[$day]=true
    done
    assert_equal ${#seen_day[@]} 31
}

# "The expected probability values should be compared using some tolerance to allow for small deviations."
@test "estimated probability of at least one shared birthday -> for one person" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # expect="0.0" # this is the exercice ref.
    run bash baffling_birthdays.sh estimatedProbabilityOfSharedBirthday 1
    assert_success
   [[ "$output" =~ ^(0\.) ]]
}

@test "estimated probability of at least one shared birthday -> among ten people" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # expect="11.694818" # this is the exercice ref.
    run bash baffling_birthdays.sh estimatedProbabilityOfSharedBirthday 10
    assert_success
    [[ "$output" =~ ^(10\.|11\.|12\.|13\.|14\.) ]]
}

@test "estimated probability of at least one shared birthday -> among twenty-three people" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # expect="50.729723" # this is the exercice ref.
    run bash baffling_birthdays.sh estimatedProbabilityOfSharedBirthday 23
    assert_success
    [[ "$output" =~ ^(48\.|49\.|50\.|51\.|52\.|53\.) ]]
}

@test "estimated probability of at least one shared birthday -> among seventy people" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # expect="99.915958" # this is the exercice ref.
    run bash baffling_birthdays.sh estimatedProbabilityOfSharedBirthday 70
    assert_success
    [[ "$output" =~ ^(98\.|99\.|100\.) ]]
}
