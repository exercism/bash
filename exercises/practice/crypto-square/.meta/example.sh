#!/usr/bin/env bash

# remove non-alphanumeric chars from input and store as lowercase
declare -l input=${1//[^[:alnum:]]/}

limit="${#input}"
for (( size = 0; size * size < limit; size++ )); do :; done

# split into segments
segments=()
for (( i = 0; i < ${#input}; i += size )); do
    segments+=( "${input:i:size}" )
done

# transpose the segments array
declare -a transposed
for (( i = 0; i < size; i++ )); do
    for ((j=0; j<${#segments[@]}; j++)); do
        transposed[i]+=${segments[j]:i:1}
    done
done

# pad elements with spaces if necessary
for i in "${!transposed[@]}"; do
    printf -v transposed[i] "%-*s" ${#segments[@]} "${transposed[i]}"
done

# print space-separated
echo "${transposed[*]}"
