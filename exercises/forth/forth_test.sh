#!/usr/bin/env bash

# local version: 1.7.1.0

# parsing and numbers
@test numbers_only {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 3 4 5
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 3 4 5" ]]
}

# addition
@test addition_ok {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 +
END
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test addition_no_args {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
+
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test addition_one_args {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 +
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# subtraction
@test subtraction_ok {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
3 4 -
END
    [[ $status -eq 0 ]]
    [[ $output == "-1" ]]
}

@test subtraction_no_args {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
-
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test subtraction_one_args {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 -
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# multiplication
@test multiplication_ok {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
2 4 *
END
    [[ $status -eq 0 ]]
    [[ $output == "8" ]]
}

@test multiplication_no_args {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
*
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test multiplication_one_args {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 *
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# division
@test division_ok {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
12 4 /
END
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test division_int_result {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
15 4 /
END
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test division_no_args {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
/
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test division_one_args {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 /
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

@test division_by_zero {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
2 0 /
END
    [[ $status -ne 0 ]]
    [[ $output == *"divide by zero"* ]]
}

# combined arithmetic
@test add_and_subtract {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 + 4 -
END
    [[ $status -eq 0 ]]
    [[ $output == "-1" ]]
}
@test multiply_and_divide {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
2 4 * 3 /
END
    [[ $status -eq 0 ]]
    [[ $output == "2" ]]
}

# dup
@test dup_1 {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
42 dup
END
    [[ $status -eq 0 ]]
    [[ $output == "42 42" ]]
}

@test dup_2 {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 dup
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 2" ]]
}

@test dup_empty {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
dup
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

# drop
@test drop_1 {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
42 drop
END
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test drop_2 {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 drop
END
    [[ $status -eq 0 ]]
    [[ $output == "1" ]]
}

@test drop_empty {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
drop
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

# swap
@test swap_1 {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "2 1" ]]
}

@test swap_2 {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 3 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "1 3 2" ]]
}

@test swap_empty {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
swap
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test swap_1arg {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 swap
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# over
@test over_1 {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 over
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 1" ]]
}

@test over_2 {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 3 over
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 3 2" ]]
}

@test over_empty {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
over
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test over_1arg {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 over
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# user-defined words
@test macro_with_builtin {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: dup-twice dup dup ;
1 dup-twice
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1 1" ]]
}

@test macro_maintain_order {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: countup 1 2 3 ;
countup
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 3" ]]
}

@test macro_can_override_macro {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: foo dup ;
: foo swap ;
1 2 foo
END
    [[ $status -eq 0 ]]
    [[ $output == "2 1" ]]
}

@test macro_can_override_builtin {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: swap dup ;
1 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1" ]]
}

@test macro_can_override_operator {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: + * ;
3 4 +
END
    [[ $status -eq 0 ]]
    [[ $output == "12" ]]
}

@test macro_expand_in_macro_definition {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: foo 5 ;
: bar foo ;
: foo 6 ;
bar foo
END
    [[ $status -eq 0 ]]
    [[ $output == "5 6" ]]
}

@test macro_empty_definition {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: foo ;
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty macro definition"* ]]
}

@test macro_expand_in_macro_redefinition {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: foo 10 ;
: foo foo 1 + ;
foo
END
    [[ $status -eq 0 ]]
    [[ $output == "11" ]]
}

@test macro_cannot_redefine_numbers {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: 1 2 ;
END
    [[ $status -ne 0 ]]
    [[ $output == *"illegal operation"* ]]
}

@test macro_undefined {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
foo
END
    [[ $status -ne 0 ]]
    [[ $output == *"undefined operation"* ]]
}

@test macro_missing_semicolon {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: foo 1
foo
END
    [[ $status -ne 0 ]]
    [[ $output == *"macro not terminated with semicolon"* ]]
}


# case insensitivity
@test case_dup {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 DUP Dup dup
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1 1 1" ]]
}

@test case_drop {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 3 4 DROP DrOp drop
END
    [[ $status -eq 0 ]]
    [[ $output == "1" ]]
}

@test case_swap {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 SWAP 3 Swap 4 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "2 3 4 1" ]]
}

@test case_over {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
1 2 OVER Over over
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 1 2 1" ]]
}

@test case_macro_names {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: foo dup ;
1 FOO Foo foo
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1 1 1" ]]
}

@test case_macro_definitions {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash forth.sh <<END
: SWAP DUP Dup dup ;
1 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1 1 1" ]]
}
