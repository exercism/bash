#!/usr/bin/env bash

# Algorithm taken from Wikipedia:
# https://en.wikipedia.org/wiki/Knapsack_problem
# 
# Define m[i,w] to be the maximum value that can be attained
# with weight less than or equal to w using items up to i
# (first i items).
# 
# We can define m[i,w] recursively as follows:
# 
#     m[0,w] = 0
#     m[i,w] = m[i−1,w] if w_{i} > w (the new item is more than the current weight limit)
#     m[i,w] = max (m[i−1,w], m[i−1, w − w_{i}] + v_{i}) if w_{i} ⩽ w

[[ -z $1 ]] && { echo "missing max weight" >&2; exit 1; }
declare -i max_wt=$1
shift

declare -i n=$#
declare -a weight=(0) value=(0)
for item; do
    IFS=: read -r wt val <<< "$item"
    weight+=("$wt")
    value+=("$val")
done

declare -A m    # the maximum value array

# set the values for the zeroth item
for ((w=1; w <= max_wt; w++)); do
    m[0,$w]=0
done

for ((i=1; i <= n; i++)); do
    j=$((i-1))

    for ((w=1; w <= max_wt; w++)); do 
        if (( weight[i] > w )); then
            m[$i,$w]=${m[$j,$w]}
        else
            a=${m[$j,$w]}
            b=$(( ${m[$j,$((w - weight[i]))]} + value[i] ))
            (( a > b )) && m[$i,$w]=$a || m[$i,$w]=$b
        fi
    done
done

echo "${m[$n,$max_wt]}"
