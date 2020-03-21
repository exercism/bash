#!/usr/bin/env bash

# local version: 1.1.0.1

# Encoding

@test "empty text" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -e 2 ""
    (( status == 0 ))
    [[ $output == "" ]]
}

@test "encode with two rails" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -e 2 "XOXOXOXOXOXOXOXOXO"
    (( status == 0 ))
    [[ $output == "XXXXXXXXXOOOOOOOOO" ]]
}

@test "encode with three rails" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -e 3 "WEAREDISCOVEREDFLEEATONCE"
    (( status == 0 ))
    [[ $output == "WECRLTEERDSOEEFEAOCAIVDEN" ]]
}

@test "encode with ending in the middle" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -e 4 "EXERCISES"
    (( status == 0 ))
    [[ $output == "ESXIEECSR" ]]
}

@test "encode with more rails than text" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -e 10 "hello"
    (( status == 0 ))
    [[ $output == "hello" ]]
}


# Decoding

@test "decode with three rails" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -d 3 "TEITELHDVLSNHDTISEIIEA"
    (( status == 0 ))
    [[ $output == "THEDEVILISINTHEDETAILS" ]]
}

@test "decode with five rails" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -d 5 "EIEXMSMESAORIWSCE"
    (( status == 0 ))
    [[ $output == "EXERCISMISAWESOME" ]]
}

@test "decode with six rails" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -d 6 "133714114238148966225439541018335470986172518171757571896261"
    (( status == 0 ))
    [[ $output == "112358132134558914423337761098715972584418167651094617711286" ]]
}

@test "decode with more rails than text" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -d 10 "hello"
    (( status == 0 ))
    [[ $output == "hello" ]]
}

@test "decode the encoded text yields the original" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    plaintext="the quick brown fox jumped over the lazy dogs"
    rails=5
    run bash rail_fence_cipher.sh -e $rails "$plaintext"
    (( status == 0 ))
    ciphertext=$output
    run bash rail_fence_cipher.sh -d $rails "$ciphertext"
    (( status == 0 ))
    [[ $output = "$plaintext" ]]
}


# Invocation errors

@test "no options" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh
    (( status == 1 ))
    [[ -n $output ]]
}

@test "zero rails" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -e 0 abc
    (( status == 1 ))
    [[ -n $output ]]
}

@test "negative rails" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash rail_fence_cipher.sh -d -2 abc
    (( status == 1 ))
    [[ -n $output ]]
}
