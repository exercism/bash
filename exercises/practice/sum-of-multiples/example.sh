#!/usr/bin/env bash

limit=$1; shift
multiples=()

for f in $@; do
    # non-positive input does not contribute any factors
    (( f > 0 )) || continue

    for (( i = f; i < limit; i += f )); do
        if (( i % f == 0 )); then
            # storing the multiples as array indices,
            # to act like a set of values
            multiples[$i]=1
        fi
    done
done

# add up the array indices
sum=0
for m in ${!multiples[@]}; do (( sum += m )); done

echo $sum
