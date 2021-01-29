#!/usr/bin/env bash

# local version: 1.2.0.0

#
# *** Input and Output numbers are expressed in hexadecimal.
#


# Encode a series of integers, producing a series of bytes.

@test "zero" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 00
    (( status == 0 ))
    [[ $output == "00" ]]
}

@test "arbitrary single byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 40
    (( status == 0 ))
    [[ $output == "40" ]]
}

@test "largest single byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 7F
    (( status == 0 ))
    [[ $output == "7F" ]]
}

@test "smallest double byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 80
    (( status == 0 ))
    [[ $output == "81 00" ]]
}

@test "arbitrary double byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 2000
    (( status == 0 ))
    [[ $output == "C0 00" ]]
}

@test "largest double byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 3FFF
    (( status == 0 ))
    [[ $output == "FF 7F" ]]
}

@test "smallest triple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 4000
    (( status == 0 ))
    [[ $output == "81 80 00" ]]
}

@test "arbitrary triple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 100000
    (( status == 0 ))
    [[ $output == "C0 80 00" ]]
}

@test "largest triple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 1FFFFF
    (( status == 0 ))
    [[ $output == "FF FF 7F" ]]
}

@test "smallest quadruple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 200000
    (( status == 0 ))
    [[ $output == "81 80 80 00" ]]
}

@test "arbitrary quadruple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 8000000
    (( status == 0 ))
    [[ $output == "C0 80 80 00" ]]
}

@test "largest quadruple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FFFFFFF
    (( status == 0 ))
    [[ $output == "FF FF FF 7F" ]]
}

@test "smallest quintuple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 10000000
    (( status == 0 ))
    [[ $output == "81 80 80 80 00" ]]
}

@test "arbitrary quintuple byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FF000000
    (( status == 0 ))
    [[ $output == "8F F8 80 80 00" ]]
}

@test "maximum 32-bit integer input" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode FFFFFFFF
    (( status == 0 ))
    [[ $output == "8F FF FF FF 7F" ]]
}

@test "two single-byte values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 40 7F
    (( status == 0 ))
    [[ $output == "40 7F" ]]
}

@test "two multi-byte values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 4000 123456
    (( status == 0 ))
    [[ $output == "81 80 00 C8 E8 56" ]]
}

@test "many multi-byte values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh encode 2000 123456 FFFFFFF 00 3FFF 4000
    (( status == 0 ))
    [[ $output == "C0 00 C8 E8 56 FF FF FF 7F 00 FF 7F 81 80 00" ]]
}


# Decode a series of bytes, producing a series of integers.

@test "one byte" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 7F
    (( status == 0 ))
    [[ $output == "7F" ]]
}

@test "two bytes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode C0 00
    (( status == 0 ))
    [[ $output == "2000" ]]
}

@test "three bytes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode FF FF 7F
    (( status == 0 ))
    [[ $output == "1FFFFF" ]]
}

@test "four bytes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 81 80 80 00
    (( status == 0 ))
    [[ $output == "200000" ]]
}

@test "maximum 32-bit integer" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 8F FF FF FF 7F
    (( status == 0 ))
    [[ $output == "FFFFFFFF" ]]
}

@test "multiple values" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode C0 00 C8 E8 56 FF FF FF 7F 00 FF 7F 81 80 00
    (( status == 0 ))
    [[ $output == "2000 123456 FFFFFFF 00 3FFF 4000" ]]
}


# Some error conditions

@test "incomplete sequence causes error" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode FF
    (( status == 1 ))
    [[ $output == *"incomplete byte sequence"* ]]
}

@test "incomplete sequence causes error, even if value is zero" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh decode 80
    (( status == 1 ))
    [[ $output == *"incomplete byte sequence"* ]]
}

@test "invalid subcommand" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash variable_length_quantity.sh hello 80
    (( status == 1 ))
    [[ $output == *"unknown subcommand"* ]]
}
