#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_find_the_smallest_palindrome_from_single_digit_factors() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1 9
    assert_success
    # starts with the palindrome
    assert_output --regexp "^1:"
    # contains the factors
    assert_output --partial "[1, 1]"
}

test_find_the_largest_palindrome_from_single_digit_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 1 9
    assert_success
    # starts with the palindrome
    assert_output --regexp "^9:"
    # contains the factors
    assert_output --partial "[1, 9]"
    assert_output --partial "[3, 3]"
}

test_find_the_smallest_palindrome_from_double_digit_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 10 99
    assert_success
    # starts with the palindrome
    assert_output --regexp "^121:"
    # contains the factors
    assert_output --partial "[11, 11]"
}

test_find_the_largest_palindrome_from_double_digit_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 10 99
    assert_success
    # starts with the palindrome
    assert_output --regexp "^9009:"
    # contains the factors
    assert_output --partial "[91, 99]"
}

test_find_the_smallest_palindrome_from_triple_digit_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 100 999
    assert_success
    # starts with the palindrome
    assert_output --regexp "^10201:"
    # contains the factors
    assert_output --partial "[101, 101]"
}

test_find_the_largest_palindrome_from_triple_digit_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 100 999
    assert_success
    # starts with the palindrome
    assert_output --regexp "^906609:"
    # contains the factors
    assert_output --partial "[913, 993]"
}

test_find_the_smallest_palindrome_from_four_digit_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1000 9999
    assert_success
    # starts with the palindrome
    assert_output --regexp "^1002001:"
    # contains the factors
    assert_output --partial "[1001, 1001]"
}

test_find_the_largest_palindrome_from_four_digit_factors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 1000 9999
    assert_success
    # starts with the palindrome
    assert_output --regexp "^99000099:"
    # contains the factors
    assert_output --partial "[9901, 9999]"
}

test_empty_result_for_smallest_if_no_palindrome_in_the_range() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1002 1003
    assert_success
    refute_output
}

test_empty_result_for_largest_if_no_palindrome_in_the_range() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 15 15
    assert_success
    refute_output
}

test_error_result_for_smallest_if_min_is_more_than_max() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 10000 1
    assert_failure
    assert_output --partial "min must be <= max"
}

test_error_result_for_largest_if_min_is_more_than_max() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 2 1
    assert_failure
    assert_output --partial "min must be <= max"
}

test_smallest_product_does_not_use_the_smallest_factor() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 3215 4000
    assert_success
    # starts with the palindrome
    assert_output --regexp "^10988901:"
    # contains the factors
    assert_output --partial "[3297, 3333]"
}

test_error_result_for_first_param() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh foo 2 3
    assert_failure
    assert_output --partial "first arg should be 'smallest' or 'largest'"
}
