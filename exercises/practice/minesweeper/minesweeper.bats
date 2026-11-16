#!/usr/bin/env bats
load bats-extra

join() {
    local IFS=$'\n'
    echo "$*"
}

test_no_columns() { # @test
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=( "" )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=( "" )
    assert_output "$(join "${expected[@]}")"
}

test_no_mines() { # @test
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

test_minefield_with_only_mines() { # @test
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

test_mine_surrounded_by_spaces() { # @test
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

test_space_surrounded_by_mines() { # @test
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

test_horizontal_line() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=( " * * " )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=( "1*2*1" )
    assert_output "$(join "${expected[@]}")"
}

test_horizontal_line_mines_at_edges() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=( "*   *" )
    run bash minesweeper.sh "${input[@]}"
    assert_success
    expected=( "*1 1*" )
    assert_output "$(join "${expected[@]}")"
}

test_vertical_line() { # @test
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

test_vertical_line_mines_at_edges() { # @test
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

test_cross() { # @test
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

test_large_minefield() { # @test
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

