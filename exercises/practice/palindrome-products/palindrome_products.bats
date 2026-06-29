#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test "find the smallest palindrome from single digit factors" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1 9
    assert_success
    # starts with the palindrome
    assert_output --regexp "^1:"
    # contains the factors
    assert_output --partial "[1, 1]"
}

@test "find the largest palindrome from single digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 1 9
    assert_success
    # starts with the palindrome
    assert_output --regexp "^9:"
    # contains the factors
    assert_output --partial "[1, 9]"
    assert_output --partial "[3, 3]"
}

@test "find the smallest palindrome from double digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 10 99
    assert_success
    # starts with the palindrome
    assert_output --regexp "^121:"
    # contains the factors
    assert_output --partial "[11, 11]"
}

@test "find the largest palindrome from double digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 10 99
    assert_success
    # starts with the palindrome
    assert_output --regexp "^9009:"
    # contains the factors
    assert_output --partial "[91, 99]"
}

@test "find the smallest palindrome from triple digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 100 999
    assert_success
    # starts with the palindrome
    assert_output --regexp "^10201:"
    # contains the factors
    assert_output --partial "[101, 101]"
}

@test "find the largest palindrome from triple digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 100 999
    assert_success
    # starts with the palindrome
    assert_output --regexp "^906609:"
    # contains the factors
    assert_output --partial "[913, 993]"
}

@test "find the smallest palindrome from four digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1000 9999
    assert_success
    # starts with the palindrome
    assert_output --regexp "^1002001:"
    # contains the factors
    assert_output --partial "[1001, 1001]"
}

@test "find the largest palindrome from four digit factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh largest 1000 9999
    assert_success
    # starts with the palindrome
    assert_output --regexp "^99000099:"
    # contains the factors
    assert_output --partial "[9901, 9999]"
}

@test "empty result for smallest if no palindrome in the range" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 1002 1003
    assert_success
    refute_output
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

@test "smallest product does not use the smallest factor" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh smallest 3215 4000
    assert_success
    # starts with the palindrome
    assert_output --regexp "^10988901:"
    # contains the factors
    assert_output --partial "[3297, 3333]"
}

@test "error result for first param" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash palindrome_products.sh foo 2 3
    assert_failure
    assert_output --partial "first arg should be 'smallest' or 'largest'"
}
