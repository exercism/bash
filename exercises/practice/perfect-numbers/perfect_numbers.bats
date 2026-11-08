#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:23:17+00:00

test_perfect_numbers_smallest_perfect_number_is_classified_correctly() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 6
    assert_success
    assert_output "perfect"
}

test_perfect_numbers_medium_perfect_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 28
    assert_success
    assert_output "perfect"
}

test_perfect_numbers_large_perfect_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 33550336
    assert_success
    assert_output "perfect"
}

test_abundant_numbers_smallest_abundant_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 12
    assert_success
    assert_output "abundant"
}

test_abundant_numbers_medium_abundant_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 30
    assert_success
    assert_output "abundant"
}

test_abundant_numbers_large_abundant_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 33550335
    assert_success
    assert_output "abundant"
}

test_abundant_numbers_perfect_square_abundant_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 196
    assert_success
    assert_output "abundant"
}

test_deficient_numbers_smallest_prime_deficient_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 2
    assert_success
    assert_output "deficient"
}

test_deficient_numbers_smallest_non_prime_deficient_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 4
    assert_success
    assert_output "deficient"
}

test_deficient_numbers_medium_deficient_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 32
    assert_success
    assert_output "deficient"
}

test_deficient_numbers_large_deficient_number_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 33550337
    assert_success
    assert_output "deficient"
}

test_deficient_numbers_edge_case_no_factors_other_than_itself_is_classified_correctly() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 1
    assert_success
    assert_output "deficient"
}

test_invalid_inputs_zero_is_rejected_as_it_is_not_a_positive_integer() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 0
    assert_failure
    assert_output "Classification is only possible for positive integers."
}

test_invalid_inputs_negative_integer_is_rejected_as_it_is_not_a_positive_integer() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh -1
    assert_failure
    assert_output "Classification is only possible for positive integers."
}
