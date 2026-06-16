#!/usr/bin/env bash

current_year=$(date -d "now" +%Y)

main() {
    local function=$1; shift

    "$function" "$@"
}

shared_birthday () {
    local -a birthdates=( "$@" )
    local -A birthdays

    for birthdate in "${birthdates[@]}"; do
        birthday=${birthdate: -5}

        (( birthdays[$birthday]++ ))
    done

    if (( ${#birthdays[@]} == ${#birthdates[@]} )); then
        echo "false"
    else
        echo "true"
    fi
}

random_int() {
    echo "$(( RANDOM % $1 ))"
}

random_birthdates () {
    local -i number=$1
    local -i random_year random_month random_day
    local -a birthdates

    for (( i = 0; i < number; i++ )); do
        random_year=$(( 1900 + $(random_int $(( current_year - 1900 + 1 ))) ))
        random_month=$(( 1 + $(random_int 12) ))

        if (( random_year % 400 == 0 || (random_year % 4 == 0 && random_year % 100 != 0) )); then
            (( random_year++ ))
        fi

        case "$random_month" in
                   2) random_day=$(( 1 + $(random_int 28) )) ;;
            4|6|9|11) random_day=$(( 1 + $(random_int 30) )) ;;
                   *) random_day=$(( 1 + $(random_int 31) )) ;;
        esac

        birthdates+=( "$(printf '%d-%02d-%02d' "$random_year" "$random_month" "$random_day")" )
    done

    echo "${birthdates[@]}"
}

estimated_probability_of_share_birthday () {
    local -i group_size=$1
    # the more you increase the 'runs' value,
    # the more the result is approching the expected one
    # but the more you increase the computing time!
    local -i runs=2000
    local -i count=0

    for (( i = 0; i <= runs; i++ )); do
        read -ra birthdates < <(random_birthdates "$group_size")
        if "$(shared_birthday "${birthdates[@]}")"; then
            (( count++ ))
        fi
    done

    echo "$(( count * 100 / runs ))"
}

main "$@"
