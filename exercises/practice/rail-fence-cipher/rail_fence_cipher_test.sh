#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.1.0.1

# Encoding

@test "empty text" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 2 ""
    assert_success
    assert_output ""
}

@test "encode with two rails" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 2 "XOXOXOXOXOXOXOXOXO"
    assert_success
    assert_output "XXXXXXXXXOOOOOOOOO"
}

@test "encode with three rails" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 3 "WEAREDISCOVEREDFLEEATONCE"
    assert_success
    assert_output "WECRLTEERDSOEEFEAOCAIVDEN"
}

@test "encode with ending in the middle" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 4 "EXERCISES"
    assert_success
    assert_output "ESXIEECSR"
}

@test "encode with more rails than text" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 10 "hello"
    assert_success
    assert_output "hello"
}


# Decoding

@test "decode with three rails" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d 3 "TEITELHDVLSNHDTISEIIEA"
    assert_success
    assert_output "THEDEVILISINTHEDETAILS"
}

@test "decode with five rails" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d 5 "EIEXMSMESAORIWSCE"
    assert_success
    assert_output "EXERCISMISAWESOME"
}

@test "decode with six rails" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d 6 "133714114238148966225439541018335470986172518171757571896261"
    assert_success
    assert_output "112358132134558914423337761098715972584418167651094617711286"
}

@test "decode with more rails than text" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d 10 "hello"
    assert_success
    assert_output "hello"
}

@test "decode the encoded text yields the original" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    plaintext="the quick brown fox jumped over the lazy dogs"
    rails=5
    run bash rail_fence_cipher.sh -e $rails "$plaintext"
    assert_success
    ciphertext=$output
    run bash rail_fence_cipher.sh -d $rails "$ciphertext"
    assert_success
    assert_output "$plaintext"
}


# Invocation errors

@test "no options" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh
    assert_failure
    assert_output    # there is _some_ output
}

@test "zero rails" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 0 abc
    assert_failure
    assert_output    # there is _some_ output
}

@test "negative rails" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d -2 abc
    assert_failure
    assert_output    # there is _some_ output
}
