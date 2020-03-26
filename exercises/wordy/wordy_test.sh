#!/usr/bin/env bash

# local version: 1.5.0.0

@test "just a number" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 5?"
    (( status == 0 ))
    [[ $output == "5" ]]
}

@test "addition" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus 1?"
    (( status == 0 ))
    [[ $output == "2" ]]
}

@test "more addition" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 53 plus 2?"
    (( status == 0 ))
    [[ $output == "55" ]]
}

@test "addition with negative numbers" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -1 plus -10?"
    (( status == 0 ))
    [[ $output == "-11" ]]
}

@test "large addition" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 123 plus 45678?"
    (( status == 0 ))
    [[ $output == "45801" ]]
}

@test "subtraction" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 4 minus -12?"
    (( status == 0 ))
    [[ $output == "16" ]]
}

@test "multiplication" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -3 multiplied by 25?"
    (( status == 0 ))
    [[ $output == "-75" ]]
}

@test "division" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 33 divided by -3?"
    (( status == 0 ))
    [[ $output == "-11" ]]
}

@test "multiple additions" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus 1 plus 1?"
    (( status == 0 ))
    [[ $output == "3" ]]
}

@test "addition and subtraction" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus 5 minus -2?"
    (( status == 0 ))
    [[ $output == "8" ]]
}

@test "multiple subtraction" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 20 minus 4 minus 13?"
    (( status == 0 ))
    [[ $output == "3" ]]
}

@test "subtraction then addition" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 17 minus 6 plus 3?"
    (( status == 0 ))
    [[ $output == "14" ]]
}

@test "multiple multiplication" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 2 multiplied by -2 multiplied by 3?"
    (( status == 0 ))
    [[ $output == "-12" ]]
}

@test "addition and multiplication" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -3 plus 7 multiplied by -2?"
    (( status == 0 ))
    [[ $output == "-8" ]]
}

@test "multiple division" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -12 divided by 2 divided by -3?"
    (( status == 0 ))
    [[ $output == "2" ]]
}

@test "strict left to right, ignores typical order of operations" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 2 plus 3 multiplied by 4?"
    (( status == 0 ))
    [[ $output != "14" ]]
    [[ $output == "20" ]]
}

@test "unknown operation" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 52 cubed?"
    (( status == 1 ))
    [[ $output == "unknown operation" ]]
}

@test "Non math question" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "Who is the President of the United States?"
    (( status == 1 ))
    [[ $output == "unknown operation" ]]
}

@test "reject problem with no operands" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is plus?"
    (( status == 1 ))
    [[ $output == "syntax error" ]]
}

@test "reject problem missing an operand" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus?"
    (( status == 1 ))
    [[ $output == "syntax error" ]]
}

@test "reject problem with no operands or operators" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is?"
    (( status == 1 ))
    [[ $output == "syntax error" ]]
}

@test "reject two operations in a row" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus plus 2?"
    (( status == 1 ))
    [[ $output == "syntax error" ]]
}

@test "reject two numbers in a row" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus 2 1?"
    (( status == 1 ))
    [[ $output == "syntax error" ]]
}

@test "reject postfix notation" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 2 plus?"
    (( status == 1 ))
    [[ $output == "syntax error" ]]
}

@test "reject prefix notation" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is plus 1 2?"
    (( status == 1 ))
    [[ $output == "syntax error" ]]
}
