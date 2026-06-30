#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-30T00:18:40+00:00
# shellcheck disable=SC2329 # "This function is never invoked."

bash_version=$((10 * BASH_VERSINFO[0] + BASH_VERSINFO[1]))
if (( bash_version < 43 )); then
    echo "This exercise requires at least bash version 4.3" >&2
    exit 4
fi

## append entries to a list and return the new list

setup() { source list_ops.sh; }


@test "append entries to a list and return the new list: empty lists" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list1=()
    local list2=()
    list::append list1 "${list2[@]}"
    assert_equal "${#list1[@]}" 0
    assert_equal "${list1[*]}" ""
}

@test "append entries to a list and return the new list: list to empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list1=()
    local list2=(1 2 3 4)
    list::append list1 "${list2[@]}"
    assert_equal "${#list1[@]}" 4
    assert_equal "${list1[*]}" "1 2 3 4"
}

@test "append entries to a list and return the new list: empty list to list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list1=(1 2 3 4)
    local list2=()
    list::append list1 "${list2[@]}"
    assert_equal "${#list1[@]}" 4
    assert_equal "${list1[*]}" "1 2 3 4"
}

@test "append entries to a list and return the new list: non-empty lists" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list1=(1 2)
    local list2=(2 3 4 5)
    list::append list1 "${list2[@]}"
    assert_equal "${#list1[@]}" 6
    assert_equal "${list1[*]}" "1 2 2 3 4 5"
}

@test "filter list returning only values that satisfy the filter function: empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=()
    local result=()
    isOdd () { (( $1 % 2 == 1 )); }
    list::filter isOdd list result
    assert_equal "${#result[@]}" 0
    assert_equal "${result[*]}" ""
}

@test "filter list returning only values that satisfy the filter function: non-empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 2 3 5)
    local result=()
    isOdd () { (( $1 % 2 == 1 )); }
    list::filter isOdd list result
    assert_equal "${#result[@]}" 3
    assert_equal "${result[*]}" "1 3 5"
}

@test "return a list of elements whose values equal the list value transformed by the mapping function: empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=()
    local result=()
    incr () { echo $(( $1 + 1 )); }
    list::map incr list result
    assert_equal "${#result[@]}" 0
    assert_equal "${result[*]}" ""
}

@test "return a list of elements whose values equal the list value transformed by the mapping function: non-empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 3 5 7)
    local result=()
    incr () { echo $(( $1 + 1 )); }
    list::map incr list result
    assert_equal "${#result[@]}" 4
    assert_equal "${result[*]}" "2 4 6 8"
}

@test "folds (reduces) the given list from the left with a function: empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=()
    local result=()
    mult () {
        local acc=$1 elem=$2
        echo $(( acc * elem ))
    }
    result=$(list::foldl mult 2 list)
    assert_equal "$result" "2"
}

@test "folds (reduces) the given list from the left with a function: direction independent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 2 3 4)
    local result=()
    add () {
        local acc=$1 elem=$2
        echo $(( acc + elem ))
    }
    result=$(list::foldl add 5 list)
    assert_equal "$result" "15"
}

@test "folds (reduces) the given list from the left with a function: direction dependent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 2 3 4)
    local result=()
    # For this test, we need a div function that performs
    # floating point arithmetic to preserve fractions.
    div () {
        local acc=$1 elem=$2
        echo "$elem / $acc" | bc -l
    }
    answer=$(list::foldl div 24 list)
    result=$(printf '%.1f' "$answer")
    assert_equal "$result" "64.0"
}

@test "folds (reduces) the given list from the right with a function: empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=()
    local result=()
    mult () {
        local elem=$1 acc=$2
        echo $(( elem * acc ))
    }
    result=$(list::foldr mult 2 list)
    assert_equal "$result" "2"
}

@test "folds (reduces) the given list from the right with a function: direction independent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 2 3 4)
    local result=()
    add () {
        local elem=$1 acc=$2
        echo $(( elem + acc ))
    }
    result=$(list::foldr add 5 list)
    assert_equal "$result" "15"
}

@test "folds (reduces) the given list from the right with a function: direction dependent function applied to non-empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 2 3 4)
    local result=()
    # For this test, we need a div function that performs
    # floating point arithmetic to preserve fractions.
    div () {
        local elem=$1 acc=$2
        echo "$elem / $acc" | bc -l
    }
    answer=$(list::foldr div 24 list)
    result=$(printf '%.1f' "$answer")
    assert_equal "$result" "9.0"
}

@test "reverse the elements of the list: empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=()
    local result=()
    list::reverse list result
    assert_equal "${#result[@]}" 0
    assert_equal "${result[*]}" ""
}

@test "reverse the elements of the list: non-empty list" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 3 5 7)
    local result=()
    list::reverse list result
    assert_equal "${#result[@]}" 4
    assert_equal "${result[*]}" "7 5 3 1"
}


# track-specific test

@test "foldl not just numbers" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(H e l l o " " W o r l d "!")
    local result
    concat () {
        local acc=$1 elem=$2
        echo "${acc}${elem}"
    }
    result=$(list::foldl concat "" list)
    assert_equal "$result" 'Hello World!'
}

@test "foldr not just numbers" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(H e l l o " " W o r l d "!")
    local result
    concat () {
        local elem=$1 acc=$2
        echo "${acc}${elem}"
    }
    result=$(list::foldr concat "" list)
    assert_equal "$result" '!dlroW olleH'
}

@test "reverse with special characters" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=("R*" "l*")
    local result=()
    list::reverse list result
    assert_equal "${#result[@]}" 2
    assert_equal "${result[*]}" "l* R*"
}
