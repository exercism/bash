#!/usr/bin/env bash

# this requires bash 4.3+ for the use of namerefs

main() {
    local -i amount=$1; shift
    local -a denonimations=( "$@" )
    local -a firstCoinForValue=()

    if (( amount < 0 )); then
        echo "target can't be negative" >&2
        exit 1
    fi
    (( amount == 0 )) && exit 0

    # populates the `firstCoinForValue` array
    change $amount denonimations firstCoinForValue

    make_change $amount denonimations firstCoinForValue
}

#   Change making algorithm from
#   http://www.ccs.neu.edu/home/jaa/CSG713.04F/Information/Handouts/dyn_prog.pdf
#
#   This function generates two arrays:
#
#   C = maps the minimum number of coins required to make change
#       for each n from 1 to amount.  It is returned but only
#       used internally in this application.
#
#   S = the _first_ coin used to make change for amount n
#       (actually stores the coin _index_ into the coins array)
change() {
    local -i amount=$1
    local -n coins=$2
    local -n S=$3
    local -a C
    local -i max=99999999
    local i p min coin

    C=(0)
    S=(0)
    for ((i = 1; i <= amount; i++)); do
        C+=( $max )
        S+=( "" )
    done

    for ((p = 1; p <= amount; p++)); do
        min=$max
        coin=""
        for ((i=0; i < ${#coins[@]}; i++)); do
            if (( coins[i] <= p )); then
                if ((1 + C[p - coins[i]] < min )); then
                    min=$((1 + ${C[p - coins[i]]} ))
                    coin=$i
                fi
            fi
        done
        C[p]=$min
        S[p]=$coin
    done
}

make_change() {
    local -i amount=$1
    local -n coins=$2
    local -n S=$3
    local -a change=()
    local coin idx

    if [[ -z ${S[amount]} ]]; then
        echo "can't make target with given coins" >&2
        exit 1
    fi

    while (( amount > 0 )); do
        idx=${S[amount]}
        coin=${coins[idx]}
        change+=( $coin )
        (( amount -= coin ))
    done

    printf "%d\n" "${change[@]}" | sort -n | paste -sd" "
}

main "$@"
