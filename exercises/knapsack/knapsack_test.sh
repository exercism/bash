#!/usr/bin/env bash

# Usage: knapsack.sh max_wt [items ...]
# where: items look like "weight:value"
# example:
#       knapsack.sh 10 5:10 4:40 6:30 4:50
# should return:
#       90
#

@test "error: no arguments" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash knapsack.sh
    [[ $status -eq 1 ]]
}

@test "no items" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash knapsack.sh 100
    [[ $status -eq 0 ]]
    [[ $output -eq 0 ]]
}

@test "one item: too heavy" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash knapsack.sh 10 100:1
    [[ $output -eq 0 ]]
}

@test "five items (cannot be greedy by weight)" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash knapsack.sh 10 2:5 2:5 2:5 2:5 10:21
    [[ $status -eq 0 ]]
    [[ $output -eq 21 ]]
}

@test "five items (cannot be greedy by value)" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash knapsack.sh 10 2:20 2:20 2:20 2:20 10:50
    [[ $status -eq 0 ]]
    [[ $output -eq 80 ]]
}

@test "example knapsack" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash knapsack.sh 10 5:10 4:40 6:30 4:50
    [[ $status -eq 0 ]]
    [[ $output -eq 90 ]]
}

@test "8 items" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash knapsack.sh 104 25:350 35:400 45:450 5:20 25:70 3:8 2:5 2:5
    [[ $status -eq 0 ]]
    [[ $output -eq 900 ]]
}

@test "15 items" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash knapsack.sh 750 70:135 73:139 77:149 80:150 82:156 87:163 90:173 94:184 98:192 106:201 110:210 113:214 115:221 118:229 120:240
    [[ $status -eq 0 ]]
    [[ $output -eq 1458 ]]
}
