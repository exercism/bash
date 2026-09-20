#!/usr/bin/env bash

current_year=$(date -d 'now' +%Y)

main() {
    local function=$1; shift

    "$function" "$@"
}

shared_birthday() {
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

# Sets global _random_birthday; avoids subshell fork on each call.
_make_random_birthdate() {
    local -i random_year random_month random_day

    random_year=$(( 1900 + RANDOM % (current_year - 1900 + 1) ))

    # skip leap years
    if (( random_year % 400 == 0 || (random_year % 4 == 0 && random_year % 100 != 0) )); then
        (( random_year++ ))
    fi

    random_month=$(( 1 + RANDOM % 12 ))

    case "$random_month" in
               2) random_day=$(( 1 + RANDOM % 28 )) ;;
        4|6|9|11) random_day=$(( 1 + RANDOM % 30 )) ;;
               *) random_day=$(( 1 + RANDOM % 31 )) ;;
    esac

    # # Zero-pad month and day without a printf subshell
    # local mm dd
    # (( random_month < 10 )) && mm="0${random_month}" || mm="${random_month}"
    # (( random_day   < 10 )) && dd="0${random_day}"   || dd="${random_day}"

    # _random_birthday="${random_year}-${mm}-${dd}"
    printf -v _random_birthday "%04d-%02d-%02d" "$random_year" "$random_month" "$random_day"
}

random_birthdates() {
    local -i number=$1
    local -a birthdates

    for (( i = 0; i < number; i++ )); do
        _make_random_birthdate
        birthdates+=( "$_random_birthday" )
    done

    echo "${birthdates[@]}"
}

# Sets global _has_shared (1=true, 0=false); avoids subshell fork on each call.
_check_shared_birthday() {
    local -A birthdays
    local birthdate birthday

    for birthdate in "$@"; do
        birthday=${birthdate: -5}
        (( birthdays[$birthday]++ ))
    done

    if (( ${#birthdays[@]} == $# )); then
        _has_shared=0
    else
        _has_shared=1
    fi
}

estimated_probability_of_share_birthday() {
    local -i group_size=$1
    # the more you increase the 'runs' value,
    # the more the result is approaching the expected one
    # but the more you increase the computing time!
    local -i runs=2000
    local -i count=0
    local -a birthdates

    for (( i = 0; i <= runs; i++ )); do
        # Generate birthdates inline - no subshell fork
        birthdates=()
        for (( j = 0; j < group_size; j++ )); do
            _make_random_birthdate
            birthdates+=( "$_random_birthday" )
        done

        # Check for shared birthday inline - no subshell fork
        _check_shared_birthday "${birthdates[@]}"
        (( count += _has_shared ))
    done

    echo "$(( count * 100 / runs ))"
}

main "$@"
