#!/usr/bin/env bash

declare -ir perimeter=$1
declare -i a b c

# A brute force solution.
# Note that the smallest pythagorean triangle is {3,4,5}
# We'll use those edges in the loop boundaries
# to save a little bit of time.

for (( c = perimeter - 3 - 4; c >= 5; c-- )); do
    for (( b = c - 1; b >= 4; b-- )); do
        a=$(( perimeter - c - b ))
        if  (( 3 <= a && a < b )) &&
            (( a*a + b*b == c*c ))
        then
            echo "$a,$b,$c"
        fi
    done
done
