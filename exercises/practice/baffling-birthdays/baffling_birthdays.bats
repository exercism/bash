#!/usr/bin/env bats
load bats-extra

# -- bats variables -- #
declare output

test_shared_birthday_one_birthdate() { # @test
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2000-01-01")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

test_shared_birthday_two_birthdates_with_same_year_month_and_day() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2000-01-01" "2000-01-01")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

test_shared_birthday_two_birthdates_with_same_year_and_month_but_different_day() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2012-05-09" "2012-05-17")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

test_shared_birthday_two_birthdates_with_same_month_and_day_but_different_year() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("1999-10-23" "1988-10-23")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "true"
}

test_shared_birthday_two_birthdates_with_same_year_but_different_month_and_day() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("2007-12-19" "2007-04-27")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

test_shared_birthday_two_birthdates_with_different_year_month_and_day() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    birthdates=("1997-08-04" "1963-11-23")
    run bash baffling_birthdays.sh shared_birthday "${birthdates[@]}"
    assert_success
    assert_output "false"
}

test_shared_birthday_multiple_birthdates_without_shared_birthday() { # @test
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

test_shared_birthday_multiple_birthdates_with_one_shared_birthday() { # @test
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

test_shared_birthday_multiple_birthdates_with_more_than_one_shared_birthday() { # @test
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

test_random_birthdates_generate_requested_number_of_birthdates() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    generate=500
    run bash baffling_birthdays.sh random_birthdates "$generate"
    assert_success
    num_output_dates=$( wc -w <<< "$output" | tr -d '[:space:]' )
    assert_equal "$num_output_dates" "$generate"
}

test_random_birthdates_years_are_not_leap_years() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    generate=500
    seen_leap=0
    run bash baffling_birthdays.sh random_birthdates "$generate"
    assert_success
    read -d '' -ra output_dates < <(printf '%s\0' "$output")
    for date in "${output_dates[@]}"; do
        year=${date:0:4}
        if (( year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) )); then
            (( ++seen_leap ))
        fi
    done
    assert_equal "${seen_leap}" 0
}

test_random_birthdates_months_are_random() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    declare -A seen_month
    generate=500
    run bash baffling_birthdays.sh random_birthdates "$generate"
    assert_success
    read -d '' -ra output_dates < <(printf '%s\0' "$output")
    for date in "${output_dates[@]}"; do
        month=${date:5:2}

        seen_month[$month]=true
    done
    assert_equal "${#seen_month[@]}" 12
}

test_random_birthdates_days_are_random() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    declare -A seen_day
    generate=500
    run bash baffling_birthdays.sh random_birthdates "$generate"
    assert_success
    read -d '' -ra output_dates < <(printf '%s\0' "$output")
    for date in "${output_dates[@]}"; do
        day=${date:8}

        seen_day[$day]=true
    done
    assert_equal "${#seen_day[@]}" 31
}

# "The expected probability values should be compared using some tolerance to allow for small deviations."
test_estimated_probability_of_at_least_one_shared_birthday_for_one_person() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # The expected probability is 0.0
    run bash baffling_birthdays.sh estimated_probability_of_share_birthday 1
    assert_success
    assert_equal "$output" 0
}

test_estimated_probability_of_at_least_one_shared_birthday_among_ten_people() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # The expected probability is 11.694818
    run bash baffling_birthdays.sh estimated_probability_of_share_birthday 10
    assert_success
    assert_between 9 13
}

test_estimated_probability_of_at_least_one_shared_birthday_among_twentythree_people() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # The expected probability is 50.729723
    run bash baffling_birthdays.sh estimated_probability_of_share_birthday 23
    assert_success
    assert_between 47 53
}

test_estimated_probability_of_at_least_one_shared_birthday_among_seventy_people() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # The expected probability is 99.915958
    run bash baffling_birthdays.sh estimated_probability_of_share_birthday 70
    assert_success
    assert_between 98 100
}
