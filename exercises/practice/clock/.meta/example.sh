#!/usr/bin/env bash

shopt -s extglob

die() { echo "$*" >&2; exit 1; }

isnumeric() {
    [[ $1 == ?([+-])+([[:digit:]]) ]]
}

main() {
    (( $# == 2 || $# == 4 )) || die "invalid arguments"

    isnumeric "$1" || die "non-numeric argument"
    isnumeric "$2" || die "non-numeric argument"

    local -i h=$1 m=$2

    # ensure the hours and minutes are positive
    while ((m < 0)); do ((m += 60, h -= 1)); done
    while ((h < 0)); do ((h += 24)); done

    local -i minutes=$(( 60 * h + m ))

    case $3 in
        [+-]) 
            isnumeric "$4" || die "non-numeric argument"
            minutes=$(( minutes $3 $4 ))
            ;;
        "") : ;;
        *)  die "invalid arguments" ;;
    esac

    # no DST here, wall clock only
    while ((minutes < 0)); do ((minutes += (24*60))); done

    printf "%02d:%02d\n" $(( (minutes / 60) % 24 )) $((minutes % 60))
}

main "$@"
