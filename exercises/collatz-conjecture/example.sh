#!/bin/bash

if [ "$1" -gt 0 ]; then
    N=$1
else
    exit 1
fi

STEP=0

while [ "$N" -ne "1" ]
do
    if [ "$(($N % 2))" -eq "0" ]; then
        N=$(($N / 2))
    else
        N=$((($N * 3) + 1))
    fi
    STEP=$(($STEP + 1))
done

echo $STEP
