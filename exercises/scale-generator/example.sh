#!/usr/bin/env bash

sharp_scale=( A "A#" B C "C#" D "D#" E F "F#" G "G#" )
flat_scale=( A Bb B C Db D Eb E F Gb G Ab )
flats=( F Bb Eb Ab Db Gb d g c f bb eb )

main() {
    (( $# == 0 )) && die "not enough arguments "
    (( $#  > 2 )) && die "too many arguments "

    local tonic=$1
    local intervals=${2:-mmmmmmmmmmmm}

    local notes
    if in_array "$tonic" "${flats[@]}"; then
        notes=( "${flat_scale[@]}" )
    else
        notes=( "${sharp_scale[@]}" )
    fi

    local note=${tonic^}
    local idx=$(index "$note" "${notes[@]}")
    (( idx != -1 )) || die "invalid tonic"

    # rotate the notes
    notes=( "${notes[@]:idx}" "${notes[@]:0:idx}" )

    apply_intervals "$intervals" "${notes[@]}"
}

die() {
    echo "$*" >&2
    exit 1
}

index() {
    local elem=$1
    shift
    local ary=( "$@" )
    local i
    for (( i = 0; i < ${#ary[@]}; i++ )); do
        if [[ $elem == "${ary[i]}" ]]; then
            echo $i
            return
        fi
    done
    echo -1
}

in_array() {
    local elem=$1
    shift
    (( $( index "$elem" "$@" ) != -1 ))
}

apply_intervals() {
    local intervals=$1
    shift
    local notes=( "$@" )

    local -A steps=( [m]=1 [M]=2 [A]=3 )
    local step
    local -i idx i
    local scale=()

    for (( i=0, idx=0; i < ${#intervals}; i++ )); do
        step=${steps[${intervals:i:1}]}
        [[ -n $step ]] || die "invalid interval"
        scale+=( "${notes[idx]}" )
        (( idx += step ))
    done
    echo "${scale[*]}"
}

main "$@"
