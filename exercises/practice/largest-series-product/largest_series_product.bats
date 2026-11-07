#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T22:03:11+00:00

test_finds_the_largest_product_if_span_equals_length() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "29" "2"
    expected=18
    assert_success
    assert_output "$expected"
}

test_can_find_the_largest_product_of_2_with_numbers_in_order() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "0123456789" "2"
    expected=72
    assert_success
    assert_output "$expected"
}

test_can_find_the_largest_product_of_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "576802143" "2"
    expected=48
    assert_success
    assert_output "$expected"
}

test_can_find_the_largest_product_of_3_with_numbers_in_order() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "0123456789" "3"
    expected=504
    assert_success
    assert_output "$expected"
}

test_can_find_the_largest_product_of_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "1027839564" "3"
    expected=270
    assert_success
    assert_output "$expected"
}

test_can_find_the_largest_product_of_5_with_numbers_in_order() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "0123456789" "5"
    expected=15120
    assert_success
    assert_output "$expected"
}

test_can_get_the_largest_product_of_a_big_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "73167176531330624919225119674426574742355349194934" "6"
    expected=23520
    assert_success
    assert_output "$expected"
}

test_reports_zero_if_the_only_digits_are_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "0000" "2"
    expected=0
    assert_success
    assert_output "$expected"
}

test_reports_zero_if_all_spans_include_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "99099" "3"
    expected=0
    assert_success
    assert_output "$expected"
}

test_rejects_span_longer_than_string_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "123" "4"
    expected="span must not exceed string length"
    assert_failure
    assert_output --partial "$expected"
}

test_rejects_empty_string_and_nonzero_span() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "" "1"
    expected="span must not exceed string length"
    assert_failure
    assert_output --partial "$expected"
}

test_rejects_invalid_character_in_digits() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "1234a5" "2"
    expected="digits input must only contain digits"
    assert_failure
    assert_output --partial "$expected"
}

test_rejects_negative_span() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash largest_series_product.sh "12345" "-1"
    expected="span must not be negative"
    assert_failure
    assert_output --partial "$expected"
}
