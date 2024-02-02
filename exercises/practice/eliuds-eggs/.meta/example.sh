#!/usr/bin/env bash

eggCount() {
    local -i number=$1 count=0
    while (( number > 0 )); do
        (( count += number & 1 ))
        (( number >>= 1 ))
    done
    echo "$count"
}

eggCount "$1"
