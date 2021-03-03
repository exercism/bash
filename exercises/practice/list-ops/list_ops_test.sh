#!/usr/bin/env bash

# local version: 2.4.0.0

if (( BASH_VERSINFO[0] < 4 )); then
    echo "This exercise requires at least bash version 4" >&2
    exit 4
fi

## append entries to a list and return the new list

setup() { source list_ops.sh; }

@test "append empty lists" {
    #[[ $BATS_RUN_SKIPPED == true ]] || skip
    list1=()
    list2=()
    list::append list1 "${list2[@]}"
    (( ${#list1[@]} == 0 ))
    [[ "${list1[*]}" == "" ]]
}

@test "append list to empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list1=()
    list2=(1 2 3 4)
    list::append list1 "${list2[@]}"
    (( ${#list1[@]} == 4 ))
    [[ "${list1[*]}" == "1 2 3 4" ]]
}

@test "append empty list to list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list1=(1 2 3 4)
    list2=()
    list::append list1 "${list2[@]}"
    (( ${#list1[@]} == 4 ))
    [[ "${list1[*]}" == "1 2 3 4" ]]
}

@test "append non-empty lists" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
        l1=(1 2)
        l2=(2 3 4 5)
        list::append l1 "${l2[@]}"
        (( ${#l1[@]} == 6 ))
        [[ "${l1[*]}" == "1 2 2 3 4 5" ]]
}

## concatenate a list of lists
# N/A: bash arrays are strictly one-dimensional

## filter list returning only values that satisfy the filter function

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

## returns the length of a list
# N/A: bash array length syntax covers it: ${#ary[@]}

## map: a list of elements whose values equal the list value
## transformed by the mapping function

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

## folds (reduces) the given list from the left with a function

@test "foldl empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=()
    mult () {
        local acc=$1 elem=$2
        echo $(( elem * acc ))
    }
    result=$(list::foldl mult 2 list)
    [[ $result == "2" ]]
}

@test "foldl direction independent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 2 3 4)
    add () {
        local acc=$1 elem=$2
        echo $(( elem + acc ))
    }
    result=$(list::foldl add 5 list)
    [[ $result == "15" ]]
}

@test "foldl direction dependent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 2 3 4)
    # For this test, we need a div function that performs
    # floating point arithmetic to preserve fractions.
    div () {
        local acc=$1 elem=$2
        echo "$elem / $acc" | bc -l
    }
    answer=$(list::foldl div 24 list)
    result=$(printf '%.1f' "$answer")
    [[ $result == "64.0" ]]
}

# track-specific test
@test "foldl not just numbers" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(H e l l o " " W o r l d "!")
    concat () {
        local acc=$1 elem=$2
        echo "${acc}${elem}"
    }
    result=$(list::foldl concat "" list)
    [[ $result == 'Hello World!' ]]
}

## folds (reduces) the given list from the right with a function
# Note the order of the arguments to the given functions!

@test "foldr empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=()
    mult () {
        local elem=$1 acc=$2
        echo $(( elem * acc ))
    }
    result=$(list::foldr mult 2 list)
    [[ $result == "2" ]]
}

@test "foldr direction independent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 2 3 4)
    add () {
        local elem=$1 acc=$2
        echo $(( elem + acc ))
    }
    result=$(list::foldr add 5 list)
    [[ $result == "15" ]]
}

@test "foldr direction dependent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(1 2 3 4)
    div () {
        local elem=$1 acc=$2
        echo "$elem / $acc" | bc -l
    }
    answer=$(list::foldr div 24 list)
    result=$(printf '%.1f' "$answer")
    [[ $result == "9.0" ]]
}

# track-specific test
@test "foldr not just numbers" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=(H e l l o " " W o r l d "!")
    concat () {
        local elem=$1 acc=$2
        echo "${acc}${elem}"
    }
    result=$(list::foldr concat "" list)
    [[ $result == '!dlroW olleH' ]]
}

## reverse the elements of the list

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

@test "reverse with special characters" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    list=("R*" "l*")
    result=()
    list::reverse list result
    (( ${#result[@]} == ${#list[@]} ))
    [[ "${result[*]}" == "l* R*" ]]
}
