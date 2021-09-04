#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.2.0.1
# bash-specific test: Input validation


@test "finds the smallest palindrome from single digit factors" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1 9
    assert_success
    assert_output --regexp "^1:"      # starts with the palindrome
    assert_output --partial "[1, 1]"  # contains the factors
}

@test "finds the largest palindrome from single digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 1 9
    assert_success
    assert_output --regexp "^9:"      # starts with the palindrome
    assert_output --partial "[1, 9]"  # contains the factors
    assert_output --partial "[3, 3]"  # contains the factors
}

@test "find the smallest palindrome from double digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 10 99
    assert_success
    assert_output --regexp "^121:"      # starts with the palindrome
    assert_output --partial "[11, 11]"  # contains the factors
}

@test "find the largest palindrome from double digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 10 99
    assert_success
    assert_output --regexp "^9009:"     # starts with the palindrome
    assert_output --partial "[91, 99]"  # contains the factors
}

@test "find smallest palindrome from triple digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 100 999
    assert_success
    assert_output --regexp "^10201:"      # starts with the palindrome
    assert_output --partial "[101, 101]"  # contains the factors
}

@test "find the largest palindrome from triple digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 100 999
    assert_success
    assert_output --regexp "^906609:"     # starts with the palindrome
    assert_output --partial "[913, 993]"  # contains the factors
}

@test "find smallest palindrome from four digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1000 9999
    assert_success
    assert_output --regexp "^1002001:"      # starts with the palindrome
    assert_output --partial "[1001, 1001]"  # contains the factors
}

@test "find the largest palindrome from four digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 1000 9999
    assert_success
    assert_output --regexp "^99000099:"     # starts with the palindrome
    assert_output --partial "[9901, 9999]"  # contains the factors
}

@test "empty result for smallest if no palindrome in the range" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1002 1003
    assert_success
    refute_output   # no output
}

@test "empty result for largest if no palindrome in the range" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 15 15
    assert_success
    refute_output
}

@test "error result for smallest if min is more than max" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 10000 1
    assert_failure
    assert_output --partial "min must be <= max"
}

@test "error result for largest if min is more than max" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 2 1
    assert_failure
    assert_output --partial "min must be <= max"
}

@test "error result for first param" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh foo 2 3
    assert_failure
    assert_output --partial "first arg should be 'smallest' or 'largest'"
}
