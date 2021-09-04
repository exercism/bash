#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.2.0.0

#
# *** Input and Output numbers are expressed in hexadecimal.
#


# Encode a series of integers, producing a series of bytes.

@test "zero" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 00
    assert_success
    assert_output "00"
}

@test "arbitrary single byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 40
    assert_success
    assert_output "40"
}

@test "largest single byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 7F
    assert_success
    assert_output "7F"
}

@test "smallest double byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 80
    assert_success
    assert_output "81 00"
}

@test "arbitrary double byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 2000
    assert_success
    assert_output "C0 00"
}

@test "largest double byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 3FFF
    assert_success
    assert_output "FF 7F"
}

@test "smallest triple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 4000
    assert_success
    assert_output "81 80 00"
}

@test "arbitrary triple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 100000
    assert_success
    assert_output "C0 80 00"
}

@test "largest triple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 1FFFFF
    assert_success
    assert_output "FF FF 7F"
}

@test "smallest quadruple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 200000
    assert_success
    assert_output "81 80 80 00"
}

@test "arbitrary quadruple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 8000000
    assert_success
    assert_output "C0 80 80 00"
}

@test "largest quadruple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FFFFFFF
    assert_success
    assert_output "FF FF FF 7F"
}

@test "smallest quintuple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 10000000
    assert_success
    assert_output "81 80 80 80 00"
}

@test "arbitrary quintuple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FF000000
    assert_success
    assert_output "8F F8 80 80 00"
}

@test "maximum 32-bit integer input" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FFFFFFFF
    assert_success
    assert_output "8F FF FF FF 7F"
}

@test "two single-byte values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 40 7F
    assert_success
    assert_output "40 7F"
}

@test "two multi-byte values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 4000 123456
    assert_success
    assert_output "81 80 00 C8 E8 56"
}

@test "many multi-byte values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 2000 123456 FFFFFFF 00 3FFF 4000
    assert_success
    assert_output "C0 00 C8 E8 56 FF FF FF 7F 00 FF 7F 81 80 00"
}


# Decode a series of bytes, producing a series of integers.

@test "one byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 7F
    assert_success
    assert_output "7F"
}

@test "two bytes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode C0 00
    assert_success
    assert_output "2000"
}

@test "three bytes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode FF FF 7F
    assert_success
    assert_output "1FFFFF"
}

@test "four bytes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 81 80 80 00
    assert_success
    assert_output "200000"
}

@test "maximum 32-bit integer" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 8F FF FF FF 7F
    assert_success
    assert_output "FFFFFFFF"
}

@test "multiple values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode C0 00 C8 E8 56 FF FF FF 7F 00 FF 7F 81 80 00
    assert_success
    assert_output "2000 123456 FFFFFFF 00 3FFF 4000"
}


# Some error conditions

@test "incomplete sequence causes error" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode FF
    assert_failure
    assert_output --partial "incomplete byte sequence"
}

@test "incomplete sequence causes error, even if value is zero" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 80
    assert_failure
    assert_output --partial "incomplete byte sequence"
}

@test "invalid subcommand" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh hello 80
    assert_failure
    assert_output --partial "unknown subcommand"
}
