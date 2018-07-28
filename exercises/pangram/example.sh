#!/usr/bin/env bash

input=$1
#delete non-letters then lowercase, count number of unique letters
letter_count=$(echo $input | tr -dc [:alpha:] | tr '[:upper:]' '[:lower:]' | fold -w1 | sort -u | wc -l)

[[ $letter_count -eq 26 ]] && echo "true" && exit 0

echo "false" && exit 0
