#!/usr/bin/env bats
load bats-extra

# local version: 2.1.0.1
# add test for invalid color

@test "brown black" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh brown black
    assert_success
    assert_output "10"
}

@test "blue grey" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh blue grey
    assert_success
    assert_output "68"
}

@test "yellow violet" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh yellow violet
    assert_success
    assert_output "47"
}

@test "white red" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh white red
    assert_success
    assert_output "92"
}

@test "orange orange" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh orange orange
    assert_success
    assert_output "33"
}

@test "invalid color" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh foo
    assert_failure
    assert_output --partial "invalid color"
}

@test "ignore too many colors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh green brown orange
    assert_success
    assert_output "51"
}

@test "black brown" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh black brown
    assert_success
    assert_output "1"
}

@test "black grey" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh black grey
    assert_success
    assert_output "8"
}
