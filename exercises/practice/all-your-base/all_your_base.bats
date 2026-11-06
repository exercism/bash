#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T04:26:49+00:00

test_single_bit_one_to_decimal() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1" 10
    assert_success
    assert_output "1"
}

test_binary_to_single_decimal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1" 10
    assert_success
    assert_output "5"
}

test_single_decimal_to_binary() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "5" 2
    assert_success
    assert_output "1 0 1"
}

test_binary_to_multiple_decimal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 10
    assert_success
    assert_output "4 2"
}

test_decimal_to_binary() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "4 2" 2
    assert_success
    assert_output "1 0 1 0 1 0"
}

test_trinary_to_hexadecimal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 3 "1 1 2 0" 16
    assert_success
    assert_output "2 10"
}

test_hexadecimal_to_trinary() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 16 "2 10" 3
    assert_success
    assert_output "1 1 2 0"
}

test_15_bit_integer() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 97 "3 46 60" 73
    assert_success
    assert_output "6 10 45"
}

test_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "" 10
    assert_success
    assert_output "0"
}

test_single_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "0" 2
    assert_success
    assert_output "0"
}

test_multiple_zeros() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "0 0 0" 2
    assert_success
    assert_output "0"
}

test_leading_zeros() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 7 "0 6 0" 10
    assert_success
    assert_output "4 2"
}

test_input_base_is_one() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 1 "0" 10
    assert_failure
    assert_output    # there is _some_ output
}

test_input_base_is_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 0 "" 10
    assert_failure
    assert_output    # there is _some_ output
}

test_input_base_is_negative() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh -2 "1" 10
    assert_failure
    assert_output    # there is _some_ output
}

test_negative_digit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 -1 1 0 1 0" 10
    assert_failure
    assert_output    # there is _some_ output
}

test_invalid_positive_digit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 2 1 0 1 0" 10
    assert_failure
    assert_output    # there is _some_ output
}

test_output_base_is_one() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 1
    assert_failure
    assert_output    # there is _some_ output
}

test_output_base_is_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "7" 0
    assert_failure
    assert_output    # there is _some_ output
}

test_output_base_is_negative() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1" -7
    assert_failure
    assert_output    # there is _some_ output
}

test_both_bases_are_negative() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh -2 "1" -7
    assert_failure
    assert_output    # there is _some_ output
}
