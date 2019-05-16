#!/bin/bash

if (( $# < 2 )); then
    echo "usage: ${0##*/} <code> <command> [args ...]" >&2
    exit 255
fi

code=$1
cmd=$2

allergens=(
  eggs peanuts shellfish strawberries
  tomatoes chocolate pollen cats
)

index_test() {
    local code=$1 idx=$2
    (( (code & (1 << idx)) != 0 ))
}

case $cmd in
    list)
        allergies=()
        for i in "${!allergens[@]}"; do
            if index_test "$code" "$i"; then
                allergies+=( "${allergens[i]}" )
            fi
        done
        echo "${allergies[*]}"
        ;;

    allergic_to)
        allergen=$3
        if [[ -z "$allergen" ]]; then
            echo "error: missing argument" >&2
            exit 255
        fi
        for i in "${!allergens[@]}"; do
            if [[ ${allergens[i]} == "$allergen" ]] &&
               index_test "$code" "$i"
            then
                exit 0
            fi
        done
        exit 1
        ;;
esac

