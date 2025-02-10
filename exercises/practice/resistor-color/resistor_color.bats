#!/usr/bin/env bats
load bats-extra


@test "Color codes -> Black" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color.sh code black
    assert_success
    assert_output "0"
}

@test "Color codes -> White" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color.sh code white
    assert_success
    assert_output "9"
}

@test "Color codes -> Orange" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color.sh code orange
    assert_success
    assert_output "3"
}

@test "Colors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color.sh colors
    assert_success
    assert_equal "${#lines[@]}" 10
    assert_line --index 0 "black"
    assert_line --index 1 "brown"
    assert_line --index 2 "red"
    assert_line --index 3 "orange"
    assert_line --index 4 "yellow"
    assert_line --index 5 "green"
    assert_line --index 6 "blue"
    assert_line --index 7 "violet"
    assert_line --index 8 "grey"
    assert_line --index 9 "white"
}
