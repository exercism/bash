#!/usr/bin/env bash

# the quick brown fox jumps over the lazy dog
# 5 rails
#
# t       k       f       s       h       d    : tkfshd
#  h     c _     _ o     p _     t e     _ o   : hc__co_te_o
#   e   i   b   n   x   m   o   _   _   y   g  : eibnxmo__yg
#    _ u     r w     _ u     v r     l z       : _urw_uvrlz
#     q       o       j       e       a        : qojea
# 
# 
# the quick brown fox jumps over the lazy dog
# tkfshdhc  co te oeibnxmo  yg urw uvrlzqojea

main() {
    local OPTIND OPTARG
    local func rails

    while getopts :e:d: opt; do
        case $opt in
            e) func=encode; rails=$OPTARG;;
            d) func=decode; rails=$OPTARG;;
            :) die "missing argument for -$OPTARG";;
            ?) die "unknown option -$OPTARG";;
        esac
    done
    [[ -z $func ]] && die "specify -e or -d"
    (( rails <= 0 )) && die "must have positive number of rails"
    shift $((OPTIND - 1))
    $func $rails "$1"
}

encode() {
    local -i n=$1
    local plaintext=$2
    local ciphertext=""
    # length of a "down & up cycle"
    local -i cycle=$(( 2 * (n - 1) ))
    local -i i j idx

    for ((i=0; i < n; i++)); do
        for ((j=0; j <= ${#plaintext}/n; j++)); do
            idx=$(( i + j * cycle ))
            (( idx >= ${#plaintext} )) && break
            ciphertext+=${plaintext:idx:1}
            if (( 0 < i && i < n-1 )); then
                idx=$(( (cycle - i) + j * cycle ))
                (( idx >= ${#plaintext} )) && break
                ciphertext+=${plaintext:idx:1}
            fi
        done
    done

    echo "$ciphertext"
}

decode() {
    local -i n=$1
    local ciphertext=$2
    local plaintext
    # a string spaces of the appropriate length
    printf -v plaintext "%*s" ${#ciphertext} ""

    local -i cycle=$(( 2 * (n - 1) ))
    local -i i j idx k=0

    for ((i=0; i < n; i++)); do
        for ((j=0; j <= ${#plaintext}/n; j++)); do
            idx=$(( i + j * cycle ))
            (( idx >= ${#ciphertext} )) && break
            putAt $idx "${ciphertext:k++:1}" plaintext
            if (( 0 < i && i < n-1 )); then
                idx=$(( (cycle - i) + j * cycle ))
                (( idx >= ${#ciphertext} )) && break
                putAt $idx "${ciphertext:k++:1}" plaintext
            fi
        done
    done

    echo "$plaintext"
}

# In a string variable, set the character at a specific index
# to be the given new character.
# First char is at index 0
putAt() {
    local -i idx=$1
    local char=${2:- }
    local -n str=$3
    if (( 0 <= idx && idx < ${#str} )); then
        str=${str:0:idx}${char}${str:idx+1}
    fi
}

die() { echo "$*" >&2; exit 1; }

main "$@"
