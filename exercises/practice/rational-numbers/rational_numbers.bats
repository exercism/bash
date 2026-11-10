#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_arithmetic_addition_add_two_positive_rational_numbers() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "+" "1/2" "2/3"
    assert_success
    assert_output "7/6"
}

test_arithmetic_addition_add_a_positive_rational_number_and_a_negative_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "+" "1/2" "-2/3"
    assert_success
    assert_output "-1/6"
}

test_arithmetic_addition_add_two_negative_rational_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "+" "-1/2" "-2/3"
    assert_success
    assert_output "-7/6"
}

test_arithmetic_addition_add_a_rational_number_to_its_additive_inverse() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "+" "1/2" "-1/2"
    assert_success
    assert_output "0/1"
}

test_arithmetic_subtraction_subtract_two_positive_rational_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "-" "1/2" "2/3"
    assert_success
    assert_output "-1/6"
}

test_arithmetic_subtraction_subtract_a_positive_rational_number_and_a_negative_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "-" "1/2" "-2/3"
    assert_success
    assert_output "7/6"
}

test_arithmetic_subtraction_subtract_two_negative_rational_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "-" "-1/2" "-2/3"
    assert_success
    assert_output "1/6"
}

test_arithmetic_subtraction_subtract_a_rational_number_from_itself() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "-" "1/2" "1/2"
    assert_success
    assert_output "0/1"
}

test_arithmetic_multiplication_multiply_two_positive_rational_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "*" "1/2" "2/3"
    assert_success
    assert_output "1/3"
}

test_arithmetic_multiplication_multiply_a_negative_rational_number_by_a_positive_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "*" "-1/2" "2/3"
    assert_success
    assert_output "-1/3"
}

test_arithmetic_multiplication_multiply_two_negative_rational_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "*" "-1/2" "-2/3"
    assert_success
    assert_output "1/3"
}

test_arithmetic_multiplication_multiply_a_rational_number_by_its_reciprocal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "*" "1/2" "2/1"
    assert_success
    assert_output "1/1"
}

test_arithmetic_multiplication_multiply_a_rational_number_by_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "*" "1/2" "1/1"
    assert_success
    assert_output "1/2"
}

test_arithmetic_multiplication_multiply_a_rational_number_by_0() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "*" "1/2" "0/1"
    assert_success
    assert_output "0/1"
}

test_arithmetic_division_divide_two_positive_rational_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "/" "1/2" "2/3"
    assert_success
    assert_output "3/4"
}

test_arithmetic_division_divide_a_positive_rational_number_by_a_negative_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "/" "1/2" "-2/3"
    assert_success
    assert_output "-3/4"
}

test_arithmetic_division_divide_two_negative_rational_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "/" "-1/2" "-2/3"
    assert_success
    assert_output "3/4"
}

test_arithmetic_division_divide_a_rational_number_by_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "/" "1/2" "1/1"
    assert_success
    assert_output "1/2"
}

test_absolute_value_absolute_value_of_a_positive_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "abs" "1/2"
    assert_success
    assert_output "1/2"
}

test_absolute_value_absolute_value_of_a_positive_rational_number_with_negative_numerator_and_denominator() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "abs" "-1/-2"
    assert_success
    assert_output "1/2"
}

test_absolute_value_absolute_value_of_a_negative_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "abs" "-1/2"
    assert_success
    assert_output "1/2"
}

test_absolute_value_absolute_value_of_a_negative_rational_number_with_negative_denominator() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "abs" "1/-2"
    assert_success
    assert_output "1/2"
}

test_absolute_value_absolute_value_of_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "abs" "0/1"
    assert_success
    assert_output "0/1"
}

test_absolute_value_absolute_value_of_a_rational_number_is_reduced_to_lowest_terms() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "abs" "2/4"
    assert_success
    assert_output "1/2"
}

test_exponentiation_of_a_rational_number_raise_a_positive_rational_number_to_a_positive_integer_power() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "1/2" "3"
    assert_success
    assert_output "1/8"
}

test_exponentiation_of_a_rational_number_raise_a_negative_rational_number_to_a_positive_integer_power() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "-1/2" "3"
    assert_success
    assert_output "-1/8"
}

test_exponentiation_of_a_rational_number_raise_a_positive_rational_number_to_a_negative_integer_power() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "3/5" "-2"
    assert_success
    assert_output "25/9"
}

test_exponentiation_of_a_rational_number_raise_a_negative_rational_number_to_an_even_negative_integer_power() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "-3/5" "-2"
    assert_success
    assert_output "25/9"
}

test_exponentiation_of_a_rational_number_raise_a_negative_rational_number_to_an_odd_negative_integer_power() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "-3/5" "-3"
    assert_success
    assert_output "-125/27"
}

test_exponentiation_of_a_rational_number_raise_zero_to_an_integer_power() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "0/1" "5"
    assert_success
    assert_output "0/1"
}

test_exponentiation_of_a_rational_number_raise_one_to_an_integer_power() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "1/1" "4"
    assert_success
    assert_output "1/1"
}

test_exponentiation_of_a_rational_number_raise_a_positive_rational_number_to_the_power_of_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "1/2" "0"
    assert_success
    assert_output "1/1"
}

test_exponentiation_of_a_rational_number_raise_a_negative_rational_number_to_the_power_of_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "pow" "-1/2" "0"
    assert_success
    assert_output "1/1"
}

test_exponentiation_of_a_real_number_to_a_rational_number_raise_a_real_number_to_a_positive_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "rpow" "8" "4/3"
    assert_success
    assert_output "16.0"
}

test_exponentiation_of_a_real_number_to_a_rational_number_raise_a_real_number_to_a_negative_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "rpow" "9" "-1/2"
    assert_success
    assert_output "0.333333"
}

test_exponentiation_of_a_real_number_to_a_rational_number_raise_a_real_number_to_a_zero_rational_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "rpow" "2" "0/1"
    assert_success
    assert_output "1.0"
}

test_reduction_to_lowest_terms_reduce_a_positive_rational_number_to_lowest_terms() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "reduce" "2/4"
    assert_success
    assert_output "1/2"
}

test_reduction_to_lowest_terms_reduce_places_the_minus_sign_on_the_numerator() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "reduce" "3/-4"
    assert_success
    assert_output "-3/4"
}

test_reduction_to_lowest_terms_reduce_a_negative_rational_number_to_lowest_terms() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "reduce" "-4/6"
    assert_success
    assert_output "-2/3"
}

test_reduction_to_lowest_terms_reduce_a_rational_number_with_a_negative_denominator_to_lowest_terms() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "reduce" "3/-9"
    assert_success
    assert_output "-1/3"
}

test_reduction_to_lowest_terms_reduce_zero_to_lowest_terms() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "reduce" "0/6"
    assert_success
    assert_output "0/1"
}

test_reduction_to_lowest_terms_reduce_an_integer_to_lowest_terms() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "reduce" "-14/7"
    assert_success
    assert_output "-2/1"
}

test_reduction_to_lowest_terms_reduce_one_to_lowest_terms() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rational_numbers.sh "reduce" "13/13"
    assert_success
    assert_output "1/1"
}
