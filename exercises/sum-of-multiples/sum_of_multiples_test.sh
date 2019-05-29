#!/usr/bin/env bash

@test "no multiples within limit" {
    #skip
    run bash sum_of_multiples.sh 1 3 5
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "one factor has multiples within limit" {
    skip
    run bash sum_of_multiples.sh 4 3 5
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test "more than one multiple within limit" {
    skip
    run bash sum_of_multiples.sh 7 3
    [[ $status -eq 0 ]]
    [[ $output == "9" ]]
}

@test "more than one factor with multiples within limit" {
    skip
    run bash sum_of_multiples.sh 10 3 5
    [[ $status -eq 0 ]]
    [[ $output == "23" ]]
}

@test "each multiple is only counted once" {
    skip
    run bash sum_of_multiples.sh 100 3 5
    [[ $status -eq 0 ]]
    [[ $output == "2318" ]]
}

@test "a much larger limit" {
    skip
    run bash sum_of_multiples.sh 1000 3 5
    [[ $status -eq 0 ]]
    [[ $output == "233168" ]]
}

@test "three factors" {
    skip
    run bash sum_of_multiples.sh 20 7 13 17
    [[ $status -eq 0 ]]
    [[ $output == "51" ]]
}

@test "factors not relatively prime" {
    skip
    run bash sum_of_multiples.sh 15 4 6
    [[ $status -eq 0 ]]
    [[ $output == "30" ]]
}

@test "some pairs of factors relatively prime and some not" {
    skip
    run bash sum_of_multiples.sh 150 5 6 8
    [[ $status -eq 0 ]]
    [[ $output == "4419" ]]
}

@test "one factor is a multiple of another" {
    skip
    run bash sum_of_multiples.sh 51 5 25
    [[ $status -eq 0 ]]
    [[ $output == "275" ]]
}

@test "much larger factors" {
    skip
    run bash sum_of_multiples.sh 10000 43 47
    [[ $status -eq 0 ]]
    [[ $output == "2203160" ]]
}

@test "all numbers are multiples of 1" {
    skip
    run bash sum_of_multiples.sh 100 1
    [[ $status -eq 0 ]]
    [[ $output == "4950" ]]
}

@test "no factors means an empty sum" {
    skip
    run bash sum_of_multiples.sh 10000 
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "the only multiple of 0 is 0" {
    skip
    run bash sum_of_multiples.sh 1 0
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "the factor 0 does not affect the sum of multiples of other factors" {
    skip
    run bash sum_of_multiples.sh 4 3 0
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test "solutions using include-exclude must extend to cardinality greater than 3" {
    skip
    run bash sum_of_multiples.sh 10000 2 3 5 7 11
    [[ $status -eq 0 ]]
    [[ $output == "39614537" ]]
}
