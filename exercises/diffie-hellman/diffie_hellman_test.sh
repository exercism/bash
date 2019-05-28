#!/usr/bin/env bash

@test "private key is in range" {
    #skip
    for i in 5 7 11 13 17 19 23 29 31 27 41 43 47; do
        run bash diffie_hellman.sh privateKey $i
        [[ $status -eq 0 ]]
        [[ 1 -lt $output && $output -lt $i ]]
    done
}

@test "private key is random" {
    skip
    # may fail due to randomness
    local -A keys=()
    local -i n=10 p=32000
    for i in $(seq $n); do
        run bash diffie_hellman.sh privateKey $p
        [[ $status -eq 0 ]]
        a["$output"]=1
    done
    [[ ${#a[@]} -eq $n ]]
}

@test "can calculate public key using private key" {
    skip
    expected="8"
    local -i p=23 g=5 private=6
    run bash diffie_hellman.sh publicKey $p $g $private
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "can calculate secret key using other's public key" {
    skip
    expected="2"
    local -i p=23 public=19 private=6
    run bash diffie_hellman.sh secret $p $public $private
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "key exchange" {
    skip
    local -i i p=23 g=5
    local -i alicePublic alicePrivate secret1
    local -i bobPublic bobPrivate secret2

    # do this a few times (randomness)
    for i in {1..10}; do
        run bash diffie_hellman.sh privateKey $p
        [[ $status -eq 0 ]]
        alicePrivate=$output

        run bash diffie_hellman.sh privateKey $p
        [[ $status -eq 0 ]]
        bobPrivate=$output

        run bash diffie_hellman.sh publicKey $p $g $alicePrivate
        [[ $status -eq 0 ]]
        alicePublic=$output

        run bash diffie_hellman.sh publicKey $p $g $bobPrivate
        [[ $status -eq 0 ]]
        bobPublic=$output

        run bash diffie_hellman.sh secret $p $bobPublic $alicePrivate
        [[ $status -eq 0 ]]
        secret1=$output

        run bash diffie_hellman.sh secret $p $alicePublic $bobPrivate
        [[ $status -eq 0 ]]
        secret2=$output

        (( secret1 == secret2 ))
    done
}
