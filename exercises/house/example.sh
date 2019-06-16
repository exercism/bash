#!/usr/bin/env bash

declare -a items that

items+=( "house that Jack built."           ); that+=( ""            )
items+=( "malt"                             ); that+=( "lay in"      )
items+=( "rat"                              ); that+=( "ate"         )
items+=( "cat"                              ); that+=( "killed"      )
items+=( "dog"                              ); that+=( "worried"     )
items+=( "cow with the crumpled horn"       ); that+=( "tossed"      )
items+=( "maiden all forlorn"               ); that+=( "milked"      )
items+=( "man all tattered and torn"        ); that+=( "kissed"      )
items+=( "priest all shaven and shorn"      ); that+=( "married"     )
items+=( "rooster that crowed in the morn"  ); that+=( "woke"        )
items+=( "farmer sowing his corn"           ); that+=( "kept"        )
items+=( "horse and the hound and the horn" ); that+=( "belonged to" )

main() {
    local -i start=$1 end=$2
    if ! ((1 <= start && start <= 12)); then
        echo "invalid input" >&2
        exit 1
    elif ! ((1 <= end && end <= 12)); then
        echo "invalid input" >&2
        exit 1
    fi

    for ((i = start - 1; i < end; i++)); do
        verse "$i"
        echo
    done
}

verse() {
    local -i n=$1
    printf "This is the %s\n" "${items[n]}"
    for ((; n>0; n--)); do
        printf "that %s the %s\n" "${that[n]}" "${items[n-1]}"
    done
}

main "$@"
