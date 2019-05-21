#!/usr/bin/env bash

colors=(
    black brown red orange yellow 
    green blue violet grey white
)

if [[ $# -eq 0 ]]; then
    echo "${colors[*]}"
else
    code=""
    for i in "${!colors[@]}"; do
        if [[ ${colors[i]} == "$1" ]]; then
            code=$i
            break
        fi
    done

    if [[ -n $code ]]; then
        echo "$code"
    else
        echo "invalid color" >&2
        exit 1
    fi
fi
