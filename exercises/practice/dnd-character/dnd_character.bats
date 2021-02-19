#!/usr/bin/env bash

# local version: 1.1.0.0

# usage: dnd_character.sh modifier n
# -> output expected modifier

# usage: dnd_character.sh generate
# -> output each characteristic and ability value, one per line

: ${BATS_ADDON_DIR:=/usr/local/lib}
load "${BATS_ADDON_DIR}/bats-support/load.bash"
load "${BATS_ADDON_DIR}/bats-assert/load.bash"

# ability modifier

@test "ability modifier for score 3 is -4" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 3
    assert_success
    assert_output "-4"
}

@test "ability modifier for score 4 is -3" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 4
    assert_success
    assert_output "-3"
}

@test "ability modifier for score 5 is -3" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 5
    assert_success
    assert_output "-3"
}

@test "ability modifier for score 6 is -2" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 6
    assert_success
    assert_output "-2"
}

@test "ability modifier for score 7 is -2" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 7
    assert_success
    assert_output "-2"
}

@test "ability modifier for score 8 is -1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 8
    assert_success
    assert_output "-1"
}

@test "ability modifier for score 9 is -1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 9
    assert_success
    assert_output "-1"
}

@test "ability modifier for score 10 is 0" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 10
    assert_success
    assert_output "0"
}

@test "ability modifier for score 11 is 0" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 11
    assert_success
    assert_output "0"
}

@test "ability modifier for score 12 is +1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 12
    assert_success
    assert_output "1"
}

@test "ability modifier for score 13 is +1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 13
    assert_success
    assert_output "1"
}

@test "ability modifier for score 14 is +2" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 14
    assert_success
    assert_output "2"
}

@test "ability modifier for score 15 is +2" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 15
    assert_success
    assert_output "2"
}

@test "ability modifier for score 16 is +3" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 16
    assert_success
    assert_output "3"
}

@test "ability modifier for score 17 is +3" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 17
    assert_success
    assert_output "3"
}

@test "ability modifier for score 18 is +4" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 18
    assert_success
    assert_output "4"
}


# generate a character, validate expected output

@test "generate a character" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh generate
    assert_success
    # the lines do not necessarily have to be in this order.
    assert_line --regexp '^strength [[:digit:]]+$'
    assert_line --regexp '^dexterity [[:digit:]]+$'
    assert_line --regexp '^constitution [[:digit:]]+$'
    assert_line --regexp '^intelligence [[:digit:]]+$'
    assert_line --regexp '^wisdom [[:digit:]]+$'
    assert_line --regexp '^charisma [[:digit:]]+$'
    assert_line --regexp '^hitpoints [[:digit:]]+$'
    # and no other output
    assert_equal "${#lines[@]}" "7"
}


# random ability is within range"
@test "validate ability and hitpoint range" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    for i in {1..50}; do
        run bash dnd_character.sh generate
        assert_success
        printf '%s\n' "$output" \
        | while read -r char val; do
            case $char in
                hitpoints) (( 6 <= val && val <= 14 )) ;;
                *)         (( 3 <= val && val <= 18 )) ;;
            esac
        done
    done
}
