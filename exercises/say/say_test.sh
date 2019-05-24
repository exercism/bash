#!/usr/bin/env bash

@test zero {
    run bash say.sh 0
    [[ $status -eq 0 ]]
    [[ $output == "zero" ]]
}

@test one {
    run bash say.sh 1
    [[ $status -eq 0 ]]
    [[ $output == "one" ]]
}

@test fourteen {
    run bash say.sh 14
    [[ $status -eq 0 ]]
    [[ $output == "fourteen" ]]
}

@test twenty {
    run bash say.sh 20
    [[ $status -eq 0 ]]
    [[ $output == "twenty" ]]
}

@test "twenty-two" {
    run bash say.sh 22
    [[ $status -eq 0 ]]
    [[ $output == "twenty-two" ]]
}

@test "one hundred" {
    run bash say.sh 100
    [[ $status -eq 0 ]]
    [[ $output == "one hundred" ]]
}

@test "one hundred twenty-three" {
    run bash say.sh 123
    [[ $status -eq 0 ]]
    [[ $output == "one hundred twenty-three" ]]
}

@test "one thousand" {
    run bash say.sh 1000
    [[ $status -eq 0 ]]
    [[ $output == "one thousand" ]]
}

@test "one thousand two hundred thirty-four" {
    run bash say.sh 1234
    [[ $status -eq 0 ]]
    [[ $output == "one thousand two hundred thirty-four" ]]
}

@test "one million" {
    run bash say.sh 1000000
    [[ $status -eq 0 ]]
    [[ $output == "one million" ]]
}

@test "one million two thousand three hundred forty-five" {
    run bash say.sh 1002345
    [[ $status -eq 0 ]]
    [[ $output == "one million two thousand three hundred forty-five" ]]
}

@test "one billion" {
    run bash say.sh 1000000000
    [[ $status -eq 0 ]]
    [[ $output == "one billion" ]]
}

@test "a big number" {
    run bash say.sh  987654321123
    [[ $status -eq 0 ]]
    [[ $output == "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three" ]]
}

@test "numbers below zero are out of range" {
    run bash say.sh -1
    [[ $status -eq 1 ]]
    [[ $output == "input out of range" ]]
}

@test "numbers above 999,999,999,999 are out of range" {
    run bash say.sh 1000000000000
    [[ $status -eq 1 ]]
    [[ $output == "input out of range" ]]
}
