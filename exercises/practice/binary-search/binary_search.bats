#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_finds_a_value_in_an_array_with_one_element() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=0
    input=(6)
    run bash binary_search.sh 6 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_finds_a_value_in_the_middle_of_an_array() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=3
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 6 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_finds_a_value_at_the_beginning_of_an_array() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=0
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 1 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_finds_a_value_at_the_end_of_an_array() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=6
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 11 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_finds_a_value_in_an_array_of_odd_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=9
    input=(1 3 5 8 13 21 34 55 89 144 233 377 634)
    run bash binary_search.sh 144 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_finds_a_value_in_an_array_of_even_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=5
    input=(1 3 5 8 13 21 34 55 89 144 233 377)
    run bash binary_search.sh 21 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_identifies_that_a_value_is_not_included_in_the_array() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="-1"
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 7 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_a_value_smaller_than_the_array_s_smallest_value_is_not_found() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="-1"
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 0 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_a_value_larger_than_the_array_s_largest_value_is_not_found() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="-1"
    input=(1 3 4 6 8 9 11)
    run bash binary_search.sh 13 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_nothing_is_found_in_an_empty_array() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="-1"
    input=()
    run bash binary_search.sh 1 "${input[@]}"
    assert_success
    assert_output "$expected"
}

test_nothing_is_found_when_the_left_and_right_bounds_cross() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="-1"
    input=(1 2)
    run bash binary_search.sh 0 "${input[@]}"
    assert_success
    assert_output "$expected"
}
