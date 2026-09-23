#!/usr/bin/env bash

guess() {
    local word="$1"; shift
    local -a guesses=( "$@" )
    local state="Ongoing"
    local remaining_failures=9
    local masked_word=${word//?/_}
    local i

    for guess in "${guesses[@]}"; do
        if [[ $state == "Win" ]]; then
            echo "cannot guess after the game is won" >&2
            exit 1
        elif [[ $state == "Lose" ]]; then
            echo "cannot guess after the game is lost" >&2
            exit 1
        fi

        if [[ -n $guess && $word =~ $guess && ! $masked_word =~ $guess ]]; then
            for (( i = 0; i < ${#word}; i++ )); do
                if [[ ${word:i:1} == "$guess" ]]; then
                    masked_word="${masked_word:0:i}${guess}${masked_word:i+1}"
                fi
            done
            if [[ ! $masked_word =~ "_" ]]; then
                state="Win"
            fi
        elif [[ -n $guess ]]; then
            if (( remaining_failures == 0 )); then
                state="Lose"
            else
                (( remaining_failures -- ))
            fi
        fi
    done

    printf "State: %s\nMasked word: %s\nRemaining failures: %s" "$state" "$masked_word" "$remaining_failures"
}

guess "$@"
