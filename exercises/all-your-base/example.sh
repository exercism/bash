#!/bin/bash

# We're going to have an unquoted variable to take
# advantage of word splitting. However, we don't want to
# be affected by pathname expansion, so we must turn off
# that feature.
set -f

main() {
    local -i from_base=$1
    local    from_digits=$2
    local -i to_base=$3

    (( from_base > 1 )) || die "From base must be greater than 1"
    (( to_base   > 1 )) || die "To base must be greater than 1"

    local -i digits=( $from_digits )   # <= unquoted variable
    local -i decimal=0

    for digit in "${digits[@]}"; do
        (( digit < from_base )) || die "Digit must be less than the from base"
        (( digit >= 0 )) || die "Digit cannot be negative"
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

die() {
    echo "$*" >&2
    exit 1
}

main "$@"
