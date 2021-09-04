#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.2.0.0


@test "finds the largest product if span equals length" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 29 2
    expected=18
    assert_success
    assert_output "$expected"
}

@test "can find the largest product of 2 with numbers in order" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 0123456789 2
    expected=72
    assert_success
    assert_output "$expected"
}

@test "can find the largest product of 2" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 576802143 2
    expected=48
    assert_success
    assert_output "$expected"
}

@test "can find the largest product of 3 with numbers in order" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 0123456789 3
    expected=504
    assert_success
    assert_output "$expected"
}

@test "can find the largest product of 3" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 1027839564 3
    expected=270
    assert_success
    assert_output "$expected"
}

@test "can find the largest product of 5 with numbers in order" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 0123456789 5
    expected=15120
    assert_success
    assert_output "$expected"
}

@test "can get the largest product of a big number" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 73167176531330624919225119674426574742355349194934 6
    expected=23520
    assert_success
    assert_output "$expected"
}

@test "reports zero if the only digits are zero" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 0000 2
    expected=0
    assert_success
    assert_output "$expected"
}

@test "reports zero if all spans include zero" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 99099 3
    expected=0
    assert_success
    assert_output "$expected"
}

# There may be some confusion about whether this should be 1 or error.
# The reasoning for it being 1 is this:
# There is one 0-character string contained in the empty string.
# That's the empty string itself.
# The empty product is 1 (the identity for multiplication).
# Therefore LSP('', 0) is 1.
# It's NOT the case that LSP('', 0) takes max of an empty list.
# So there is no error.
# Compare against LSP('123', 4):
# There are zero 4-character strings in '123'.
# So LSP('123', 4) really DOES take the max of an empty list.
# So LSP('123', 4) errors and LSP('', 0) does NOT.

@test "reports 1 for empty string and empty product (0 span)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 0
    expected=1
    assert_success
    assert_output "$expected"
}

# As above, there is one 0-character string in '123'.
# So again no error. It's the empty product, 1.

@test "reports 1 for nonempty string and empty product (0 span)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 123 0
    expected=1
    assert_success
    assert_output "$expected"
}

# error cases

@test "rejects span longer than string length" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 123 4
    expected="span must be smaller than string length"
    assert_failure
    assert_output --partial "$expected"
}

@test "rejects empty string and nonzero span" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "" 1
    expected="span must be smaller than string length"
    assert_failure
    assert_output --partial "$expected"
}

@test "rejects invalid character in digits" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 1234a5 2
    expected="input must only contain digits"
    assert_failure
    assert_output --partial "$expected"
}

@test "rejects negative span" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 12345 -1
    expected="span must be greater than zero"
    assert_failure
    assert_output --partial "$expected"
}
