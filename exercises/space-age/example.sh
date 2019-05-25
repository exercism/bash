#!/usr/bin/env bash

secondsPerEarthYear=31557600

declare -A relativeOrbit=(
    [Mercury]=0.2408467
    [Venus]=0.61519726
    [Earth]=1.0
    [Mars]=1.8808158
    [Jupiter]=11.862615
    [Saturn]=29.447498
    [Uranus]=84.016846
    [Neptune]=164.79132
)

if [[ -z ${relativeOrbit[$1]} ]]; then
    echo "error: not a planet: $1" >&2
    exit 1
fi

# demonstrating the need to call out to an external program
# to do floating point math
awk -v s="$2" \
    -v o="${relativeOrbit[$1]}" \
    -v y="$secondsPerEarthYear" \
    'BEGIN {printf "%.2f", s / y / o}'
