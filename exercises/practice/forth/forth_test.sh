#!/usr/bin/env bash
load bats-extra

# local version: 1.7.1.0

# parsing and numbers
@test numbers_only {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 4 5
END
    assert_success
    assert_output "1 2 3 4 5"
}

# addition
@test addition_ok {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 +
END
    assert_success
    assert_output "3"
}

@test addition_no_args {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
+
END
    assert_failure
    assert_output --partial "empty stack"
}

@test addition_one_args {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 +
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

# subtraction
@test subtraction_ok {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
3 4 -
END
    assert_success
    assert_output "-1"
}

@test subtraction_no_args {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
-
END
    assert_failure
    assert_output --partial "empty stack"
}

@test subtraction_one_args {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 -
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

# multiplication
@test multiplication_ok {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
2 4 *
END
    assert_success
    assert_output "8"
}

@test multiplication_no_args {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
*
END
    assert_failure
    assert_output --partial "empty stack"
}

@test multiplication_one_args {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 *
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

# division
@test division_ok {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
12 4 /
END
    assert_success
    assert_output "3"
}

@test division_int_result {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
15 4 /
END
    assert_success
    assert_output "3"
}

@test division_no_args {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
/
END
    assert_failure
    assert_output --partial "empty stack"
}

@test division_one_args {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 /
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

@test division_by_zero {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
2 0 /
END
    assert_failure
    assert_output --partial "divide by zero"
}

# combined arithmetic
@test add_and_subtract {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 + 4 -
END
    assert_success
    assert_output "-1"
}
@test multiply_and_divide {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
2 4 * 3 /
END
    assert_success
    assert_output "2"
}

# dup
@test dup_1 {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
42 dup
END
    assert_success
    assert_output "42 42"
}

@test dup_2 {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 dup
END
    assert_success
    assert_output "1 2 2"
}

@test dup_empty {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
dup
END
    assert_failure
    assert_output --partial "empty stack"
}

# drop
@test drop_1 {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
42 drop
END
    assert_success
    assert_output ""
}

@test drop_2 {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 drop
END
    assert_success
    assert_output "1"
}

@test drop_empty {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
drop
END
    assert_failure
    assert_output --partial "empty stack"
}

# swap
@test swap_1 {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 swap
END
    assert_success
    assert_output "2 1"
}

@test swap_2 {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 swap
END
    assert_success
    assert_output "1 3 2"
}

@test swap_empty {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
swap
END
    assert_failure
    assert_output --partial "empty stack"
}

@test swap_1arg {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 swap
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

# over
@test over_1 {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 over
END
    assert_success
    assert_output "1 2 1"
}

@test over_2 {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 over
END
    assert_success
    assert_output "1 2 3 2"
}

@test over_empty {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
over
END
    assert_failure
    assert_output --partial "empty stack"
}

@test over_1arg {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 over
END
    assert_failure
    assert_output --partial "only one value on the stack"
}

# user-defined words
@test macro_with_builtin {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: dup-twice dup dup ;
1 dup-twice
END
    assert_success
    assert_output "1 1 1"
}

@test macro_maintain_order {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: countup 1 2 3 ;
countup
END
    assert_success
    assert_output "1 2 3"
}

@test macro_can_override_macro {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo dup ;
: foo swap ;
1 2 foo
END
    assert_success
    assert_output "2 1"
}

@test macro_can_override_builtin {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: swap dup ;
1 swap
END
    assert_success
    assert_output "1 1"
}

@test macro_can_override_operator {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: + * ;
3 4 +
END
    assert_success
    assert_output "12"
}

@test macro_expand_in_macro_definition {
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

@test macro_empty_definition {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo ;
END
    assert_failure
    assert_output --partial "empty macro definition"
}

@test macro_expand_in_macro_redefinition {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo 10 ;
: foo foo 1 + ;
foo
END
    assert_success
    assert_output "11"
}

@test macro_cannot_redefine_non_negative_numbers {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: 1 2 ;
END
    assert_failure
    assert_output --partial "illegal operation"
}

@test macro_cannot_redefine_negative_numbers {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: -1 2 ;
END
    assert_failure
    assert_output --partial "illegal operation"
}

@test macro_undefined {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
foo
END
    assert_failure
    assert_output --partial "undefined operation"
}

@test macro_missing_semicolon {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo 1
foo
END
    assert_failure
    assert_output --partial "macro not terminated with semicolon"
}


# case insensitivity
@test case_dup {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 DUP Dup dup
END
    assert_success
    assert_output "1 1 1 1"
}

@test case_drop {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 3 4 DROP DrOp drop
END
    assert_success
    assert_output "1"
}

@test case_swap {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 SWAP 3 Swap 4 swap
END
    assert_success
    assert_output "2 3 4 1"
}

@test case_over {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
1 2 OVER Over over
END
    assert_success
    assert_output "1 2 1 2 1"
}

@test case_macro_names {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: foo dup ;
1 FOO Foo foo
END
    assert_success
    assert_output "1 1 1 1"
}

@test case_macro_definitions {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash forth.sh <<END
: SWAP DUP Dup dup ;
1 swap
END
    assert_success
    assert_output "1 1 1 1"
}
