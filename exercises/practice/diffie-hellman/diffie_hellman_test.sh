#!/usr/bin/env bash

# local version: 1.0.0.0

@test "private key is in range" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    for i in 5 7 11 13 17 19 23 29 31 27 41 43 47; do
        run bash diffie_hellman.sh privateKey $i
        (( status == 0 ))
	(( 1 < output && output < i ))
    done
}

@test "private key is random" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # may fail due to randomness
    local -i n=10 p=32000
    for i in $(seq $n); do
        run bash diffie_hellman.sh privateKey $p
        (( status == 0 ))
        a["$output"]=1
    done
    (( ${#a[@]} == $n ))
}

@test "can calculate public key using private key" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="8"
    local -i p=23 g=5 private=6
    run bash diffie_hellman.sh publicKey $p $g $private
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "can calculate public key when given a different private key" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="19"
    local -i p=23 g=5 private=15
    run bash diffie_hellman.sh publicKey $p $g $private
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "can calculate secret key using other's public key" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2"
    local -i p=23 public=19 private=6
    run bash diffie_hellman.sh secret $p $public $private
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "key exchange" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local -i i p=23 g=5
    local -i alicePublic alicePrivate secret1
    local -i bobPublic bobPrivate secret2

    # do this a few times (randomness)
    for i in {1..10}; do
        run bash diffie_hellman.sh privateKey $p
        (( status == 0 ))
        alicePrivate=$output

        run bash diffie_hellman.sh privateKey $p
        (( status == 0 ))
        bobPrivate=$output

        run bash diffie_hellman.sh publicKey $p $g $alicePrivate
        (( status == 0 ))
        alicePublic=$output

        run bash diffie_hellman.sh publicKey $p $g $bobPrivate
        (( status == 0 ))
        bobPublic=$output

        run bash diffie_hellman.sh secret $p $bobPublic $alicePrivate
        (( status == 0 ))
        secret1=$output

        run bash diffie_hellman.sh secret $p $alicePublic $bobPrivate
        (( status == 0 ))
        secret2=$output

        (( secret1 == secret2 ))
    done
}
