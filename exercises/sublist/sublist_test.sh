#!/usr/bin/env bash

# local version: 1.1.0.0

# Lists are ordered and sequential: do not sort or reorder them.
# Lists are given in JSON format.


@test "empty lists" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[]" "[]"
    (( status == 0 ))
    [[ $output == "equal" ]]
}

@test "empty list within non empty list" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[]" "[1, 2, 3]"
    (( status == 0 ))
    [[ $output == "sublist" ]]
}

@test "non empty list contains empty list" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[]"
    (( status == 0 ))
    [[ $output == "superlist" ]]
}

@test "list equals itself" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[1, 2, 3]"
    (( status == 0 ))
    [[ $output == "equal" ]]
}

@test "different lists" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[2, 3, 4]"
    (( status == 0 ))
    [[ $output == "unequal" ]]
}

@test "false start" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 2, 5]" "[0, 1, 2, 3, 1, 2, 5, 6]"
    (( status == 0 ))
    [[ $output == "sublist" ]]
}

@test "consecutive" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 1, 2]" "[0, 1, 1, 1, 2, 1, 2]"
    (( status == 0 ))
    [[ $output == "sublist" ]]
}

@test "sublist at start" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[0, 1, 2]" "[0, 1, 2, 3, 4, 5]"
    (( status == 0 ))
    [[ $output == "sublist" ]]
}

@test "sublist in middle" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[2, 3, 4]" "[0, 1, 2, 3, 4, 5]"
    (( status == 0 ))
    [[ $output == "sublist" ]]
}

@test "sublist at end" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[3, 4, 5]" "[0, 1, 2, 3, 4, 5]"
    (( status == 0 ))
    [[ $output == "sublist" ]]
}

@test "at start of superlist" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[0, 1, 2]"
    (( status == 0 ))
    [[ $output == "superlist" ]]
}

@test "in middle of superlist" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[2, 3]"
    (( status == 0 ))
    [[ $output == "superlist" ]]
}

@test "at end of superlist" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[3, 4, 5]"
    (( status == 0 ))
    [[ $output == "superlist" ]]
}

@test "first list missing element from second list" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 3]" "[1, 2, 3]"
    (( status == 0 ))
    [[ $output == "unequal" ]]
}

@test "second list missing element from first list" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[1, 3]"
    (( status == 0 ))
    [[ $output == "unequal" ]]
}

@test "order matters to a list" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[3, 2, 1]"
    (( status == 0 ))
    [[ $output == "unequal" ]]
}

@test "same digits but different numbers" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash sublist.sh "[1, 0, 1]" "[10, 1]"
    (( status == 0 ))
    [[ $output == "unequal" ]]
}
