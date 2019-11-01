#!/usr/bin/env bash

# local version: 2.4.0.0

if [[ ${BASH_VERSINFO[0]} -lt 4 ]]; then
    echo "This exercise requires at least bash version 4" >&2
    exit 4
fi

# append entries to a list and return the new list

@test "append empty lists" {
    #[[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        l1=()
        l2=()
        list::append l1 "${l2[@]}"
        (( ${#l1[@]} == 0 )) || exit 1
        echo "${l1[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "append list to empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        l1=()
        l2=(1 2 3 4)
        list::append l1 "${l2[@]}"
        (( ${#l1[@]} == 4 )) || exit 1
        echo "${l1[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "1 2 3 4" ]]
}

@test "append non-empty list to list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        l1=(1 2)
        l2=(2 3 4 5)
        list::append l1 "${l2[@]}"
        (( ${#l1[@]} == 6 )) || exit 1
        echo "${l1[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "1 2 2 3 4 5" ]]
}

# concatenate a list of lists
# N/A: bash arrays are strictly one-dimensional

# filter list returning only values that satisfy the filter function

@test "filter empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=()
        result=()
        isOdd () { (( $1 % 2 == 1 )); }
        list::filter isOdd list result
        (( ${#result[@]} == 0 )) || exit 1
        echo "${result[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "filter non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(1 2 3 4 5)
        result=()
        isOdd () { (( $1 % 2 == 1 )); }
        list::filter isOdd list result
        (( ${#result[@]} == 3 )) || exit 1
        echo "${result[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "1 3 5" ]]
}

# returns the length of a list
# N/A: bash array length syntax covers it: ${#ary[@]}

# map: a list of elements whose values equal the list value transformed by
# the mapping function

@test "map empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=()
        result=()
        incr () { echo $(( $1 + 1 )); }
        list::map incr list result
        (( ${#result[@]} == ${#list[@]} )) || exit 1
        echo "${result[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "map non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(1 3 5 7)
        result=()
        incr () { echo $(( $1 + 1 )); }
        list::map incr list result
        (( ${#result[@]} == ${#list[@]} )) || exit 1
        echo "${result[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "2 4 6 8" ]]
}

# folds (reduces) the given list from the left with a function

@test "foldl empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=()
        mult () { echo $(( $1 * $2 )); }
        list::foldl mult 2 list
    '
    [[ $status -eq 0 ]]
    [[ $output == "2" ]]
}

@test "foldl direction independent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(1 2 3 4)
        add () { echo $(( $1 + $2 )); }
        list::foldl add 5 list
    '
    [[ $status -eq 0 ]]
    [[ $output == "15" ]]
}

@test "foldl direction dependent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(2 5)
        div () { echo $(( $1 / $2 )); }
        list::foldl div 5 list
    '
    [[ $status -eq 0 ]]
    [[ $output == "0" ]]
}

@test "foldl not just numbers" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(H e l l o " " W o r l d "!")
        concat () { echo "$1$2"; }
        list::foldl concat "" list
    '
    [[ $status -eq 0 ]]
    [[ $output == 'Hello World!' ]]
}

# folds (reduces) the given list from the right with a function

@test "foldr empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=()
        mult () { echo $(( $1 * $2 )); }
        list::foldr mult 2 list
    '
    [[ $status -eq 0 ]]
    [[ $output == "2" ]]
}

@test "foldr direction independent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(1 2 3 4)
        add () { echo $(( $1 + $2 )); }
        list::foldr add 5 list
    '
    [[ $status -eq 0 ]]
    [[ $output == "15" ]]
}

@test "foldr direction dependent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(2 5)
        div () { echo $(( $1 / $2 )); }
        list::foldr div 5 list
    '
    [[ $status -eq 0 ]]
    [[ $output == "2" ]]
}

@test "foldr not just numbers" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(H e l l o " " W o r l d "!")
        concat () { echo "$1$2"; }
        list::foldr concat "" list
    '
    [[ $status -eq 0 ]]
    [[ $output == 'Hello World!' ]]
}

# reverse the elements of the list

@test "reverse empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=()
        result=()
        list::reverse list result
        (( ${#result[@]} == ${#list[@]} )) || exit 1
        echo "${result[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "reverse non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash -c '
        source list_ops.sh
        list=(1 3 5 7)
        result=()
        list::reverse list result
        (( ${#result[@]} == ${#list[@]} )) || exit 1
        echo "${result[*]}"
    '
    [[ $status -eq 0 ]]
    [[ $output == "7 5 3 1" ]]
}
