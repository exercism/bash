#!/usr/bin/env bash

# local version: 2.4.0.0

if (( BASH_VERSINFO[0] < 4 )); then
    echo "This exercise requires at least bash version 4" >&2
    exit 4
fi

# append entries to a list and return the new list

setup() { source list_ops.sh; }

@test "append empty lists" {
    #[[ $BATS_RUN_SKIPPED == true ]] || skip
    l1=()
    l2=()
    list::append l1 "${l2[@]}"
    (( ${#l1[@]} == 0 ))
    [[ "${l1[*]}" == "" ]]
}

@test "append list to empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    l1=()
    l2=(1 2 3 4)
    list::append l1 "${l2[@]}"
    (( ${#l1[@]} == 4 ))
    [[ "${l1[*]}" == "1 2 3 4" ]]
}

@test "append non-empty list to list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
        l1=(1 2)
        l2=(2 3 4 5)
        list::append l1 "${l2[@]}"
        (( ${#l1[@]} == 6 ))
        [[ "${l1[*]}" == "1 2 2 3 4 5" ]]
}

# concatenate a list of lists
# N/A: bash arrays are strictly one-dimensional

# filter list returning only values that satisfy the filter function

@test "filter empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=()
    result=()
    isOdd () { (( $1 % 2 == 1 )); }
    list::filter isOdd list result
    (( ${#result[@]} == 0 ))
    [[ "${result[*]}" == "" ]]
}

@test "filter non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 2 3 4 5)
    result=()
    isOdd () { (( $1 % 2 == 1 )); }
    list::filter isOdd list result
    (( ${#result[@]} == 3 ))
    [[ "${result[*]}" == "1 3 5" ]]
}

# returns the length of a list
# N/A: bash array length syntax covers it: ${#ary[@]}

# map: a list of elements whose values equal the list value transformed by
# the mapping function

@test "map empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=()
    result=()
    incr () { echo $(( $1 + 1 )); }
    list::map incr list result
    (( ${#result[@]} == ${#list[@]} ))
    [[ "${result[*]}" == "" ]]
}

@test "map non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 3 5 7)
    result=()
    incr () { echo $(( $1 + 1 )); }
    list::map incr list result
    (( ${#result[@]} == ${#list[@]} ))
    [[ "${result[*]}" == "2 4 6 8" ]]
}

# folds (reduces) the given list from the left with a function

@test "foldl empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=()
    mult () { echo $(( $1 * $2 )); }
    result=$(list::foldl mult 2 list)
    [[ $result == "2" ]]
}

@test "foldl direction independent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 2 3 4)
    add () { echo $(( $1 + $2 )); }
    result=$(list::foldl add 5 list)
    [[ $result == "15" ]]
}

@test "foldl direction dependent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(2 5)
    div () { echo $(( $1 / $2 )); }
    result=$(list::foldl div 5 list)
    [[ $result == "0" ]]
}

@test "foldl not just numbers" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(H e l l o " " W o r l d "!")
    concat () { echo "$1$2"; }
    result=$(list::foldl concat "" list)
    [[ $result == 'Hello World!' ]]
}

# folds (reduces) the given list from the right with a function

@test "foldr empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=()
    mult () { echo $(( $1 * $2 )); }
    result=$(list::foldr mult 2 list)
    [[ $result == "2" ]]
}

@test "foldr direction independent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 2 3 4)
    add () { echo $(( $1 + $2 )); }
    result=$(list::foldr add 5 list)
    [[ $result == "15" ]]
}

@test "foldr direction dependent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(2 5)
    div () { echo $(( $1 / $2 )); }
    result=$(list::foldr div 5 list)
    [[ $result == "2" ]]
}

@test "foldr not just numbers" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(H e l l o " " W o r l d "!")
    concat () { echo "$1$2"; }
    result=$(list::foldr concat "" list)
    [[ $result == 'Hello World!' ]]
}

# reverse the elements of the list

@test "reverse empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=()
    result=()
    list::reverse list result
    (( ${#result[@]} == ${#list[@]} ))
    [[ "${result[*]}" == "" ]]
}

@test "reverse non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 3 5 7)
    result=()
    list::reverse list result
    (( ${#result[@]} == ${#list[@]} ))
    [[ "${result[*]}" == "7 5 3 1" ]]
}
