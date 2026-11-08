#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T22:03:12+00:00
join() {
    local IFS=$'\n'
    echo "$*"
}

test_empty_matrix() { # @test
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

test_live_cells_with_zero_live_neighbors_die() { # @test
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

test_live_cells_with_only_one_live_neighbor_die() { # @test
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

test_live_cells_with_two_live_neighbors_stay_alive() { # @test
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

test_live_cells_with_three_live_neighbors_stay_alive() { # @test
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

test_dead_cells_with_three_live_neighbors_become_alive() { # @test
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

test_live_cells_with_four_or_more_neighbors_die() { # @test
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

test_bigger_matrix() { # @test
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
