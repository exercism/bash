#!/usr/bin/env bash

# canonical-data version: 1.2.0


@test "finds the smallest palindrome from single digit factors" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh smallest 1 9
    [[ $status -eq 0 ]]
    [[ $output == "1:"* ]]      # starts with the palindrome
    [[ $output == *"[1, 1]"* ]] # contains the factors
}

@test "finds the largest palindrome from single digit factors" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh largest 1 9
    [[ $status -eq 0 ]]
    [[ $output == "9:"* ]]      # starts with the palindrome
    [[ $output == *"[1, 9]"* ]] # contains the factors
    [[ $output == *"[3, 3]"* ]] # contains the factors
}

@test "find the smallest palindrome from double digit factors" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh smallest 10 99
    [[ $status -eq 0 ]]
    [[ $output == "121:"* ]]      # starts with the palindrome
    [[ $output == *"[11, 11]"* ]] # contains the factors
}

@test "find the largest palindrome from double digit factors" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh largest 10 99
    [[ $status -eq 0 ]]
    [[ $output == "9009:"* ]]     # starts with the palindrome
    [[ $output == *"[91, 99]"* ]] # contains the factors
}

@test "find smallest palindrome from triple digit factors" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh smallest 100 999
    [[ $status -eq 0 ]]
    [[ $output == "10201:"* ]]      # starts with the palindrome
    [[ $output == *"[101, 101]"* ]] # contains the factors
}

@test "find the largest palindrome from triple digit factors" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh largest 100 999
    [[ $status -eq 0 ]]
    [[ $output == "906609:"* ]]     # starts with the palindrome
    [[ $output == *"[913, 993]"* ]] # contains the factors
}

@test "find smallest palindrome from four digit factors" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh smallest 1000 9999
    [[ $status -eq 0 ]]
    [[ $output == "1002001:"* ]]      # starts with the palindrome
    [[ $output == *"[1001, 1001]"* ]] # contains the factors
}

@test "find the largest palindrome from four digit factors" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh largest 1000 9999
    [[ $status -eq 0 ]]
    [[ $output == "99000099:"* ]]     # starts with the palindrome
    [[ $output == *"[9901, 9999]"* ]] # contains the factors
}

@test "empty result for smallest if no palindrome in the range" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh smallest 1002 1003
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "empty result for largest if no palindrome in the range" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh largest 15 15
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "error result for smallest if min is more than max" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh smallest 10000 1
    [[ $status -eq 1 ]]
    [[ $output == *"min must be <= max"* ]]
}

@test "error result for largest if min is more than max" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh largest 2 1
    [[ $status -eq 1 ]]
    [[ $output == *"min must be <= max"* ]]
}

@test "error result for first param" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash palindrome_products.sh foo 2 3
    [[ $status -eq 1 ]]
    [[ $output == *"first arg should be 'smallest' or 'largest'"* ]]
}
