#!/usr/bin/env bash

# local version: 2.1.0.1
# add test for invalid color

@test "brown black" {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash resistor_color_duo.sh brown black
    [[ $status -eq 0 ]]
    [[ $output == "10" ]]
}

@test "blue grey" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash resistor_color_duo.sh blue grey
    [[ $status -eq 0 ]]
    [[ $output == "68" ]]
}

@test "yellow violet" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash resistor_color_duo.sh yellow violet
    [[ $status -eq 0 ]]
    [[ $output == "47" ]]
}

@test "orange orange" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash resistor_color_duo.sh orange orange
    [[ $status -eq 0 ]]
    [[ $output == "33" ]]
}

@test "invalid color" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash resistor_color_duo.sh foo
    [[ $status -eq 1 ]]
    [[ $output == *"invalid color"* ]]
}

@test "ignore too many colors" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash resistor_color_duo.sh green brown orange
    [[ $status -eq 0 ]]
    [[ $output == "51" ]]
}
