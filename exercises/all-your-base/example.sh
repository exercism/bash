#!/bin/bash

main() {
    validate_bases "$1" "$3"

    local -i from_base=$1
    local    from_digits=$2
    local -i to_base=$3

    # We're going to use an unquoted variable to take
    # advantage of word splitting. However, we don't want to
    # be affected by pathname expansion, so we must turn off
    # that feature.
    set -f
    local digits=( $from_digits )
    set +f

    local -i decimal=0
    for digit in "${digits[@]}"; do
        validate_digit "$digit" "$from_base"
        decimal=$(( from_base * decimal + digit ))
    done

    digits=()
    while (( decimal > 0 )); do
        digit=$(( decimal % to_base ))
        decimal=$(( decimal / to_base ))
        digits=( "$digit" "${digits[@]}" )
    done

    echo "${digits[*]}"
}

validate_bases() {
    local -i from_base=$1
    local -i to_base=$2

    (( from_base > 1 )) || die "From base must be greater than 1"
    (( to_base   > 1 )) || die "To base must be greater than 1"
}

validate_digit() {
    local -i digit=$1
    local -i from_base=$2

    (( digit < from_base )) || die "Digit must be less than the from base"
    (( digit >= 0 )) || die "Digit cannot be negative"
}

die() {
    echo "$*" >&2
    exit 1
}

main "$@"
