#!/usr/bin/env bash
load bats-extra

# local version: 1.1.0.0

# run-length encode a string

@test "encode empty string" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=""
    run bash run_length_encoding.sh encode ""
    assert_success
    assert_output "$expected"
}

@test "encode single characters only are encoded without count" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="XYZ"
    run bash run_length_encoding.sh encode "XYZ"
    assert_success
    assert_output "$expected"
}

@test "encode string with no single characters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2A3B4C"
    run bash run_length_encoding.sh encode "AABBBCCCC"
    assert_success
    assert_output "$expected"
}

@test "encode single characters mixed with repeated characters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="12WB12W3B24WB"
    run bash run_length_encoding.sh encode "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
    assert_success
    assert_output "$expected"
}

@test "encode multiple whitespace mixed in string" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 hs2q q2w2 "
    run bash run_length_encoding.sh encode "  hsqq qww  "
    assert_success
    assert_output "$expected"
}

@test "encode lowercase characters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2a3b4c"
    run bash run_length_encoding.sh encode "aabbbcccc"
    assert_success
    assert_output "$expected"
}

# run-length decode a string

@test "decode empty string" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=""
    run bash run_length_encoding.sh decode ""
    assert_success
    assert_output "$expected"
}

@test "single characters only" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="XYZ"
    run bash run_length_encoding.sh decode "XYZ"
    assert_success
    assert_output "$expected"
}

@test "decode string with no single characters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="AABBBCCCC"
    run bash run_length_encoding.sh decode "2A3B4C"
    assert_success
    assert_output "$expected"
}

@test "decode single characters with repeated characters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
    run bash run_length_encoding.sh decode "12WB12W3B24WB"
    assert_success
    assert_output "$expected"
}

@test "decode multiple whitespace mixed in string" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="  hsqq qww  "
    run bash run_length_encoding.sh decode "2 hs2q q2w2 "
    assert_success
    assert_output "$expected"
}

@test "decode lower case string" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="aabbbcccc"
    run bash run_length_encoding.sh decode "2a3b4c"
    assert_success
    assert_output "$expected"
}

# encode and then decode

@test "encode followed by decode gives original string" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="zzz ZZ  zZ"
    run bash run_length_encoding.sh encode "zzz ZZ  zZ"
    assert_success
    encoded=$output
    run bash run_length_encoding.sh decode "$encoded"
    assert_success
    assert_output "$expected"
}
