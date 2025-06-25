#!/usr/bin/env bash

# some global vars
declare -A board
height=$#
width=${#1}

parse_input() {
    local rownum=0 row col index char
    for row in "$@"; do
        for ((col = 0; col < "${#row}"; col++)); do
            index="${rownum},${col}"
            char=${row:col:1}
            board[$index]=$char
        done
        (( rownum++ ))
    done
}

count() {
    local r=$1 c=$2
    local count=0
    for dr in -1 0 1; do
        (( r + dr < 0 || r + dr == height )) && continue
        for dc in -1 0 1; do
            (( c + dc < 0 || c + dc == width )) && continue
            (( dr == 0 && dc == 0 )) && continue
            index="$((r + dr)),$((c + dc))"
            [[ ${board[$index]} == "*" ]] && (( count++ ))
        done
    done
    (( count == 0 )) && echo " " || echo "$count"
}

create_output() {
    local row output col
    for ((row = 0; row < height; row++)); do
        output=""
        for ((col = 0; col < width; col++)); do
            if [[ ${board[$row,$col]} == "*" ]]; then
                output+="*"
            else
                output+=$( count "$row" "$col" )
            fi
        done
        echo "$output"
    done
}

parse_input "$@"
create_output
