#!/usr/bin/env bash

main() {
    local -i w_row w_col b_row b_col

    while getopts :w:b: opt; do
        case $opt in
            w) IFS=, read -r w_row w_col <<< "$OPTARG" ;;
            b) IFS=, read -r b_row b_col <<< "$OPTARG" ;;
            :) die "Missing argument for option -$OPTARG"  ;;
            *) : ;; # ignore invalid options
        esac
    done

    validate white $w_row $w_col
    validate black $b_row $b_col
    (( w_row == b_row && w_col == b_col )) && die "cannot occupy same position"

    local -i d_row=$( abs $(( w_row - b_row )) )
    local -i d_col=$( abs $(( w_col - b_col )) )

    if (( d_row == 0 || d_col == 0 || d_row == d_col ))
    then echo true
    else echo false
    fi
}

die() { echo "$*" >&2; exit 1; }

abs() { echo $(( $1 < 0 ? -$1 : $1 )); }

validate() {
    local player=$1
    local -i row=$2 col=$3

    (( row < 0 )) && die "$player row not positive"
    (( row > 7 )) && die "$player row not on board"
    (( col < 0 )) && die "$player column not positive"
    (( col > 7 )) && die "$player column not on board"
}

main "$@"

