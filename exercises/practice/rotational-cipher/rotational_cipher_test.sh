#!/usr/bin/env bash

# local version: 1.2.0.0

@test "rotate a by 0, same output as input" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="a"
    run bash rotational_cipher.sh "a" 0
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate a by 1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="b"
    run bash rotational_cipher.sh "a" 1
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate a by 26, same output as input" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="a"
    run bash rotational_cipher.sh "a" 26
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate m by 13" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="z"
    run bash rotational_cipher.sh "m" 13
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate n by 13 with wrap around alphabet" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="a"
    run bash rotational_cipher.sh "n" 13
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate capital letters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="TRL"
    run bash rotational_cipher.sh "OMG" 5
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate spaces" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="T R L"
    run bash rotational_cipher.sh "O M G" 5
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate numbers" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="Xiwxmrk 1 2 3 xiwxmrk"
    run bash rotational_cipher.sh "Testing 1 2 3 testing" 4
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate punctuation" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="Gzo'n zvo, Bmviyhv!"
    run bash rotational_cipher.sh "Let's eat, Grandma!" 21
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "rotate all letters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
    run bash rotational_cipher.sh "The quick brown fox jumps over the lazy dog." 13
    (( status == 0 ))
    [[ $output == "$expected" ]]
}
