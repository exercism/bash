#!/usr/bin/env bash

@test 'single_bit_to_one_decimal' {
    #skip
    run bash all_your_base.sh 2 "1" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1" ]]
}

@test 'binary_to_single_decimal' {
    skip
    run bash all_your_base.sh 2 "1 0 1" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "5" ]]
}

@test 'single_decimal_to_binary' {
    skip
    run bash all_your_base.sh 10 "5" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 0 1" ]]
}

@test 'binary_to_multiple_decimal' {
    skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "4 2" ]]
}

@test 'decimal_to_binary' {
    skip
    run bash all_your_base.sh 10 "4 2" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 0 1 0 1 0" ]]
}

@test 'trinary_to_hexadecimal' {
    skip
    run bash all_your_base.sh 3 "1 1 2 0" 16
    [[ "$status" -eq 0 ]]
    [[ "$output" == "2 10" ]]
}

@test 'hexadecimal_to_trinary' {
    skip
    run bash all_your_base.sh 16 "2 10" 3
    [[ "$status" -eq 0 ]]
    [[ "$output" == "1 1 2 0" ]]
}

@test '15_bit_integer' {
    skip
    run bash all_your_base.sh 97 "3 46 60" 73
    [[ "$status" -eq 0 ]]
    [[ "$output" == "6 10 45" ]]
}

@test 'empty_list' {
    skip
    run bash all_your_base.sh 2 "" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'single_zero' {
    skip
    run bash all_your_base.sh 10 "0" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'multiple_zeroes' {
    skip
    run bash all_your_base.sh 10 "0 0 0" 2
    [[ "$status" -eq 0 ]]
    [[ "$output" == "" ]]
}

@test 'leading_zeros' {
    skip
    run bash all_your_base.sh 7 "0 6 0" 10
    [[ "$status" -eq 0 ]]
    [[ "$output" == "4 2" ]]
}

@test 'input_base_is_one' {
    skip
    run bash all_your_base.sh 1 "0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'input_base_is_zero' {
    skip
    run bash all_your_base.sh 0 "" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'input_base_is_negative' {
    skip
    run bash all_your_base.sh -2 "1" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'negative_digit' {
    skip
    run bash all_your_base.sh 2 "1 -1 1 0 1 0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'invalid_positive_digit' {
    skip
    run bash all_your_base.sh 2 "1 2 1 0 1 0" 10
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output_base_is_one' {
    skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 1
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output_base_is_zero' {
    skip
    run bash all_your_base.sh 10 "7" 0
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'output_base_is_negative' {
    skip
    run bash all_your_base.sh 2 "1" -7
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}

@test 'both_bases_are_negative' {
    skip
    run bash all_your_base.sh -2 "1" -7
    [[ "$status" -gt 0 ]]
    [[ -n "$output" ]]
}
