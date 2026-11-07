#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_paired_square_brackets() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[]"
    assert_success
    assert_output "true"
}

test_empty_string() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh ""
    assert_success
    assert_output "true"
}

test_unpaired_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[["
    assert_success
    assert_output "false"
}

test_wrong_ordered_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "}{"
    assert_success
    assert_output "false"
}

test_wrong_closing_bracket() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{]"
    assert_success
    assert_output "false"
}

test_paired_with_whitespace() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{ }"
    assert_success
    assert_output "true"
}

test_partially_paired_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{[])"
    assert_success
    assert_output "false"
}

test_simple_nested_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{[]}"
    assert_success
    assert_output "true"
}

test_several_paired_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{}[]"
    assert_success
    assert_output "true"
}

test_paired_and_nested_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "([{}({}[])])"
    assert_success
    assert_output "true"
}

test_unopened_closing_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{[)][]}"
    assert_success
    assert_output "false"
}

test_unpaired_and_nested_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "([{])"
    assert_success
    assert_output "false"
}

test_paired_and_wrong_nested_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[({]})"
    assert_success
    assert_output "false"
}

test_paired_and_wrong_nested_brackets_but_innermost_are_correct() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[({}])"
    assert_success
    assert_output "false"
}

test_paired_and_incomplete_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{}["
    assert_success
    assert_output "false"
}

test_too_many_closing_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "[]]"
    assert_success
    assert_output "false"
}

test_early_unexpected_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh ")()"
    assert_success
    assert_output "false"
}

test_early_mismatched_brackets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "{)()"
    assert_success
    assert_output "false"
}

test_math_expression() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "(((185 + 223.85) * 15) - 543)/2"
    assert_success
    assert_output "true"
}

test_complex_latex_expression() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash matching_brackets.sh "\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)"
    assert_success
    assert_output "true"
}
