#!/usr/bin/env bash

binary_search() {
    local -i elem=$1; shift
    local -a list=( "$@" )
    local -i i=0
    local -i j=$(( ${#list[@]} - 1 ))

    while (( i <= j )); do
        mid=$(( (i + j) / 2 ))
        if (( elem == list[mid] )); then
            echo $mid
            return
        elif (( elem < list[mid] )); then
            j=$(( mid - 1 ))
        else
            i=$(( mid + 1 ))
        fi
    done

    # not found
    echo "-1"
}

binary_search "$@"
