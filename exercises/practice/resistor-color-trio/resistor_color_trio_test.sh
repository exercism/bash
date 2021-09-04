#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.0.0.2
# additional tests for: invalid color, invalid octal number, too many colors

@test "Orange and orange and black" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "orange" "orange" "black"
    assert_success
    assert_output "33 ohms"
}

@test "Blue and grey and brown" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "blue" "grey" "brown"
    assert_success
    assert_output "680 ohms"
}

@test "Brown and red and red" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "brown" "red" "red"
    assert_success
    assert_output "1200 ohms"
}

@test "Red and black and red" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "red" "black" "red"
    assert_success
    assert_output "2 kiloohms"
}

@test "Green and brown and orange" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "green" "brown" "orange"
    assert_success
    assert_output "51 kiloohms"
}

@test "Yellow and violet and yellow" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "yellow" "violet" "yellow"
    assert_success
    assert_output "470 kiloohms"
}

@test "Blue and violet and grey" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "blue" "violet" "grey"
    assert_success
    assert_output "6700 megaohms"
}

@test "Minimum possible value" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "black" "black" "black"
    assert_success
    assert_output "0 ohms"
}

@test "Maximum possible value" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "white" "white"
    assert_success
    assert_output "99 gigaohms"
}


@test "Invalid first color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "foo" "white" "white"
    assert_failure
    assert_output    # there is _some_ output
}

@test "Invalid second color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "bar" "white"
    assert_failure
    assert_output    # there is _some_ output
}

@test "Invalid third color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "white" "baz"
    assert_failure
    assert_output    # there is _some_ output
}

@test "First two colors make an invalid octal number" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "black" "grey" "black"
    assert_success
    assert_output "8 ohms"
}

@test "Ignore extra colors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "blue" "green" "yellow" "orange"
    assert_success
    assert_output "650 kiloohms"
}
