#!/usr/bin/env bash

# external tools used: awk, sort

characteristics=(
    strength
    dexterity
    constitution
    intelligence
    wisdom
    charisma
)

main() {
    case $1 in
        modifier|generate) "$@" ;;
        *) echo "unknown subcommand" >&2; exit 1 ;;
    esac
}

modifier() {
    local -i n=$1
    # call out to awk for floating point math.
    awk -v n="$n" 'BEGIN {
        mod = (n - 10) / 2
        mod -= (mod < 0 ? 0.5 : 0)  # round down
        print int(mod)
    }'
}

generate() {
    local a c hp
    for c in "${characteristics[@]}"; do
        a=$(ability)
        printf "%s %d\n" "$c" "$(ability)"
        [[ $c == constitution ]] && hp=$(( 10 + $(modifier $a) ))
    done
    echo "hitpoints $hp"
}

ability() {
    set -- $( { d6; d6; d6; d6; } | sort -nr )  
    echo $(( $1 + $2 + $3 ))
}

# roll a 6-sided die
d6() { echo $(( 1 + RANDOM % 6 )); }

main "$@"
