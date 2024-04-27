#!/usr/bin/env bats
load bats-extra

join() {
    local IFS=$'\n'
    echo "$*"
}

@test "no columns" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=( "" )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=( "" )
    assert_output "$(join "${expected[@]}")"
}

@test "no mines" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "   "
        "   "
        "   "
    )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=(
        "   "
        "   "
        "   "
    )
    assert_output "$(join "${expected[@]}")"
}

@test "minefield with only mines" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "***"
        "***"
        "***"
    )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=(
        "***"
        "***"
        "***"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "mine surrounded by spaces" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "   "
        " * "
        "   "
    )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=(
        "111"
        "1*1"
        "111"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "space surrounded by mines" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "***"
        "* *"
        "***"
    )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=(
        "***"
        "*8*"
        "***"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "horizontal line" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=( " * * " )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=( "1*2*1" )
    assert_output "$(join "${expected[@]}")"
}

@test "horizontal line, mines at edges" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=( "*   *" )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=( "*1 1*" )
    assert_output "$(join "${expected[@]}")"
}

@test "vertical line" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        " "
        "*"
        " "
        "*"
        " "
    )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=(
        "1"
        "*"
        "2"
        "*"
        "1"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "vertical line, mines at edges" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "*"
        " "
        " "
        " "
        "*"
    )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=(
        "*"
        "1"
        " "
        "1"
        "*"
    )
    assert_output "$(join "${expected[@]}")"
}

@test "cross" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "  *  "
        "  *  "
        "*****"
        "  *  "
        "  *  "
    )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=(
        " 2*2 "
        "25*52"
        "*****"
        "25*52"
        " 2*2 "
    )
    assert_output "$(join "${expected[@]}")"
}

@test "large minefield" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        " *  * "
        "  *   "
        "    * "
        "   * *"
        " *  * "
        "      "
    )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=(
        "1*22*1"
        "12*322"
        " 123*2"
        "112*4*"
        "1*22*2"
        "111111"
    )
    assert_output "$(join "${expected[@]}")"
}

