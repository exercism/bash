#!/usr/bin/env bash

declare -A cols rows found

create_matrix() {
    local -i col row=0
    while read -r line; do
        for ((col = 0; col < ${#line}; col++)); do
            cols[${col}]+="${line:col:1}"
            rows[${row}]+="${line:col:1}"
        done
        (( row++ ))
    done < <(printf "%s\n" "${@// /}")
}

find_min() {
    local -i smallest

    for col in "${!cols[@]}"; do
        smallest=9
        values=${cols[$col]}

        for ((i = 0; i < ${#values}; i++)); do
            if (( ${values:i:1} < smallest )); then
                smallest=${values:i:1}
            fi
        done

        for ((i = 0; i < ${#values}; i++)); do
            if (( ${values:i:1} == smallest )); then
                (( found[${i},${col}]++ ))
            fi
        done
    done
}

find_max() {
    local -i largest

    for row in "${!rows[@]}"; do
        largest=0
        values=${rows[$row]}

        for ((i = 0; i < ${#values}; i++)); do
            if (( ${values:i:1} > largest )); then
                largest=${values:i:1}
            fi
        done

        for ((i = 0; i < ${#values}; i++)); do
            if (( ${values:i:1} == largest )); then
               (( found[${row},${i}]++ ))
            fi
        done
    done
}

saddlePoints() {
    local found_trees

    for coord in "${!found[@]}"; do
        if (( ${found[$coord]} == 2 )); then
            found_trees+=":$(( ${coord//,/} + 11 ))"
        fi
    done

    sorted=$(tr ':' '\n' <<< "${found_trees% }" | sort -n | tr -d '\n')

    for ((i = 0; i < ${#sorted}; i+=2)); do
        printf "row: %d\n" "${sorted:$i:1}"
        printf "column: %d\n" "${sorted:$i+1:1}"
    done
}

create_matrix "$@"
find_min
find_max
saddlePoints
