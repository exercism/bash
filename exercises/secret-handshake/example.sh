#!/usr/bin/env bash

main() {
    local code=$1
    local actions=( "wink" "double blink" "close your eyes" "jump" )
    local result=()
    local -i i

    for (( i = 0; i < ${#actions[@]}; i++ )); do
        if (( (code & (1 << i)) != 0 )); then
            result+=( "${actions[i]}" )
        fi
    done

    if (( code >= (1 << ${#actions[@]}) )); then
        reverse result
    fi

    join , "${result[@]}"
}

join() {
    local IFS=$1
    shift
    echo "$*"
}

reverse() {
    local -n ary=$1
    local -i a b
    local tmp

    for (( a=0, b=${#ary[@]} - 1; a < b; a++, b-- )); do
        tmp=${ary[a]}
        ary[a]=${ary[b]}
        ary[b]=$tmp
    done
}

main "$@"
