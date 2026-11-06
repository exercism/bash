#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_square_the_sum_of_the_numbers_up_to_the_given_number_square_of_sum_1() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh square_of_sum 1
    assert_success
    assert_output "1"
}

test_square_the_sum_of_the_numbers_up_to_the_given_number_square_of_sum_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh square_of_sum 5
    assert_success
    assert_output "225"
}

test_square_the_sum_of_the_numbers_up_to_the_given_number_square_of_sum_100() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh square_of_sum 100
    assert_success
    assert_output "25502500"
}

test_sum_the_squares_of_the_numbers_up_to_the_given_number_sum_of_squares_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh sum_of_squares 1
    assert_success
    assert_output "1"
}

test_sum_the_squares_of_the_numbers_up_to_the_given_number_sum_of_squares_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh sum_of_squares 5
    assert_success
    assert_output "55"
}

test_sum_the_squares_of_the_numbers_up_to_the_given_number_sum_of_squares_100() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh sum_of_squares 100
    assert_success
    assert_output "338350"
}

test_subtract_sum_of_squares_from_square_of_sums_difference_of_squares_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh difference 1
    assert_success
    assert_output "0"
}

test_subtract_sum_of_squares_from_square_of_sums_difference_of_squares_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh difference 5
    assert_success
    assert_output "170"
}

test_subtract_sum_of_squares_from_square_of_sums_difference_of_squares_100() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash difference_of_squares.sh difference 100
    assert_success
    assert_output "25164150"
}
