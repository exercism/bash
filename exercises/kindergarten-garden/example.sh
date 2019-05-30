#!/usr/bin/env bash
# shellcheck disable=SC2034

declare -A plants=([G]=grass [C]=clover [R]=radishes [V]=violets)

# list of students
students=(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)

# map of student -> index
declare -A studentIdx
for i in "${!students[@]}"; do studentIdx[${students[i]}]=$i; done


main() {
    local -i sidx
    sidx=${studentIdx[$2]}

    local -a plots
    parse "$1" plots

    expand "${plots[sidx]}"
}


# Given an input diagram like $'ABCDEF\nGHIJKL'
# populate the named array with: ("ABGH" "CDIJ" "EFKL")
parse() {
    local -n __plots=$2
    local row1 row2

    # split the first argument on newlines into row vars
    { read -r row1; read -r row2; } <<< "$1"

    while [[ -n $row1 ]]; do
        __plots+=( "${row1:0:2}${row2:0:2}" )
        row1=${row1#??}
        row2=${row2#??}
    done
}


# Given a "plant code" string like "VRCG",
# print a  list of plant names: "violets radishes clover grass"
expand() {
    local -a result=()
    local plot=$1 plant i
    for ((i=0; i<${#plot}; i++)); do
        plant=${plot:i:1}
        result+=( "${plants[$plant]}" )
    done
    echo "${result[*]}"
}


main "$@"
