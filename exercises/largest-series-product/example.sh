#!/usr/bin/env bash

series=$1
declare -i span=$2

die() { echo "$*" >&2; exit 1; }

nondig="*[^[:digit:]]*"   # contains a non-digit

[[ $series == $nondig ]]  && die "input must only contain digits"       # pattern is unquoted
(( span > ${#series} ))   && die "span must be smaller than string length"
(( span < 0 ))            && die "span must be greater than zero"

declare -i max=0
declare -i product

if (( span == 0 )); then
    max=1
else
    for ((i=0; i <= ${#series} - span; i++)); do
        product=1
        for ((j=0; j < span; j++)); do
            (( product *= ${series:i+j:1} ))
        done
        (( product > max )) && max=$product
    done
fi

echo $max
