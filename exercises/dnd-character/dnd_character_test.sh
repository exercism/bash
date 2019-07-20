#!/usr/bin/env bash

# usage: dnd_character.sh modifier n
# -> output expected modifier

# usage: dnd_character.sh generate
# -> output each characteristic and ability value, one per line


# ability modifier

@test "ability modifier for score 3 is -4" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 3
    [[ $status -eq 0 ]]
    [[ $output == "-4" ]]
}

@test "ability modifier for score 4 is -3" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 4
    [[ $status -eq 0 ]]
    [[ $output == "-3" ]]
}

@test "ability modifier for score 5 is -3" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 5
    [[ $status -eq 0 ]]
    [[ $output == "-3" ]]
}

@test "ability modifier for score 6 is -2" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 6
    [[ $status -eq 0 ]]
    [[ $output == "-2" ]]
}

@test "ability modifier for score 7 is -2" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 7
    [[ $status -eq 0 ]]
    [[ $output == "-2" ]]
}

@test "ability modifier for score 8 is -1" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 8
    [[ $status -eq 0 ]]
    [[ $output == "-1" ]]
}

@test "ability modifier for score 9 is -1" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 9
    [[ $status -eq 0 ]]
    [[ $output == "-1" ]]
}

@test "ability modifier for score 10 is 0" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 10
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "ability modifier for score 11 is 0" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 11
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "ability modifier for score 12 is +1" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 12
    [[ $status -eq 0 ]]
    [[ $output == "1" ]]
}

@test "ability modifier for score 13 is +1" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 13
    [[ $status -eq 0 ]]
    [[ $output == "1" ]]
}

@test "ability modifier for score 14 is +2" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 14
    [[ $status -eq 0 ]]
    [[ $output == "2" ]]
}

@test "ability modifier for score 15 is +2" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 15
    [[ $status -eq 0 ]]
    [[ $output == "2" ]]
}

@test "ability modifier for score 16 is +3" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 16
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test "ability modifier for score 17 is +3" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 17
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test "ability modifier for score 18 is +4" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh modifier 18
    [[ $status -eq 0 ]]
    [[ $output == "4" ]]
}


# generate a character, validate expected output

@test "generate a character" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash dnd_character.sh generate
    [[ $status -eq 0 ]]
    echo "$output" | grep -qE '^strength [[:digit:]]+$'
    echo "$output" | grep -qE '^dexterity [[:digit:]]+$'
    echo "$output" | grep -qE '^constitution [[:digit:]]+$'
    echo "$output" | grep -qE '^intelligence [[:digit:]]+$'
    echo "$output" | grep -qE '^wisdom [[:digit:]]+$'
    echo "$output" | grep -qE '^charisma [[:digit:]]+$'
    echo "$output" | grep -qE '^hitpoints [[:digit:]]+$'
    # and no other output
    [[ "$(echo "$output" | wc -l)" -eq 7 ]]
}


# random ability is within range"
@test "validate ability and hitpoint range" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    for i in {1..50}; do
        while read c v; do
            if [[ $c == "hitpoints" ]]; then
                (( 6 <= v && v <= 14 ))
            else
                (( 3 <= v && v <= 18 ))
            fi
        done < <( run bash dnd_character.sh generate )
    done
}
