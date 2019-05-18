#!/usr/bin/env bash

beasts=( fly spider bird cat dog goat cow horse )

declare -A catchphrase=(
    [spider]="It wriggled and jiggled and tickled inside her."
    [bird]="How absurd to swallow a bird!"
    [cat]="Imagine that, to swallow a cat!"
    [dog]="What a hog, to swallow a dog!"
    [goat]="Just opened her throat and swallowed a goat!"
    [cow]="I don't know how she swallowed a cow!"
    [horse]="She's dead, of course!"
)

main() {
    if (( $# != 2 )); then
        echo "Error: 2 arguments expected." >&2
        echo "Usage: $0 startVerse endVerse" >&2
        exit 1
    fi
    local -i start=$1 end=$2
    if (( start > end )); then
        echo "Error: Start must be less than or equal to End" >&2
        exit 1
    fi

    for ((i = start; i <= end; i++)); do
        verse "$i"
    done
}

verse() {
    local n=$1
    local i=$((n - 1))
    local beast=${beasts[i]}
    echo "I know an old lady who swallowed a $beast."
    [[ -n ${catchphrase[$beast]} ]] && echo "${catchphrase[$beast]}"
    [[ $beast == horse ]] && return

    for ((; i >= 1; i--)); do
        local predator=${beasts[i]}
        local prey=${beasts[i-1]}
        [[ $prey == spider ]] && prey+=" that wriggled and jiggled and tickled inside her"
        echo "She swallowed the $predator to catch the $prey."
    done
    echo "I don't know why she swallowed the fly. Perhaps she'll die."
    echo
}

main "$@"
