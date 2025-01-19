#!/bin/bash

declare -a nums=(no one two three four five six seven eight nine ten)

main() {
    if (( $# != 2 )); then
        echo "2 arguments expected" >&2
        exit 1
    elif (( $1 < $2 )); then
        echo "cannot generate more verses than bottles" >&2
	exit 1
    fi
    for (( i = 0; i < $2; i++ )); do
        verse $(( $1 - i ))
    done
}

verse() {
    local cur=$(bottles "$1")
    local next=$(bottles "$(( $1 - 1 ))")
    printf "%s hanging on the wall,\n" "${cur^}"
    printf "%s hanging on the wall,\n" "${cur^}"
    printf "And if one green bottle should accidentally fall,\n"
    printf "There'll be %s hanging on the wall.\n" "${next}"
    printf "\n"
}

bottles() {
    if (( $1 == 1 )); then
        echo "${nums[$1]} green bottle"
    else
        echo "${nums[$1]} green bottles"
    fi
}

main "$@"
