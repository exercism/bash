#!/usr/bin/env bash
load bats-extra

# local version: 3.2.0.0


@test "empty plaintext results in an empty ciphertext" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh ""
    assert_success
    assert_output ""
}

@test "Lowercase" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "A"
    assert_success
    assert_output "a"
}

@test "Remove spaces" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "  b "
    assert_success
    assert_output "b"
}

@test "Remove punctuation" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "@1,%!"
    assert_success
    assert_output "1"
}

@test "9 character plaintext results in 3 chunks of 3 characters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "This is fun!"
    assert_success
    assert_output "tsf hiu isn"
}

@test "8 character plaintext results in 3 chunks, the last one with a trailing space" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "Chill out."
    assert_success
    assert_output "clu hlt io "
}

@test "54 character plaintext results in 7 chunks, the last two with trailing spaces" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "If man was meant to stay on the ground, god would have given us roots."
    assert_success
    assert_output "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
}
