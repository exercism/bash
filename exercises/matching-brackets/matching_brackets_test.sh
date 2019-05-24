#!/usr/bin/env bash


@test "paired square brackets" {
    #skip
    run bash matching_brackets.sh "[]"
    [[ $status -eq 0 ]] 
    [[ $output == "true" ]]
}

@test "empty string" {
    skip
    run bash matching_brackets.sh ""
    [[ $status -eq 0 ]] 
    [[ $output == "true" ]]
}

@test "unpaired brackets" {
    skip
    run bash matching_brackets.sh "[["
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "wrong ordered brackets" {
    skip
    run bash matching_brackets.sh "}{"
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "wrong closing bracket" {
    skip
    run bash matching_brackets.sh "{]"
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "paired with whitespace" {
    skip
    run bash matching_brackets.sh "{ }"
    [[ $status -eq 0 ]] 
    [[ $output == "true" ]]
}

@test "partially paired brackets" {
    skip
    run bash matching_brackets.sh "{[])"
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "simple nested brackets" {
    skip
    run bash matching_brackets.sh "{[]}"
    [[ $status -eq 0 ]] 
    [[ $output == "true" ]]
}

@test "several paired brackets" {
    skip
    run bash matching_brackets.sh "{}[]"
    [[ $status -eq 0 ]] 
    [[ $output == "true" ]]
}

@test "paired and nested brackets" {
    skip
    run bash matching_brackets.sh "([{}({}[])])"
    [[ $status -eq 0 ]] 
    [[ $output == "true" ]]
}

@test "unopened closing brackets" {
    skip
    run bash matching_brackets.sh "{[)][]}"
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "unpaired and nested brackets" {
    skip
    run bash matching_brackets.sh "([{])"
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "paired and wrong nested brackets" {
    skip
    run bash matching_brackets.sh "[({]})"
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "paired and incomplete brackets" {
    skip
    run bash matching_brackets.sh "{}["
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "too many closing brackets" {
    skip
    run bash matching_brackets.sh "[]]"
    [[ $status -eq 0 ]] 
    [[ $output == "false" ]]
}

@test "math expression" {
    skip
    run bash matching_brackets.sh "(((185 + 223.85) * 15) - 543)/2"
    [[ $status -eq 0 ]] 
    [[ $output == "true" ]]
}

@test "complex latex expression" {
    skip
    run bash matching_brackets.sh "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
    [[ $status -eq 0 ]] 
    [[ $output == "true" ]]
}
