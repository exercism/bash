#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00
# shellcheck disable=SC2329 # "This function is never invoked."

bash_version=$((10 * BASH_VERSINFO[0] + BASH_VERSINFO[1]))
if (( bash_version < 43 )); then
    echo "This exercise requires at least bash version 4.3" >&2
    exit 4
fi

## append entries to a list and return the new list

setup() { source list_ops.sh; }


test_append_entries_to_a_list_and_return_the_new_list_empty_lists() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list1=()
    local list2=()
    list::append list1 "${list2[@]}"
    assert_equal "${#list1[@]}" 0
    assert_equal "${list1[*]}" ""
}

test_append_entries_to_a_list_and_return_the_new_list_list_to_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list1=()
    local list2=(1 2 3 4)
    list::append list1 "${list2[@]}"
    assert_equal "${#list1[@]}" 4
    assert_equal "${list1[*]}" "1 2 3 4"
}

test_append_entries_to_a_list_and_return_the_new_list_empty_list_to_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list1=(1 2 3 4)
    local list2=()
    list::append list1 "${list2[@]}"
    assert_equal "${#list1[@]}" 4
    assert_equal "${list1[*]}" "1 2 3 4"
}

test_append_entries_to_a_list_and_return_the_new_list_non_empty_lists() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list1=(1 2)
    local list2=(2 3 4 5)
    list::append list1 "${list2[@]}"
    assert_equal "${#list1[@]}" 6
    assert_equal "${list1[*]}" "1 2 2 3 4 5"
}

test_filter_list_returning_only_values_that_satisfy_the_filter_function_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=()
    local result=()
    isOdd () { (( $1 % 2 == 1 )); }
    list::filter isOdd list result
    assert_equal "${#result[@]}" 0
    assert_equal "${result[*]}" ""
}

test_filter_list_returning_only_values_that_satisfy_the_filter_function_non_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 2 3 5)
    local result=()
    isOdd () { (( $1 % 2 == 1 )); }
    list::filter isOdd list result
    assert_equal "${#result[@]}" 3
    assert_equal "${result[*]}" "1 3 5"
}

test_return_a_list_of_elements_whose_values_equal_the_list_value_transformed_by_the_mapping_function_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=()
    local result=()
    incr () { echo $(( $1 + 1 )); }
    list::map incr list result
    assert_equal "${#result[@]}" 0
    assert_equal "${result[*]}" ""
}

test_return_a_list_of_elements_whose_values_equal_the_list_value_transformed_by_the_mapping_function_non_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 3 5 7)
    local result=()
    incr () { echo $(( $1 + 1 )); }
    list::map incr list result
    assert_equal "${#result[@]}" 4
    assert_equal "${result[*]}" "2 4 6 8"
}

test_folds_reduces_the_given_list_from_the_left_with_a_function_empty_list() { # @test
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

test_folds_reduces_the_given_list_from_the_left_with_a_function_direction_independent_function_applied_to_non_empty_list() { # @test
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

test_folds_reduces_the_given_list_from_the_left_with_a_function_direction_dependent_function_applied_to_non_empty_list() { # @test
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

test_folds_reduces_the_given_list_from_the_right_with_a_function_empty_list() { # @test
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

test_folds_reduces_the_given_list_from_the_right_with_a_function_direction_independent_function_applied_to_non_empty_list() { # @test
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

test_folds_reduces_the_given_list_from_the_right_with_a_function_direction_dependent_function_applied_to_non_empty_list() { # @test
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

test_reverse_the_elements_of_the_list_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=()
    local result=()
    list::reverse list result
    assert_equal "${#result[@]}" 0
    assert_equal "${result[*]}" ""
}

test_reverse_the_elements_of_the_list_non_empty_even_length_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 3 5 7)
    local result=()
    list::reverse list result
    assert_equal "${#result[@]}" 4
    assert_equal "${result[*]}" "7 5 3 1"
}

test_reverse_the_elements_of_the_list_non_empty_odd_length_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    local list=(1 3 5 7 9 11 13)
    local result=()
    list::reverse list result
    assert_equal "${#result[@]}" 7
    assert_equal "${result[*]}" "13 11 9 7 5 3 1"
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
