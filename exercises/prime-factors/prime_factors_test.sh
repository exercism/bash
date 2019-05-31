#!/usr/bin/env bash

@test "no factors" {
    #skip
    expected=""
    run bash prime_factors.sh 1
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "prime number" {
    skip
    expected="2"
    run bash prime_factors.sh 2
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "square of a prime" {
    skip
    expected="3 3"
    run bash prime_factors.sh 9
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "cube of a prime" {
    skip
    expected="2 2 2"
    run bash prime_factors.sh 8
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "product of primes and non-primes" {
    skip
    expected="2 2 3"
    run bash prime_factors.sh 12
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "product of primes" {
    skip
    expected="5 17 23 461"
    run bash prime_factors.sh 901255
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "factors include a large prime" {
    skip
    expected="11 9539 894119"
    run bash prime_factors.sh 93819012551
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}
