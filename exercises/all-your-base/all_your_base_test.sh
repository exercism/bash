#!/usr/bin/env bash

@test 'single_bit_to_one_decimal' {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1" ]]
}

@test 'binary_to_single_decimal' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 0 1" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "5" ]]
}

@test 'single_decimal_to_binary' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "5" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 0 1" ]]
}

@test 'binary_to_multiple_decimal' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "4 2" ]]
}

@test 'decimal_to_binary' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "4 2" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 0 1 0 1 0" ]]
}

@test 'trinary_to_hexadecimal' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 3 "1 1 2 0" 16
    [[ "$status" -eq 0 ]]
    [[ "$output" == "2 10" ]]
}

@test 'hexadecimal_to_trinary' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 16 "2 10" 3
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 1 2 0" ]]
}

@test '15_bit_integer' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 97 "3 46 60" 73
    [[ "$status" -eq 0 ]]
    [[ "$output" == "6 10 45" ]]
}

@test 'empty_list' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'single_zero' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "0" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'multiple_zeroes' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "0 0 0" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'leading_zeros' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 7 "0 6 0" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "4 2" ]]
}

@test 'input_base_is_one' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 1 "0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'input_base_is_zero' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 0 "" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'input_base_is_negative' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh -2 "1" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'negative_digit' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 -1 1 0 1 0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'invalid_positive_digit' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 2 1 0 1 0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output_base_is_one' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 1
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output_base_is_zero' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 10 "7" 0
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output_base_is_negative' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh 2 "1" -7
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'both_bases_are_negative' {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash all_your_base.sh -2 "1" -7
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}
