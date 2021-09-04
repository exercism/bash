#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.0.0.0

# Usage: between $val $low $high
# Value is between low (inclusive) and high (exclusive).
between() { 
    (( $2 <= $1 && $1 < $3 ))
}

@test "private key is in range" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    for i in 5 7 11 13 17 19 23 29 31 27 41 43 47; do
        run bash diffie_hellman.sh privateKey $i
        assert_success
        assert between "$output" 2 "$i"
    done
}

@test "private key is random" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # may fail due to randomness
    local -i n=10 p=32000
    for i in $(seq $n); do
        run bash diffie_hellman.sh privateKey $p
        assert_success
        a["$output"]=1
    done
    assert_equal ${#a[@]} $n
}

@test "can calculate public key using private key" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="8"
    local -i p=23 g=5 private=6
    run bash diffie_hellman.sh publicKey $p $g $private
    assert_success
    assert_output "$expected"
}

@test "can calculate public key when given a different private key" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="19"
    local -i p=23 g=5 private=15
    run bash diffie_hellman.sh publicKey $p $g $private
    assert_success
    assert_output "$expected"
}

@test "can calculate secret key using other's public key" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2"
    local -i p=23 public=19 private=6
    run bash diffie_hellman.sh secret $p $public $private
    assert_success
    assert_output "$expected"
}

@test "key exchange" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local -i i p=23 g=5
    local -i alicePublic alicePrivate secret1
    local -i bobPublic bobPrivate secret2

    # do this a few times (randomness)
    for i in {1..10}; do
        run bash diffie_hellman.sh privateKey $p
        assert_success
        alicePrivate=$output

        run bash diffie_hellman.sh privateKey $p
        assert_success
        bobPrivate=$output

        run bash diffie_hellman.sh publicKey $p $g $alicePrivate
        assert_success
        alicePublic=$output

        run bash diffie_hellman.sh publicKey $p $g $bobPrivate
        assert_success
        bobPublic=$output

        run bash diffie_hellman.sh secret $p $bobPublic $alicePrivate
        assert_success
        secret1=$output

        run bash diffie_hellman.sh secret $p $alicePublic $bobPrivate
        assert_success
        secret2=$output

        assert_equal "$secret1" "$secret2"
    done
}
