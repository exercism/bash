#!/usr/bin/env bats
load bats-extra

join() {
    local IFS=$'\n'
    echo "$*"
}

@test "empty matrix" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=( "" )
    run bash game_of_life.sh "${input[@]}"
    assert_success
    expected=( "" )
    assert_output "$(join "${expected[@]}")"
}

@test "live cells with zero live neighbors die" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "0, 0, 0"
        "0, 1, 0"
        "0, 0, 0"
    )
    run bash game_of_life.sh "${input[@]}"
    assert_success
    expected=(
        "0, 0, 0"
        "0, 0, 0"
        "0, 0, 0"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "live cells with only one live neighbor die" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "0, 0, 0"
        "0, 1, 0"
        "0, 1, 0"
    )
    run bash game_of_life.sh "${input[@]}"
    assert_success
    expected=(
        "0, 0, 0"
        "0, 0, 0"
        "0, 0, 0"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "live cells with two live neighbors stay alive" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "1, 0, 1"
        "1, 0, 1"
        "1, 0, 1"
    )
    run bash game_of_life.sh "${input[@]}"
    assert_success
    expected=(
        "0, 0, 0"
        "1, 0, 1"
        "0, 0, 0"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "live cells with three live neighbors stay alive" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "0, 1, 0"
        "1, 0, 0"
        "1, 1, 0"
    )
    run bash game_of_life.sh "${input[@]}"
    assert_success
    expected=(
        "0, 0, 0"
        "1, 0, 0"
        "1, 1, 0"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "dead cells with three live neighbors become alive" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "1, 1, 0"
        "0, 0, 0"
        "1, 0, 0"
    )
    run bash game_of_life.sh "${input[@]}"
    assert_success
    expected=(
        "0, 0, 0"
        "1, 1, 0"
        "0, 0, 0"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "live cells with four or more neighbors die" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "1, 1, 1"
        "1, 1, 1"
        "1, 1, 1"
    )
    run bash game_of_life.sh "${input[@]}"
    assert_success
    expected=(
        "1, 0, 1"
        "0, 0, 0"
        "1, 0, 1"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "bigger matrix" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "1, 1, 0, 1, 1, 0, 0, 0"
        "1, 0, 1, 1, 0, 0, 0, 0"
        "1, 1, 1, 0, 0, 1, 1, 1"
        "0, 0, 0, 0, 0, 1, 1, 0"
        "1, 0, 0, 0, 1, 1, 0, 0"
        "1, 1, 0, 0, 0, 1, 1, 1"
        "0, 0, 1, 0, 1, 0, 0, 1"
        "1, 0, 0, 0, 0, 0, 1, 1"
    )
    run bash game_of_life.sh "${input[@]}"
    assert_success
    expected=(
        "1, 1, 0, 1, 1, 0, 0, 0"
        "0, 0, 0, 0, 0, 1, 1, 0"
        "1, 0, 1, 1, 1, 1, 0, 1"
        "1, 0, 0, 0, 0, 0, 0, 1"
        "1, 1, 0, 0, 1, 0, 0, 1"
        "1, 1, 0, 1, 0, 0, 0, 1"
        "1, 0, 0, 0, 0, 0, 0, 0"
        "0, 0, 0, 0, 0, 0, 1, 1"
    )
    assert_output "$(join "${expected[@]}")"
}
