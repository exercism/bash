#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_parsing_and_numbers_numbers_just_get_pushed_onto_the_stack() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 4 5
END
    assert_success
    assert_output "1 2 3 4 5"
}

test_parsing_and_numbers_pushes_negative_numbers_onto_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
-1 -2 -3 -4 -5
END
    assert_success
    assert_output "-1 -2 -3 -4 -5"
}

test_addition_can_add_two_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 +
END
    assert_success
    assert_output "3"
}

test_addition_errors_if_there_is_nothing_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
+
END
    assert_failure
    assert_output --partial "empty stack"
}

test_addition_errors_if_there_is_only_one_value_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 +
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

test_addition_more_than_two_values_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 +
END
    assert_success
    assert_output "1 5"
}

test_subtraction_can_subtract_two_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
3 4 -
END
    assert_success
    assert_output "-1"
}

test_subtraction_errors_if_there_is_nothing_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
-
END
    assert_failure
    assert_output --partial "empty stack"
}

test_subtraction_errors_if_there_is_only_one_value_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 -
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

test_subtraction_more_than_two_values_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 12 3 -
END
    assert_success
    assert_output "1 9"
}

test_multiplication_can_multiply_two_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
2 4 *
END
    assert_success
    assert_output "8"
}

test_multiplication_errors_if_there_is_nothing_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
*
END
    assert_failure
    assert_output --partial "empty stack"
}

test_multiplication_errors_if_there_is_only_one_value_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 *
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

test_multiplication_more_than_two_values_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 *
END
    assert_success
    assert_output "1 6"
}

test_division_can_divide_two_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
12 3 /
END
    assert_success
    assert_output "4"
}

test_division_performs_integer_division() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
8 3 /
END
    assert_success
    assert_output "2"
}

test_division_errors_if_dividing_by_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
4 0 /
END
    assert_failure
    assert_output --partial "divide by zero"
}

test_division_errors_if_there_is_nothing_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
/
END
    assert_failure
    assert_output --partial "empty stack"
}

test_division_errors_if_there_is_only_one_value_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 /
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

test_division_more_than_two_values_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 12 3 /
END
    assert_success
    assert_output "1 4"
}

test_combined_arithmetic_addition_and_subtraction() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 + 4 -
END
    assert_success
    assert_output "-1"
}

test_combined_arithmetic_multiplication_and_division() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
2 4 * 3 /
END
    assert_success
    assert_output "2"
}

test_combined_arithmetic_multiplication_and_addition() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 3 4 * +
END
    assert_success
    assert_output "13"
}

test_combined_arithmetic_addition_and_multiplication() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 3 4 + *
END
    assert_success
    assert_output "7"
}

test_dup_copies_a_value_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 dup
END
    assert_success
    assert_output "1 1"
}

test_dup_copies_the_top_value_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 dup
END
    assert_success
    assert_output "1 2 2"
}

test_dup_errors_if_there_is_nothing_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
dup
END
    assert_failure
    assert_output --partial "empty stack"
}

test_drop_removes_the_top_value_on_the_stack_if_it_is_the_only_one() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 drop
END
    assert_success
    assert_output ""
}

test_drop_removes_the_top_value_on_the_stack_if_it_is_not_the_only_one() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 drop
END
    assert_success
    assert_output "1"
}

test_drop_errors_if_there_is_nothing_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
drop
END
    assert_failure
    assert_output --partial "empty stack"
}

test_swap_swaps_the_top_two_values_on_the_stack_if_they_are_the_only_ones() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 swap
END
    assert_success
    assert_output "2 1"
}

test_swap_swaps_the_top_two_values_on_the_stack_if_they_are_not_the_only_ones() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 swap
END
    assert_success
    assert_output "1 3 2"
}

test_swap_errors_if_there_is_nothing_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
swap
END
    assert_failure
    assert_output --partial "empty stack"
}

test_swap_errors_if_there_is_only_one_value_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 swap
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

test_over_copies_the_second_element_if_there_are_only_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 over
END
    assert_success
    assert_output "1 2 1"
}

test_over_copies_the_second_element_if_there_are_more_than_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 over
END
    assert_success
    assert_output "1 2 3 2"
}

test_over_errors_if_there_is_nothing_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
over
END
    assert_failure
    assert_output --partial "empty stack"
}

test_over_errors_if_there_is_only_one_value_on_the_stack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 over
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

test_user_defined_words_can_consist_of_built_in_words() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: dup-twice dup dup ;
1 dup-twice
END
    assert_success
    assert_output "1 1 1"
}

test_user_defined_words_execute_in_the_right_order() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: countup 1 2 3 ;
countup
END
    assert_success
    assert_output "1 2 3"
}

test_user_defined_words_can_override_other_user_defined_words() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo dup ;
: foo dup dup ;
1 foo
END
    assert_success
    assert_output "1 1 1"
}

test_user_defined_words_can_override_built_in_words() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: swap dup ;
1 swap
END
    assert_success
    assert_output "1 1"
}

test_user_defined_words_can_override_built_in_operators() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: + * ;
3 4 +
END
    assert_success
    assert_output "12"
}

test_user_defined_words_can_use_different_words_with_the_same_name() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo 5 ;
: bar foo ;
: foo 6 ;
bar foo
END
    assert_success
    assert_output "5 6"
}

test_user_defined_words_can_define_word_that_uses_word_with_the_same_name() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo 10 ;
: foo foo 1 + ;
foo
END
    assert_success
    assert_output "11"
}

test_user_defined_words_cannot_redefine_non_negative_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: 1 2 ;
END
    assert_failure
    assert_output --partial "illegal operation"
}

test_user_defined_words_cannot_redefine_negative_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: -1 2 ;
END
    assert_failure
    assert_output --partial "illegal operation"
}

test_user_defined_words_errors_if_executing_a_non_existent_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
foo
END
    assert_failure
    assert_output --partial "undefined operation"
}

test_case_insensitivity_dup_is_case_insensitive() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 DUP Dup dup
END
    assert_success
    assert_output "1 1 1 1"
}

test_case_insensitivity_drop_is_case_insensitive() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 4 DROP Drop drop
END
    assert_success
    assert_output "1"
}

test_case_insensitivity_swap_is_case_insensitive() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 SWAP 3 Swap 4 swap
END
    assert_success
    assert_output "2 3 4 1"
}

test_case_insensitivity_over_is_case_insensitive() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 OVER Over over
END
    assert_success
    assert_output "1 2 1 2 1"
}

test_case_insensitivity_user_defined_words_are_case_insensitive() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo dup ;
1 FOO Foo foo
END
    assert_success
    assert_output "1 1 1 1"
}

test_case_insensitivity_definitions_are_case_insensitive() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: SWAP DUP Dup dup ;
1 swap
END
    assert_success
    assert_output "1 1 1 1"
}
