#!/usr/bin/env bash


@test "empty plaintext results in an empty ciphertext" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash crypto_square.sh ""
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "Lowercase" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash crypto_square.sh "A"
    [[ $status -eq 0 ]]
    [[ $output == "a" ]]
}

@test "Remove spaces" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash crypto_square.sh "  b "
    [[ $status -eq 0 ]]
    [[ $output == "b" ]]
}

@test "Remove punctuation" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash crypto_square.sh "@1,%!"
    [[ $status -eq 0 ]]
    [[ $output == "1" ]]
}

@test "9 character plaintext results in 3 chunks of 3 characters" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash crypto_square.sh "This is fun!"
    [[ $status -eq 0 ]]
    [[ $output == "tsf hiu isn" ]]
}

@test "8 character plaintext results in 3 chunks, the last one with a trailing space" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash crypto_square.sh "Chill out."
    [[ $status -eq 0 ]]
    [[ $output == "clu hlt io " ]]
}

@test "54 character plaintext results in 7 chunks, the last two with trailing spaces" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash crypto_square.sh "If man was meant to stay on the ground, god would have given us roots."
    [[ $status -eq 0 ]]
    [[ $output == "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau " ]]
}
