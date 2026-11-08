#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_no_multiples_within_limit() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 1 3 5
    assert_success
    assert_output "0"
}

test_one_factor_has_multiples_within_limit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 4 3 5
    assert_success
    assert_output "3"
}

test_more_than_one_multiple_within_limit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 7 3
    assert_success
    assert_output "9"
}

test_more_than_one_factor_with_multiples_within_limit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 10 3 5
    assert_success
    assert_output "23"
}

test_each_multiple_is_only_counted_once() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 100 3 5
    assert_success
    assert_output "2318"
}

test_a_much_larger_limit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 1000 3 5
    assert_success
    assert_output "233168"
}

test_three_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 20 7 13 17
    assert_success
    assert_output "51"
}

test_factors_not_relatively_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 15 4 6
    assert_success
    assert_output "30"
}

test_some_pairs_of_factors_relatively_prime_and_some_not() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 150 5 6 8
    assert_success
    assert_output "4419"
}

test_one_factor_is_a_multiple_of_another() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 51 5 25
    assert_success
    assert_output "275"
}

test_much_larger_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 10000 43 47
    assert_success
    assert_output "2203160"
}

test_all_numbers_are_multiples_of_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 100 1
    assert_success
    assert_output "4950"
}

test_no_factors_means_an_empty_sum() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 10000 
    assert_success
    assert_output "0"
}

test_the_only_multiple_of_0_is_0() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 1 0
    assert_success
    assert_output "0"
}

test_the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 4 3 0
    assert_success
    assert_output "3"
}

test_solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 10000 2 3 5 7 11
    assert_success
    assert_output "39614537"
}
