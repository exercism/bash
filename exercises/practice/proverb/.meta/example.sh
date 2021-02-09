#!/usr/bin/env bash

(($# == 0)) && exit

for ((i=1; i<$#; i++)); do
    j=$(( i + 1 ))
    echo "For want of a ${!i} the ${!j} was lost."
done
echo "And all for the want of a $1."
