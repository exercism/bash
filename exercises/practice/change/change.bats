#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_change_for_1_cent() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="1"
    coins=(1 5 10 25)
    run bash change.sh 1 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_single_coin_change() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="25"
    coins=(1 5 10 25 100)
    run bash change.sh 25 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_multiple_coin_change() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="5 10"
    coins=(1 5 10 25 100)
    run bash change.sh 15 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_change_with_lilliputian_coins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="4 4 15"
    coins=(1 4 15 20 50)
    run bash change.sh 23 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_change_with_lower_elbonia_coins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="21 21 21"
    coins=(1 5 10 21 25)
    run bash change.sh 63 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_large_target_values() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 2 5 20 20 50 100 100 100 100 100 100 100 100 100"
    coins=(1 2 5 10 20 50 100)
    run bash change.sh 999 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_possible_change_without_unit_coins_available() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 2 2 5 10"
    coins=(2 5 10 20 50)
    run bash change.sh 21 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_another_possible_change_without_unit_coins_available() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="4 4 4 5 5 5"
    coins=(4 5)
    run bash change.sh 27 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_a_greedy_approach_is_not_optimal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="10 10"
    coins=(1 10 11)
    run bash change.sh 20 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_no_coins_make_0_change() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=""
    coins=(1 5 10 21 25)
    run bash change.sh 0 "${coins[@]}"
    assert_success
    assert_output "$expected"
}

test_error_testing_for_change_smaller_than_the_smallest_of_coins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="can't make target with given coins"
    coins=(5 10)
    run bash change.sh 3 "${coins[@]}"
    assert_failure
    assert_output --partial "$expected"
}

test_error_if_no_combination_can_add_up_to_target() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="can't make target with given coins"
    coins=(5 10)
    run bash change.sh 94 "${coins[@]}"
    assert_failure
    assert_output --partial "$expected"
}

test_cannot_find_negative_change_values() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="target can't be negative"
    coins=(1 2 5)
    run bash change.sh -5 "${coins[@]}"
    assert_failure
    assert_output --partial "$expected"
}
