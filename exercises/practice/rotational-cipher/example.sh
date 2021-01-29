#!/usr/bin/env bash

phrase=$1
rotation=$(( $2 % 26 ))

alphabet=( {a..z} )
rotated=( "${alphabet[@]:rotation}" "${alphabet[@]:0:rotation}" )

## using `tr`:
# from=$(IFS=; echo "${alphabet[*]}${alphabet[*]^^}")
# to=$(IFS=; echo "${rotated[*]}${rotated[*]^^}")
# tr "$from" "$to" <<<"$phrase"

# using plain bash:
declare -A mapping
for (( i=0; i < ${#alphabet[@]}; i++ )); do
    mapping[${alphabet[i]}]=${rotated[i]}
    mapping[${alphabet[i]^^}]=${rotated[i]^^}
done

result=""
for (( i=0; i < ${#phrase}; i++ )); do
    char=${phrase:i:1}
    if [[ -n ${mapping[$char]} ]]; then
        result+=${mapping[$char]}
    else
        result+=$char
    fi
done

echo "$result"
