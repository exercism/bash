#!/usr/bin/env bash

@test "rotate a by 0, same output as input" {
    #skip
    expected="a"
    run bash rotational_cipher.sh "a" 0
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate a by 1" {
    skip
    expected="b"
    run bash rotational_cipher.sh "a" 1
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate a by 26, same output as input" {
    skip
    expected="a"
    run bash rotational_cipher.sh "a" 26
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate m by 13" {
    skip
    expected="z"
    run bash rotational_cipher.sh "m" 13
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate n by 13 with wrap around alphabet" {
    skip
    expected="a"
    run bash rotational_cipher.sh "n" 13
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate capital letters" {
    skip
    expected="TRL"
    run bash rotational_cipher.sh "OMG" 5
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate spaces" {
    skip
    expected="T R L"
    run bash rotational_cipher.sh "O M G" 5
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate numbers" {
    skip
    expected="Xiwxmrk 1 2 3 xiwxmrk"
    run bash rotational_cipher.sh "Testing 1 2 3 testing" 4
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate punctuation" {
    skip
    expected="Gzo'n zvo, Bmviyhv!"
    run bash rotational_cipher.sh "Let's eat, Grandma!" 21
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rotate all letters" {
    skip
    expected="Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
    run bash rotational_cipher.sh "The quick brown fox jumps over the lazy dog." 13
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}
