#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-05T22:34:09+00:00

function single_bit_one_to_decimal { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1" 10
    assert_success
    assert_output "1"
}

function binary_to_single_decimal { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1" 10
    assert_success
    assert_output "5"
}

function single_decimal_to_binary { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "5" 2
    assert_success
    assert_output "1 0 1"
}

function binary_to_multiple_decimal { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 10
    assert_success
    assert_output "4 2"
}

function decimal_to_binary { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "4 2" 2
    assert_success
    assert_output "1 0 1 0 1 0"
}

function trinary_to_hexadecimal { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 3 "1 1 2 0" 16
    assert_success
    assert_output "2 10"
}

function hexadecimal_to_trinary { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 16 "2 10" 3
    assert_success
    assert_output "1 1 2 0"
}

function 15_bit_integer { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 97 "3 46 60" 73
    assert_success
    assert_output "6 10 45"
}

function empty_list { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "" 10
    assert_success
    assert_output "0"
}

function single_zero { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "0" 2
    assert_success
    assert_output "0"
}

function multiple_zeros { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "0 0 0" 2
    assert_success
    assert_output "0"
}

function leading_zeros { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 7 "0 6 0" 10
    assert_success
    assert_output "4 2"
}

function input_base_is_one { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 1 "0" 10
    assert_failure
    assert_output    # there is _some_ output
}

function input_base_is_zero { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 0 "" 10
    assert_failure
    assert_output    # there is _some_ output
}

function input_base_is_negative { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh -2 "1" 10
    assert_failure
    assert_output    # there is _some_ output
}

function negative_digit { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 -1 1 0 1 0" 10
    assert_failure
    assert_output    # there is _some_ output
}

function invalid_positive_digit { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 2 1 0 1 0" 10
    assert_failure
    assert_output    # there is _some_ output
}

function output_base_is_one { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1 0 1 0 1 0" 1
    assert_failure
    assert_output    # there is _some_ output
}

function output_base_is_zero { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 10 "7" 0
    assert_failure
    assert_output    # there is _some_ output
}

function output_base_is_negative { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh 2 "1" -7
    assert_failure
    assert_output    # there is _some_ output
}

function both_bases_are_negative { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash all_your_base.sh -2 "1" -7
    assert_failure
    assert_output    # there is _some_ output
}
