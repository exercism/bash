#!/usr/bin/env bash

# Addition

@test "Add two positive rational numbers" {
    #skip
    run bash rational_numbers.sh "+" "1/2" "2/3"
    [[ $status -eq 0 ]]
    [[ $output == "7/6" ]]
}

@test "Add a positive rational number and a negative rational number" {
    skip
    run bash rational_numbers.sh "+" "1/2" "-2/3"
    [[ $status -eq 0 ]]
    [[ $output == "-1/6" ]]
}

@test "Add two negative rational numbers" {
    skip
    run bash rational_numbers.sh "+" "-1/2" "-2/3"
    [[ $status -eq 0 ]]
    [[ $output == "-7/6" ]]
}

@test "Add a rational number to its additive inverse" {
    skip
    run bash rational_numbers.sh "+" "1/2" "-1/2"
    [[ $status -eq 0 ]]
    [[ $output == "0/1" ]]
}


# Subtraction

@test "Subtract two positive rational numbers" {
    skip
    run bash rational_numbers.sh "-" "1/2" "2/3"
    [[ $status -eq 0 ]]
    [[ $output == "-1/6" ]]
}

@test "Subtract a positive rational number and a negative rational number" {
    skip
    run bash rational_numbers.sh "-" "1/2" "-2/3"
    [[ $status -eq 0 ]]
    [[ $output == "7/6" ]]
}

@test "Subtract two negative rational numbers" {
    skip
    run bash rational_numbers.sh "-" "-1/2" "-2/3"
    [[ $status -eq 0 ]]
    [[ $output == "1/6" ]]
}

@test "Subtract a rational number from itself" {
    skip
    run bash rational_numbers.sh "-" "1/2" "1/2"
    [[ $status -eq 0 ]]
    [[ $output == "0/1" ]]
}

# Multiplication

@test "Multiply two positive rational numbers" {
    skip
    run bash rational_numbers.sh "*" "1/2" "2/3"
    [[ $status -eq 0 ]]
    [[ $output == "1/3" ]]
}

@test "Multiply a negative rational number by a positive rational number" {
    skip
    run bash rational_numbers.sh "*" "-1/2" "2/3"
    [[ $status -eq 0 ]]
    [[ $output == "-1/3" ]]
}

@test "Multiply two negative rational numbers" {
    skip
    run bash rational_numbers.sh "*" "-1/2" "-2/3"
    [[ $status -eq 0 ]]
    [[ $output == "1/3" ]]
}

@test "Multiply a rational number by its reciprocal" {
    skip
    run bash rational_numbers.sh "*" "1/2" "2/1"
    [[ $status -eq 0 ]]
    [[ $output == "1/1" ]]
}

@test "Multiply a rational number by 1" {
    skip
    run bash rational_numbers.sh "*" "1/2" "1/1"
    [[ $status -eq 0 ]]
    [[ $output == "1/2" ]]
}

@test "Multiply a rational number by 0" {
    skip
    run bash rational_numbers.sh "*" "1/2" "0/1"
    [[ $status -eq 0 ]]
    [[ $output == "0/1" ]]
}


# Division

@test "Divide two positive rational numbers" {
    skip
    run bash rational_numbers.sh "/" "1/2" "2/3"
    [[ $status -eq 0 ]]
    [[ $output == "3/4" ]]
}

@test "Divide a positive rational number by a negative rational number" {
    skip
    run bash rational_numbers.sh "/" "1/2" "-2/3"
    [[ $status -eq 0 ]]
    [[ $output == "-3/4" ]]
}

@test "Divide two negative rational numbers" {
    skip
    run bash rational_numbers.sh "/" "-1/2" "-2/3"
    [[ $status -eq 0 ]]
    [[ $output == "3/4" ]]
}

@test "Divide a rational number by 1" {
    skip
    run bash rational_numbers.sh "/" "1/2" "1/1"
    [[ $status -eq 0 ]]
    [[ $output == "1/2" ]]
}


# Absolute value"

@test "Absolute value of a positive rational number" {
    skip
    run bash rational_numbers.sh "abs" "1/2"
    [[ $status -eq 0 ]]
    [[ $output ==  "1/2" ]]
}

@test "Absolute value of a positive rational number with negative numerator and denominator" {
    skip
    run bash rational_numbers.sh "abs" "-1/-2"
    [[ $status -eq 0 ]]
    [[ $output ==  "1/2" ]]
}

@test "Absolute value of a negative rational number" {
    skip
    run bash rational_numbers.sh "abs" "-1/2"
    [[ $status -eq 0 ]]
    [[ $output ==  "1/2" ]]
}

@test "Absolute value of a negative rational number with negative denominator" {
    skip
    run bash rational_numbers.sh "abs" "1/-2"
    [[ $status -eq 0 ]]
    [[ $output ==  "1/2" ]]
}

@test "Absolute value of zero" {
    skip
    run bash rational_numbers.sh "abs" "0/1"
    [[ $status -eq 0 ]]
    [[ $output ==  "0/1" ]]
}


# Exponentiation of a rational number

@test "Raise a positive rational number to a positive integer power" {
    skip
    run bash rational_numbers.sh "pow" "1/2" 3
    [[ $status -eq 0 ]]
    [[ $output == "1/8" ]]
}

@test "Raise a negative rational number to a positive integer power" {
    skip
    run bash rational_numbers.sh "pow" "-1/2" 3
    [[ $status -eq 0 ]]
    [[ $output == "-1/8" ]]
}

@test "Raise zero to an integer power" {
    skip
    run bash rational_numbers.sh "pow" "0/1" 5
    [[ $status -eq 0 ]]
    [[ $output == "0/1" ]]
}

@test "Raise one to an integer power" {
    skip
    run bash rational_numbers.sh "pow" "1/1" 4
    [[ $status -eq 0 ]]
    [[ $output == "1/1" ]]
}

@test "Raise a positive rational number to the power of zero" {
    skip
    run bash rational_numbers.sh "pow" "1/2" 0
    [[ $status -eq 0 ]]
    [[ $output == "1/1" ]]
}

@test "Raise a negative rational number to the power of zero" {
    skip
    run bash rational_numbers.sh "pow" "-1/2" 0
    [[ $status -eq 0 ]]
    [[ $output == "1/1" ]]
}


# Exponentiation of a real number to a rational number

@test "Raise a real number to a positive rational number" {
    skip
    run bash rational_numbers.sh "rpow" 8 "4/3"
    [[ $status -eq 0 ]]
    [[ $output == 16.0 ]]
}

@test "Raise a real number to a negative rational number" {
    skip
    run bash rational_numbers.sh "rpow" 9 "-1/2"
    [[ $status -eq 0 ]]
    [[ $output == 0.333333 ]]
}

@test "Raise a real number to a zero rational number" {
    skip
    run bash rational_numbers.sh "rpow" 2 "0/1"
    [[ $status -eq 0 ]]
    [[ $output == 1.0 ]]
}


# Reduction to lowest terms

@test "Reduce a positive rational number to lowest terms" {
    skip
    run bash rational_numbers.sh "reduce" "2/4"
    [[ $status -eq 0 ]]
    [[ $output ==  "1/2" ]]
}

@test "Reduce a negative rational number to lowest terms" {
    skip
    run bash rational_numbers.sh "reduce" "-4/6"
    [[ $status -eq 0 ]]
    [[ $output ==  "-2/3" ]]
}

@test "Reduce a rational number with a negative denominator to lowest terms" {
    skip
    run bash rational_numbers.sh "reduce" "3/-9"
    [[ $status -eq 0 ]]
    [[ $output ==  "-1/3" ]]
}

@test "Reduce zero to lowest terms" {
    skip
    run bash rational_numbers.sh "reduce" "0/6"
    [[ $status -eq 0 ]]
    [[ $output ==  "0/1" ]]
}

@test "Reduce an integer to lowest terms" {
    skip
    run bash rational_numbers.sh "reduce" "-14/7"
    [[ $status -eq 0 ]]
    [[ $output ==  "-2/1" ]]
}

@test "Reduce one to lowest terms" {
    skip
    run bash rational_numbers.sh "reduce" "13/13"
    [[ $status -eq 0 ]]
    [[ $output ==  "1/1" ]]
}

@test "Reduce zero to lowest terms" {
    skip
    run bash rational_numbers.sh "reduce" "0/13"
    [[ $status -eq 0 ]]
    [[ $output ==  "0/1" ]]
}

