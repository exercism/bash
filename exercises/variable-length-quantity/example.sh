#!/usr/bin/env bash

declare -ri SHIFT=7
declare -ri MSB=0x80    # 0b10000000, "most significant bit"
declare -ri MASK=0x7F   # 0b01111111


die() { echo "$*" >&2; exit 1; }


encode() {
    result=()
    for value in "$@"; do
        printf -v val "%d" "0x${value}"
        bytes=()
        msb=0
        while true; do
            printf -v byte "%02X" $(( (val & MASK) | msb ))
            bytes=( "$byte" "${bytes[@]}" )
            msb=$MSB
            val=$(( val >> SHIFT ))
            (( val == 0 )) && break
        done
        result+=( "${bytes[@]}" )
    done
    echo "${result[*]}"
}


decode() {
    printf -v last_val "%d" "0x${!#}"
    if (( (last_val & MSB) != 0 )); then
        die "incomplete byte sequence"
    fi

    values=()
    n=0
    for byte in "$@"; do
        printf -v val "%d" "0x${byte}"
        n=$(( (n << SHIFT) + (val & MASK) ))
        if (( (val & MSB) == 0 )); then
            values+=( "$(printf "%02X" $n)" )
            n=0
        fi
    done
    echo "${values[*]}"
}


case $1 in
    encode|decode) "$@" ;;
    *) die "unknown subcommand" ;;
esac
