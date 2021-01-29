#!/usr/bin/env bash

# simple nested looping algorithm works, but is brutally slow...
#
# $ time bash palindrome_products.sh smallest 100 999
# 10201: [101, 101]
#        25.56 real        25.47 user         0.04 sys
#
# $ time bash palindrome_products.sh smallest 1000 9999
# 1002001: [1001, 1001]
#      4641.36 real      2459.31 user         2.98 sys


main() {
    local which=$1
    local -i min=$2 max=$3

    # validation
    (( min <= max )) || die "min must be <= max"
    case $which in
        smallest|largest) : ;;
        *) die "first arg should be 'smallest' or 'largest'" ;;
    esac

    local -i i j prod
    local -a palindromes

    for ((i = min; i <= max; i++)); do
        for ((j = i; j <= max; j++)); do
            prod=$(( i * j ))
            if is_palindrome "$prod"; then
                palindromes[$prod]+=" [$i, $j]"
            fi
        done
    done

    if [[ ${#palindromes[@]} -gt 0 ]]; then
        local -a pals
        readarray -t pals < <(
            printf "%s\n" "${!palindromes[@]}" | sort -n
        )
        local -i idx
        [[ $which == smallest ]] && idx=0 || idx=$((${#pals[@]} - 1))
        local -i pal=${pals[idx]}
        echo "$pal:${palindromes[pal]}"
    fi
}

die() {
    echo "$*" >&2
    exit 1
}

is_palindrome() {
    local word=$1
    local -i i j len=${#word}
    for ((i = len / 2; i >= 0; i--)); do
        j=$(( len - i - 1 ))
        [[ ${word:i:1} == "${word:j:1}" ]] || return 1
    done
}

main "$@"
