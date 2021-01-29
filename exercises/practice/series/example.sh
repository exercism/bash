#!/usr/bin/env bash

die() { echo "$*" >&2; exit 1; }

series=$1
len=${#series}
slice=$2
sequences=()

(( slice == 0 ))  && die "slice length cannot be zero"
(( slice <  0 ))  && die "slice length cannot be negative"
(( len == 0 ))    && die "series cannot be empty"
(( len < slice )) && die "slice length cannot be greater than series length"

for ((i=0; i <= len - slice; i++)); do
    sequences+=( "${series:i:slice}" )
done

echo "${sequences[*]}"
