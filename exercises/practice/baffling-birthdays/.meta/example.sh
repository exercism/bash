#!/usr/bin/env bash

main() {
    local function=$1; shift

    $function "$@"
}

sharedBirthday () {
    local -a birthdates=( "$@" )
    local -A birthdays

    for birthdate in "${birthdates[@]}"; do
        birthday=${birthdate: -5}

        (( birthdays[$birthday] ++ ))
    done

    if (( ${#birthdays[@]} == ${#birthdates[@]} )); then
        echo "false"
    else
        echo "true"
    fi
}

randomBirthdates () {
    local -i number=$1
    local -i actual_year random_year random_month random_day
    local -a birthdates

    actual_year=$(date -d "now" +%Y)

    for ((i = 0; i < number; i++)); do
        random_year=$(shuf -n 1 -i 1900-${actual_year})
        random_month=$(shuf -n 1 -i 1-12)

        if (( random_year % 400 == 0 || (random_year % 4 == 0 && random_year % 100 != 0) )); then
            (( random_year ++ ))
        fi

        if (( random_month == 2 )); then
            random_day=$(shuf -n 1 -i 1-28)
        elif [[ $random_month =~ ^(4|6|9|11)$ ]]; then
            random_day=$(shuf -n 1 -i 1-30)
        else
            random_day=$(shuf -n 1 -i 1-31)
        fi

        birthdates+=( "$(date -d "${random_year}-${random_month}-${random_day}" +%F)" )
    done

    echo "${birthdates[@]}"
}

estimatedProbabilityOfSharedBirthday () {
    local -i group_size=$1
    # the more you increase the 'runs' value, 
    # the more the result is approching the expected one
    # but the more you increase the computing time!
    local -i runs=1000
    local -i count=0
    local result


    for ((i = 0; i <= runs; i++)); do
        if [[ $(sharedBirthday $(randomBirthdates $group_size)) == "true" ]]; then
            (( ++ count ))
        fi
    done

    result="$(LC_NUMERIC=C printf "%.2f\n" "$(echo "scale=2; ($count * 100) / $runs" | bc)")"

    echo "$result"
}

main "$@"
