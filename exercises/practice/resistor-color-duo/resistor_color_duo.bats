#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-28T23:05:21+00:00
# local version: 2.0.0.0

@test "Brown and black" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh brown black
    assert_success
    assert_output "10"
}

@test "Blue and grey" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh blue grey
    assert_success
    assert_output "68"
}

@test "Yellow and violet" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh yellow violet
    assert_success
    assert_output "47"
}

@test "White and red" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh white red
    assert_success
    assert_output "92"
}

@test "Orange and orange" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh orange orange
    assert_success
    assert_output "33"
}

@test "Ignore additional colors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh green brown orange
    assert_success
    assert_output "51"
}

@test "Black and brown, one-digit" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh black brown
    assert_success
    assert_output "1"
}

@test "invalid color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh foo
    assert_failure
    assert_output --partial "invalid color"
}

@test "one valid color and one invalid color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh blue foo
    assert_failure
    assert_output --partial "invalid color"
}

@test "one invalid color and one valid color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh foo blue
    assert_failure
    assert_output --partial "invalid color"
}
