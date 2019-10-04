#!/usr/bin/env bash

# canonical-data version: 1.0.0

@test "Orange and orange and black" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "orange" "orange" "black"
    [[ $status -eq 0 ]]
    [[ $output == "33 ohms" ]]
}

@test "Blue and grey and brown" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "blue" "grey" "brown"
    [[ $status -eq 0 ]]
    [[ $output == "680 ohms" ]]
}

@test "Brown and red and red" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "brown" "red" "red"
    [[ $status -eq 0 ]]
    [[ $output == "1200 ohms" ]]
}

@test "Red and black and red" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "red" "black" "red"
    [[ $status -eq 0 ]]
    [[ $output == "2 kiloohms" ]]
}

@test "Green and brown and orange" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "green" "brown" "orange"
    [[ $status -eq 0 ]]
    [[ $output == "51 kiloohms" ]]
}

@test "Yellow and violet and yellow" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "yellow" "violet" "yellow"
    [[ $status -eq 0 ]]
    [[ $output == "470 kiloohms" ]]
}

@test "Blue and violet and grey" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "blue" "violet" "grey"
    [[ $status -eq 0 ]]
    [[ $output == "6700 megaohms" ]]
}

@test "Minimum possible value" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "black" "black" "black"
    [[ $status -eq 0 ]]
    [[ $output == "0 ohms" ]]
}

@test "Maximum possible value" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "white" "white"
    [[ $status -eq 0 ]]
    [[ $output == "99 gigaohms" ]]
}


@test "Invalid first color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "foo" "white" "white"
    [[ $status -eq 1 ]]
    [[ -n $output ]]
}

@test "Invalid second color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "bar" "white"
    [[ $status -eq 1 ]]
    [[ -n $output ]]
}

@test "Invalid third color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "white" "baz"
    [[ $status -eq 1 ]]
    [[ -n $output ]]
}
