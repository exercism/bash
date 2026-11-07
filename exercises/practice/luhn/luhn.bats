#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_single_digit_strings_can_not_be_valid() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "1"
    assert_success
    assert_output "false"
}

test_a_single_zero_is_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "0"
    assert_success
    assert_output "false"
}

test_a_simple_valid_sin_that_remains_valid_if_reversed() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "059"
    assert_success
    assert_output "true"
}

test_a_simple_valid_sin_that_becomes_invalid_if_reversed() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "59"
    assert_success
    assert_output "true"
}

test_a_valid_canadian_sin() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "055 444 285"
    assert_success
    assert_output "true"
}

test_invalid_canadian_sin() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "055 444 286"
    assert_success
    assert_output "false"
}

test_invalid_credit_card() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "8273 1232 7352 0569"
    assert_success
    assert_output "false"
}

test_invalid_long_number_with_an_even_remainder() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "1 2345 6789 1234 5678 9012"
    assert_success
    assert_output "false"
}

test_invalid_long_number_with_a_remainder_divisible_by_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "1 2345 6789 1234 5678 9013"
    assert_success
    assert_output "false"
}

test_valid_number_with_an_even_number_of_digits() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "095 245 88"
    assert_success
    assert_output "true"
}

test_valid_number_with_an_odd_number_of_spaces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "234 567 891 234"
    assert_success
    assert_output "true"
}

test_valid_strings_with_a_non_digit_added_at_the_end_become_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "059a"
    assert_success
    assert_output "false"
}

test_valid_strings_with_punctuation_included_become_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "055-444-285"
    assert_success
    assert_output "false"
}

test_valid_strings_with_symbols_included_become_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "055# 444$ 285"
    assert_success
    assert_output "false"
}

test_single_zero_with_space_is_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh " 0"
    assert_success
    assert_output "false"
}

test_more_than_a_single_zero_is_valid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "0000 0"
    assert_success
    assert_output "true"
}

test_input_digit_9_is_correctly_converted_to_output_digit_9() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "091"
    assert_success
    assert_output "true"
}

test_very_long_input_is_valid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "9999999999 9999999999 9999999999 9999999999"
    assert_success
    assert_output "true"
}

test_valid_luhn_with_an_odd_number_of_digits_and_non_zero_first_digit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "109"
    assert_success
    assert_output "true"
}

test_using_ascii_value_for_non_doubled_non_digit_isn_t_allowed() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "055b 444 285"
    assert_success
    assert_output "false"
}

test_using_ascii_value_for_doubled_non_digit_isn_t_allowed() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh ":9"
    assert_success
    assert_output "false"
}

test_non_numeric_non_space_char_in_the_middle_with_a_sum_that_s_divisible_by_10_isn_t_allowed() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash luhn.sh "59%59"
    assert_success
    assert_output "false"
}
