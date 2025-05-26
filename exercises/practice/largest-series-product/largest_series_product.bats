#!/usr/bin/env bats
load bats-extra

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

# error cases

@test "rejects span longer than string length" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh 123 4
    expected="span must not exceed string length"
    assert_failure
    assert_output --partial "$expected"
}

@test "rejects empty string and nonzero span" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "" 1
    expected="span must not exceed string length"
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
    expected="span must not be negative"
    assert_failure
    assert_output --partial "$expected"
}
