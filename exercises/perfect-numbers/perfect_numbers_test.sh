#!/usr/bin/env bash

# "Perfect numbers"

@test "Smallest perfect number is classified correctly" {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 6
    [[ $status -eq 0 ]] 
    [[ $output == "perfect" ]]
}

@test "Medium perfect number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 28
    [[ $status -eq 0 ]] 
    [[ $output == "perfect" ]]
}

@test "Large perfect number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 33550336
    [[ $status -eq 0 ]] 
    [[ $output == "perfect" ]]
}

# "Abundant numbers"

@test "Smallest abundant number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 12
    [[ $status -eq 0 ]] 
    [[ $output == "abundant" ]]
}

@test "Medium abundant number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 30
    [[ $status -eq 0 ]] 
    [[ $output == "abundant" ]]
}

@test "Large abundant number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 33550335
    [[ $status -eq 0 ]] 
    [[ $output == "abundant" ]]
}

# "Deficient numbers"

@test "Smallest prime deficient number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 2
    [[ $status -eq 0 ]]
    [[ $output == "deficient" ]]
}

@test "Smallest non-prime deficient number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 4
    [[ $status -eq 0 ]]
    [[ $output == "deficient" ]]
}

@test "Medium deficient number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 32
    [[ $status -eq 0 ]] 
    [[ $output == "deficient" ]]
}

@test "Large deficient number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 33550337
    [[ $status -eq 0 ]] 
    [[ $output == "deficient" ]]
}

@test "Edge case (no factors other than itself) is classified correctly" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 1
    [[ $status -eq 0 ]] 
    [[ $output == "deficient" ]]
}

# "Invalid inputs"

@test "Zero is rejected (not a natural number)" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh 0
    [[ $status -eq 1 ]] 
    [[ $output == "Classification is only possible for natural numbers." ]]
}

@test "Negative integer is rejected (not a natural number)" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash perfect_numbers.sh -1
    [[ $status -eq 1 ]] 
    [[ $output == "Classification is only possible for natural numbers." ]]
}
