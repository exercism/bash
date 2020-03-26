#!/usr/bin/env bash

# local version: 2.0.0.0


@test "paired square brackets" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[]"
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "empty string" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh ""
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "unpaired brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[["
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "wrong ordered brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "}{"
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "wrong closing bracket" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{]"
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "paired with whitespace" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{ }"
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "partially paired brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{[])"
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "simple nested brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{[]}"
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "several paired brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{}[]"
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "paired and nested brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "([{}({}[])])"
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "unopened closing brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{[)][]}"
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "unpaired and nested brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "([{])"
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "paired and wrong nested brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[({]})"
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "paired and incomplete brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{}["
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "too many closing brackets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[]]"
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "math expression" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "(((185 + 223.85) * 15) - 543)/2"
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "complex latex expression" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
    (( status == 0 )) 
    [[ $output == "true" ]]
}
