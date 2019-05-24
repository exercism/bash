#!/usr/bin/env bash

@test "age on Earth" {
    #skip
    expected=31.69
    run bash space_age.sh "Earth" 1000000000
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "age on Mercury" {
    skip
    expected=280.88
    run bash space_age.sh "Mercury" 2134835688
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "age on Venus" {
    skip
    expected=9.78
    run bash space_age.sh "Venus" 189839836
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "age on Mars" {
    skip
    expected=35.88
    run bash space_age.sh "Mars" 2129871239
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "age on Jupiter" {
    skip
    expected=2.41
    run bash space_age.sh "Jupiter" 901876382
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "age on Saturn" {
    skip
    expected=2.15
    run bash space_age.sh "Saturn" 2000000000
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "age on Uranus" {
    skip
    expected=0.46
    run bash space_age.sh "Uranus" 1210123456
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "age on Neptune" {
    skip
    expected=0.35
    run bash space_age.sh "Neptune" 1821023456
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "not a planet" {
    skip
    expected="not a planet"
    run bash space_age.sh "Pluto" 1821023456
    [[ $status -eq 1 ]]
    [[ $output == *"$expected"* ]]
}
