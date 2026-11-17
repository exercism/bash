#!/usr/bin/env bash

if [ "$1" -gt 0 ]; then
    N=$1
else
    echo "Error: Only positive integers are allowed"
    exit 1
fi

STEP=0

while (( N != 1 )); do
    if (( N % 2 == 0 )); then
        N=$(( N / 2 ))
    else
        N=$(( N * 3 + 1))
    fi
    (( ++STEP ))
done

echo "$STEP"
