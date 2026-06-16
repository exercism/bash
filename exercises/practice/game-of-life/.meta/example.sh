#!/usr/bin/env bash

declare -A matrix
declare -i height width

create_matrix() {
    local -i col row=0

    while read -r line; do
        for (( col = 0; col < ${#line}; col++ )); do
            matrix[${col},${row}]=${line:col:1}
        done

        height=${#line}
        (( row++ ))
    done < <(printf "%s\n" "$@")

    width=$row
}

tick() {
    local -A next_matrix
    local -i row col countLiveCell

    for (( row = 0; row < height; row++ )); do
        for (( col = 0; col < width; col++ )); do
            countLiveCell=$(check_neighborhood "$col" "$row")

            if (( countLiveCell == 3 || matrix[${col},${row}] == 1 && countLiveCell == 2 )); then
                next_matrix[${col},${row}]=1
            else
                next_matrix[${col},${row}]=0
            fi
        done
    done

    print_next_matrix "next_matrix"
}

check_neighborhood() {
    local cell_col=$1 cell_row=$2
    local -i neighb_row neighb_col
    local -i count=0

    for check_row in -1 0 1; do
        neighb_row=$(( check_row + cell_row ))
        (( neighb_row < 0 || neighb_row >= height )) && continue
        for check_col in -1 0 1; do
            neighb_col=$(( check_col + cell_col ))
            (( neighb_col < 0 || neighb_col >= width )) && continue
            (( check_row == 0 && check_col == 0 )) && continue

            (( count+=${matrix[${neighb_col},${neighb_row}]} ))
        done
    done

    echo "$count"
}

print_next_matrix() {
    local -n array=$1
    local -i row col
    local output

    for (( row = 0; row < height; row++ )); do
        output=""
        for (( col = 0; col < width; col++ )); do
            output+="${array[${col},${row}]}"
        done
       echo "$output"
    done
}

create_matrix "$@"
tick
