#!/usr/bin/env bash

# parsing and numbers
@test numbers_only {
    #skip
    run bash forth.sh <<END
1 2 3 4 5
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 3 4 5" ]]
}

# addition
@test addition_ok {
    skip
    run bash forth.sh <<END
1 2 +
END
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test addition_no_args {
    skip
    run bash forth.sh <<END
+
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test addition_one_args {
    skip
    run bash forth.sh <<END
1 +
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# subtraction
@test subtraction_ok {
    skip
    run bash forth.sh <<END
3 4 -
END
    [[ $status -eq 0 ]]
    [[ $output == "-1" ]]
}

@test subtraction_no_args {
    skip
    run bash forth.sh <<END
-
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test subtraction_one_args {
    skip
    run bash forth.sh <<END
1 -
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# multiplication
@test multiplication_ok {
    skip
    run bash forth.sh <<END
2 4 *
END
    [[ $status -eq 0 ]]
    [[ $output == "8" ]]
}

@test multiplication_no_args {
    skip
    run bash forth.sh <<END
*
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test multiplication_one_args {
    skip
    run bash forth.sh <<END
1 *
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# division
@test division_ok {
    skip
    run bash forth.sh <<END
12 4 /
END
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test division_int_result {
    skip
    run bash forth.sh <<END
15 4 /
END
    [[ $status -eq 0 ]]
    [[ $output == "3" ]]
}

@test division_no_args {
    skip
    run bash forth.sh <<END
/
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test division_one_args {
    skip
    run bash forth.sh <<END
1 /
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

@test division_by_zero {
    skip
    run bash forth.sh <<END
2 0 /
END
    [[ $status -ne 0 ]]
    [[ $output == *"divide by zero"* ]]
}

# combined arithmetic
@test add_and_subtract {
    skip
    run bash forth.sh <<END
1 2 + 4 -
END
    [[ $status -eq 0 ]]
    [[ $output == "-1" ]]
}
@test multiply_and_divide {
    skip
    run bash forth.sh <<END
2 4 * 3 /
END
    [[ $status -eq 0 ]]
    [[ $output == "2" ]]
}

# dup
@test dup_1 {
    skip
    run bash forth.sh <<END
42 dup
END
    [[ $status -eq 0 ]]
    [[ $output == "42 42" ]]
}

@test dup_2 {
    skip
    run bash forth.sh <<END
1 2 dup
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 2" ]]
}

@test dup_empty {
    skip
    run bash forth.sh <<END
dup
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

# drop
@test drop_1 {
    skip
    run bash forth.sh <<END
42 drop
END
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test drop_2 {
    skip
    run bash forth.sh <<END
1 2 drop
END
    [[ $status -eq 0 ]]
    [[ $output == "1" ]]
}

@test drop_empty {
    skip
    run bash forth.sh <<END
drop
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

# swap
@test swap_1 {
    skip
    run bash forth.sh <<END
1 2 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "2 1" ]]
}

@test swap_2 {
    skip
    run bash forth.sh <<END
1 2 3 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "1 3 2" ]]
}

@test swap_empty {
    skip
    run bash forth.sh <<END
swap
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test swap_1arg {
    skip
    run bash forth.sh <<END
1 swap
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# over
@test over_1 {
    skip
    run bash forth.sh <<END
1 2 over
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 1" ]]
}

@test over_2 {
    skip
    run bash forth.sh <<END
1 2 3 over
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 3 2" ]]
}

@test over_empty {
    skip
    run bash forth.sh <<END
over
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty stack"* ]]
}

@test over_1arg {
    skip
    run bash forth.sh <<END
1 over
END
    [[ $status -ne 0 ]]
    [[ $output == *"only one value on the stack"* ]]
}

# user-defined words
@test macro_with_builtin {
    skip
    run bash forth.sh <<END
: dup-twice dup dup ;
1 dup-twice
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1 1" ]]
}

@test macro_maintain_order {
    skip
    run bash forth.sh <<END
: countup 1 2 3 ;
countup
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 3" ]]
}

@test macro_can_override_macro {
    skip
    run bash forth.sh <<END
: foo dup ;
: foo swap ;
1 2 foo
END
    [[ $status -eq 0 ]]
    [[ $output == "2 1" ]]
}

@test macro_can_override_builtin {
    skip
    run bash forth.sh <<END
: swap dup ;
1 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1" ]]
}

@test macro_can_override_operator {
    skip
    run bash forth.sh <<END
: + * ;
3 4 +
END
    [[ $status -eq 0 ]]
    [[ $output == "12" ]]
}

@test macro_expand_in_macro_definition {
    skip
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
    skip
    run bash forth.sh <<END
: foo ;
END
    [[ $status -ne 0 ]]
    [[ $output == *"empty macro definition"* ]]
}

@test macro_expand_in_macro_redefinition {
    skip
    run bash forth.sh <<END
: foo 10 ;
: foo foo 1 + ;
foo
END
    [[ $status -eq 0 ]]
    [[ $output == "11" ]]
}

@test macro_cannot_redefine_numbers {
    skip
    run bash forth.sh <<END
: 1 2 ;
END
    [[ $status -ne 0 ]]
    [[ $output == *"illegal operation"* ]]
}

@test macro_undefined {
    skip
    run bash forth.sh <<END
foo
END
    [[ $status -ne 0 ]]
    [[ $output == *"undefined operation"* ]]
}

@test macro_missing_semicolon {
    skip
    run bash forth.sh <<END
: foo 1
foo
END
    [[ $status -ne 0 ]]
    [[ $output == *"macro not terminated with semicolon"* ]]
}


# case insensitivity
@test case_dup {
    skip
    run bash forth.sh <<END
1 DUP Dup dup
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1 1 1" ]]
}

@test case_drop {
    skip
    run bash forth.sh <<END
1 2 3 4 DROP DrOp drop
END
    [[ $status -eq 0 ]]
    [[ $output == "1" ]]
}

@test case_swap {
    skip
    run bash forth.sh <<END
1 2 SWAP 3 Swap 4 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "2 3 4 1" ]]
}

@test case_over {
    skip
    run bash forth.sh <<END
1 2 OVER Over over
END
    [[ $status -eq 0 ]]
    [[ $output == "1 2 1 2 1" ]]
}

@test case_macro_names {
    skip
    run bash forth.sh <<END
: foo dup ;
1 FOO Foo foo
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1 1 1" ]]
}

@test case_macro_definitions {
    skip
    run bash forth.sh <<END
: SWAP DUP Dup dup ;
1 swap
END
    [[ $status -eq 0 ]]
    [[ $output == "1 1 1 1" ]]
}
