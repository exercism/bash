#!/usr/bin/env bash

# a 2-D array approach. While bash does not have
# multidimensional arrays, we can fake them using an
# associative array and specially constructed index strings.

declare -A cells=( [0,1]=1 )
declare -i n=$1

for ((i = 1; i <= n; i++ )); do
    # print the leading spaces for this row
    printf "%*s" $((n - i)) ""

    row=()
    for ((j = 1; j <= i; j++)); do
        printf -v a "%d,%d" $((i-1)) $((j-1))
        printf -v b "%d,%d" $((i-1)) $j
        cells[$i,$j]=$((${cells[$a]:-0} + ${cells[$b]:-0}))
        row+=( ${cells[$i,$j]} )
    done
    echo "${row[*]}"
done
