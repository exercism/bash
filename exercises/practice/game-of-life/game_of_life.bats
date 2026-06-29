#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:25+00:00
join() {
    local IFS=$'\n'
    echo "$*"
}

@test "empty matrix" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
    )
    expected_rows=(
    )
    expected_string="$(join "${expected_rows[@]}")"
    run bash game_of_life.sh "${input[@]}"
    assert_success
    assert_output "$expected_string"
}

@test "live cells with zero live neighbors die" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "000"
        "010"
        "000"
    )
    expected_rows=(
        "000"
        "000"
        "000"
    )
    expected_string="$(join "${expected_rows[@]}")"
    run bash game_of_life.sh "${input[@]}"
    assert_success
    assert_output "$expected_string"
}

@test "live cells with only one live neighbor die" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "000"
        "010"
        "010"
    )
    expected_rows=(
        "000"
        "000"
        "000"
    )
    expected_string="$(join "${expected_rows[@]}")"
    run bash game_of_life.sh "${input[@]}"
    assert_success
    assert_output "$expected_string"
}

@test "live cells with two live neighbors stay alive" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "101"
        "101"
        "101"
    )
    expected_rows=(
        "000"
        "101"
        "000"
    )
    expected_string="$(join "${expected_rows[@]}")"
    run bash game_of_life.sh "${input[@]}"
    assert_success
    assert_output "$expected_string"
}

@test "live cells with three live neighbors stay alive" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "010"
        "100"
        "110"
    )
    expected_rows=(
        "000"
        "100"
        "110"
    )
    expected_string="$(join "${expected_rows[@]}")"
    run bash game_of_life.sh "${input[@]}"
    assert_success
    assert_output "$expected_string"
}

@test "dead cells with three live neighbors become alive" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "110"
        "000"
        "100"
    )
    expected_rows=(
        "000"
        "110"
        "000"
    )
    expected_string="$(join "${expected_rows[@]}")"
    run bash game_of_life.sh "${input[@]}"
    assert_success
    assert_output "$expected_string"
}

@test "live cells with four or more neighbors die" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "111"
        "111"
        "111"
    )
    expected_rows=(
        "101"
        "000"
        "101"
    )
    expected_string="$(join "${expected_rows[@]}")"
    run bash game_of_life.sh "${input[@]}"
    assert_success
    assert_output "$expected_string"
}

@test "bigger matrix" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "11011000"
        "10110000"
        "11100111"
        "00000110"
        "10001100"
        "11000111"
        "00101001"
        "10000011"
    )
    expected_rows=(
        "11011000"
        "00000110"
        "10111101"
        "10000001"
        "11001001"
        "11010001"
        "10000000"
        "00000011"
    )
    expected_string="$(join "${expected_rows[@]}")"
    run bash game_of_life.sh "${input[@]}"
    assert_success
    assert_output "$expected_string"
}
