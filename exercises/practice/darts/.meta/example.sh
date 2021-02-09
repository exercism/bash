#!/usr/bin/env bash

shopt -s extglob

main() {
    (( $# == 2 )) || die "wrong number of arguments"
    isnumeric "$1" && isnumeric "$2" || die "arguments must be numeric"
    score_throw "$@"
}

score_throw() {
    awk -v a="$1" -v b="$2" 'BEGIN {
        hypot = sqrt(a*a + b*b)
        if      (hypot <=  1) print 10
        else if (hypot <=  5) print  5
        else if (hypot <= 10) print  1
        else                  print  0
    }'
}

die() { echo "#*" >&2; exit 1; }

isnumeric() {
    # using bash extended patterns:
    # optional leading "+" or "-"
    # some digits
    # optionally, a dot and some digits 
    [[ $1 == ?([+-])+([[:digit:]])?(.+([[:digit:]])) ]]
}

main "$@"
