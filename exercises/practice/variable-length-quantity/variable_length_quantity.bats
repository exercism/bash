#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

#
# *** Input and Output numbers are expressed in hexadecimal.
#


test_encode_a_series_of_integers_producing_a_series_of_bytes_zero() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 00
    assert_success
    assert_output "00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_arbitrary_single_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 40
    assert_success
    assert_output "40"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_asymmetric_single_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 53
    assert_success
    assert_output "53"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_largest_single_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 7F
    assert_success
    assert_output "7F"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_smallest_double_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 80
    assert_success
    assert_output "81 00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_arbitrary_double_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 2000
    assert_success
    assert_output "C0 00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_asymmetric_double_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode AD
    assert_success
    assert_output "81 2D"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_largest_double_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 3FFF
    assert_success
    assert_output "FF 7F"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_smallest_triple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 4000
    assert_success
    assert_output "81 80 00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_arbitrary_triple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 100000
    assert_success
    assert_output "C0 80 00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_asymmetric_triple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 1D59C
    assert_success
    assert_output "87 AB 1C"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_largest_triple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 1FFFFF
    assert_success
    assert_output "FF FF 7F"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_smallest_quadruple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 200000
    assert_success
    assert_output "81 80 80 00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_arbitrary_quadruple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 8000000
    assert_success
    assert_output "C0 80 80 00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_asymmetric_quadruple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 357704
    assert_success
    assert_output "81 D5 EE 04"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_largest_quadruple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FFFFFFF
    assert_success
    assert_output "FF FF FF 7F"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_smallest_quintuple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 10000000
    assert_success
    assert_output "81 80 80 80 00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_arbitrary_quintuple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FF000000
    assert_success
    assert_output "8F F8 80 80 00"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_asymmetric_quintuple_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 86656105
    assert_success
    assert_output "88 B3 95 C2 05"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_maximum_32_bit_integer_input() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FFFFFFFF
    assert_success
    assert_output "8F FF FF FF 7F"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_two_single_byte_values() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 40 7F
    assert_success
    assert_output "40 7F"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_two_multi_byte_values() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 4000 123456
    assert_success
    assert_output "81 80 00 C8 E8 56"
}

test_encode_a_series_of_integers_producing_a_series_of_bytes_many_multi_byte_values() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 2000 123456 FFFFFFF 00 3FFF 4000
    assert_success
    assert_output "C0 00 C8 E8 56 FF FF FF 7F 00 FF 7F 81 80 00"
}

test_decode_a_series_of_bytes_producing_a_series_of_integers_one_byte() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 7F
    assert_success
    assert_output "7F"
}

test_decode_a_series_of_bytes_producing_a_series_of_integers_two_bytes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode C0 00
    assert_success
    assert_output "2000"
}

test_decode_a_series_of_bytes_producing_a_series_of_integers_three_bytes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode FF FF 7F
    assert_success
    assert_output "1FFFFF"
}

test_decode_a_series_of_bytes_producing_a_series_of_integers_four_bytes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 81 80 80 00
    assert_success
    assert_output "200000"
}

test_decode_a_series_of_bytes_producing_a_series_of_integers_maximum_32_bit_integer() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 8F FF FF FF 7F
    assert_success
    assert_output "FFFFFFFF"
}

test_decode_a_series_of_bytes_producing_a_series_of_integers_incomplete_sequence_causes_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode FF
    assert_failure
    assert_output --partial "incomplete byte sequence"
}

test_decode_a_series_of_bytes_producing_a_series_of_integers_incomplete_sequence_causes_error_even_if_value_is_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 80
    assert_failure
    assert_output --partial "incomplete byte sequence"
}

test_decode_a_series_of_bytes_producing_a_series_of_integers_multiple_values() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode C0 00 C8 E8 56 FF FF FF 7F 00 FF 7F 81 80 00
    assert_success
    assert_output "2000 123456 FFFFFFF 00 3FFF 4000"
}


test_invalid_subcommand() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh hello 80
    assert_failure
    assert_output --partial "unknown subcommand"
}
