#!/usr/bin/env bash

days=(
    "" first second third fourth fifth sixth
    seventh eighth ninth tenth eleventh twelfth
)

gifts=(
    ""
    "a Partridge in a Pear Tree"
    "two Turtle Doves"
    "three French Hens"
    "four Calling Birds"
    "five Gold Rings"
    "six Geese-a-Laying"
    "seven Swans-a-Swimming"
    "eight Maids-a-Milking"
    "nine Ladies Dancing"
    "ten Lords-a-Leaping"
    "eleven Pipers Piping"
    "twelve Drummers Drumming"
)

main() {
    local -i i
    for ((i=$1; i<=$2; i++)); do
        verse $i
    done
}

verse() {
    local presents=()
    local -i n=$1 i
    local and
    for ((i=n; i > 0; i--)); do
        and=""
        ((n > 1)) && ((i == 1)) && and=" and"
        presents+=( "${and} ${gifts[i]}" )
    done
    printf "On the %s day of Christmas my true love gave to me:%s.\n" \
        "${days[n]}" \
        "$(IFS=,; echo "${presents[*]}")"
}

main "$@"
