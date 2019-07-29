#!/usr/bin/env bash

# I'm taking some liberties with quoting since I know
# what the values are.

# global vars
declare -ra COLORS=(
    black brown red orange yellow
    green blue violet grey white
)
declare -ra PREFIXES=("" kilo mega giga)


main() {
    local -i a b c

    a=$(indexof "$1") || die "unknown color '$1'"
    b=$(indexof "$2") || die "unknown color '$2'"
    c=$(indexof "$3") || die "unknown color '$3'"

    with_units $(value $a $b $c) ohms
}

die() { echo "$*" >&2; exit 1; }

indexof() {
    local color=$1 i
    for (( i=0; i<=${#COLORS[@]}; i++)); do
        if [[ $color == ${COLORS[i]} ]]; then
            echo $i
            return
        fi
    done
    return 1
}

value() {
    echo $(( 10#${1}${2} * 10 ** $3 ))
}

with_units() {
    local value=$1 unit=$2
    local i=0
    while [[ $value == *000 ]]; do
        value=${value%000}
        ((i++))
    done
    echo "$value ${PREFIXES[i]}$unit"
}

main "$@"
