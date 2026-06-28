#!/usr/bin/env bats
load bats-extra

join() {
    local IFS=$'\n'
    echo "$*"
}

@test "Can identify single saddle point" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "9 8 7"
        "5 3 2"
        "6 6 7"
    )
    expected=(
        "row: 2"
        "column: 1"
    )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}

@test "Can identify that empty matrix has no saddle points" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=( "" )
    expected=( "" )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}

@test "Can identify lack of saddle points when there are none" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "1 2 3"
        "3 1 2"
        "2 3 1"
    )
    expected=( "" )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}

@test "Can identify multiple saddle points in a column" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "4 5 4"
        "3 5 5"
        "1 5 4"
    )
    expected=(
        "row: 1"
        "column: 2"
        "row: 2"
        "column: 2"
        "row: 3"
        "column: 2"
    )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}

@test "Can identify multiple saddle points in a row" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "6 7 8"
        "5 5 5"
        "7 5 6"
    )
    expected=(
        "row: 2"
        "column: 1"
        "row: 2"
        "column: 2"
        "row: 2"
        "column: 3"
    )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}

@test "Can identify saddle point in bottom right corner" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "8 7 9"
        "6 7 6"
        "3 2 5"
    )
    expected=(
        "row: 3"
        "column: 3"
    )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}

@test "Can identify saddle points in a non square matrix" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "3 1 3"
        "3 2 4"
    )
    expected=(
        "row: 1"
        "column: 1"
        "row: 1"
        "column: 3"
    )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}

@test "Can identify that saddle points in a single column matrix are those with the minimum value" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "2"
        "1"
        "4"
        "1"
    )
    expected=(
        "row: 2"
        "column: 1"
        "row: 4"
        "column: 1"
    )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}

@test "Can identify that saddle points in a single row matrix are those with the maximum value" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "2 5 3 5"
    )
    expected=(
        "row: 1"
        "column: 2"
        "row: 1"
        "column: 4"
    )
    run bash saddle_points.sh "${input[@]}"
    assert_success
    assert_output "$(join "${expected[@]}")"
}
