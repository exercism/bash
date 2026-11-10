#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_just_a_number() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 5?"
    assert_success
    assert_output "5"
}

test_just_a_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 0?"
    assert_success
    assert_output "0"
}

test_just_a_negative_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -123?"
    assert_success
    assert_output "-123"
}

test_addition() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus 1?"
    assert_success
    assert_output "2"
}

test_addition_with_a_left_hand_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 0 plus 2?"
    assert_success
    assert_output "2"
}

test_addition_with_a_right_hand_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 3 plus 0?"
    assert_success
    assert_output "3"
}

test_more_addition() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 53 plus 2?"
    assert_success
    assert_output "55"
}

test_addition_with_negative_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -1 plus -10?"
    assert_success
    assert_output "-11"
}

test_large_addition() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 123 plus 45678?"
    assert_success
    assert_output "45801"
}

test_subtraction() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 4 minus -12?"
    assert_success
    assert_output "16"
}

test_multiplication() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -3 multiplied by 25?"
    assert_success
    assert_output "-75"
}

test_division() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 33 divided by -3?"
    assert_success
    assert_output "-11"
}

test_multiple_additions() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus 1 plus 1?"
    assert_success
    assert_output "3"
}

test_addition_and_subtraction() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus 5 minus -2?"
    assert_success
    assert_output "8"
}

test_multiple_subtraction() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 20 minus 4 minus 13?"
    assert_success
    assert_output "3"
}

test_subtraction_then_addition() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 17 minus 6 plus 3?"
    assert_success
    assert_output "14"
}

test_multiple_multiplication() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 2 multiplied by -2 multiplied by 3?"
    assert_success
    assert_output "-12"
}

test_addition_and_multiplication() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -3 plus 7 multiplied by -2?"
    assert_success
    assert_output "-8"
}

test_multiple_division() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is -12 divided by 2 divided by -3?"
    assert_success
    assert_output "2"
}

test_unknown_operation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 52 cubed?"
    assert_failure
    assert_output "unknown operation"
}

test_non_math_question() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "Who is the President of the United States?"
    assert_failure
    assert_output "unknown operation"
}

test_reject_problem_missing_an_operand() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus?"
    assert_failure
    assert_output "syntax error"
}

test_reject_problem_with_no_operands_or_operators() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is?"
    assert_failure
    assert_output "syntax error"
}

test_reject_two_operations_in_a_row() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus plus 2?"
    assert_failure
    assert_output "syntax error"
}

test_reject_two_numbers_in_a_row() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 plus 2 1?"
    assert_failure
    assert_output "syntax error"
}

test_reject_postfix_notation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 1 2 plus?"
    assert_failure
    assert_output "syntax error"
}

test_reject_prefix_notation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is plus 1 2?"
    assert_failure
    assert_output "syntax error"
}


# Track specific tests

test_strict_left_to_right_ignores_typical_order_of_operations() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is 2 plus 3 multiplied by 4?"
    assert_success
    [[ $output != "14" ]]
    assert_output "20"
}

test_reject_problem_with_no_operands() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash wordy.sh "What is plus?"
    assert_failure
    assert_output "syntax error"
}
