#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_valid_isbn() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-21508-8'
    assert_success
    assert_output "true"
}

test_invalid_isbn_check_digit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-21508-9'
    assert_success
    assert_output "false"
}

test_valid_isbn_with_a_check_digit_of_10() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-21507-X'
    assert_success
    assert_output "true"
}

test_check_digit_is_a_character_other_than_x() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-21507-A'
    assert_success
    assert_output "false"
}

test_invalid_check_digit_in_isbn_is_not_treated_as_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '4-598-21507-B'
    assert_success
    assert_output "false"
}

test_invalid_character_in_isbn_is_not_treated_as_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-P1581-X'
    assert_success
    assert_output "false"
}

test_x_is_only_valid_as_a_check_digit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-2X507-9'
    assert_success
    assert_output "false"
}

test_only_one_check_digit_is_allowed() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-21508-96'
    assert_success
    assert_output "false"
}

test_x_is_not_substituted_by_the_value_10() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-2X507-5'
    assert_success
    assert_output "false"
}

test_valid_isbn_without_separating_dashes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3598215088'
    assert_success
    assert_output "true"
}

test_isbn_without_separating_dashes_and_x_as_check_digit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '359821507X'
    assert_success
    assert_output "true"
}

test_isbn_without_check_digit_and_dashes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '359821507'
    assert_success
    assert_output "false"
}

test_too_long_isbn_and_no_dashes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3598215078X'
    assert_success
    assert_output "false"
}

test_too_short_isbn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '00'
    assert_success
    assert_output "false"
}

test_isbn_without_check_digit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-21507'
    assert_success
    assert_output "false"
}

test_check_digit_of_x_should_not_be_used_for_0() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3-598-21515-X'
    assert_success
    assert_output "false"
}

test_empty_isbn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh ''
    assert_success
    assert_output "false"
}

test_input_is_9_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '134456729'
    assert_success
    assert_output "false"
}

test_invalid_characters_are_not_ignored_after_checking_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3132P34035'
    assert_success
    assert_output "false"
}

test_invalid_characters_are_not_ignored_before_checking_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '3598P215088'
    assert_success
    assert_output "false"
}

test_input_is_too_long_but_contains_a_valid_isbn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isbn_verifier.sh '98245726788'
    assert_success
    assert_output "false"
}
