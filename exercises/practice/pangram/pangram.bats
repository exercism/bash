#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:23:17+00:00

test_empty_sentence() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh ''
    assert_success
    assert_output "false"
}

test_perfect_lower_case() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh 'abcdefghijklmnopqrstuvwxyz'
    assert_success
    assert_output "true"
}

test_only_lower_case() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh 'the quick brown fox jumps over the lazy dog'
    assert_success
    assert_output "true"
}

test_missing_the_letter_x() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh 'a quick movement of the enemy will jeopardize five gunboats'
    assert_success
    assert_output "false"
}

test_missing_the_letter_h() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh 'five boxing wizards jump quickly at it'
    assert_success
    assert_output "false"
}

test_with_underscores() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    assert_success
    assert_output "true"
}

test_with_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh 'the 1 quick brown fox jumps over the 2 lazy dogs'
    assert_success
    assert_output "true"
}

test_missing_letters_replaced_by_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
    assert_success
    assert_output "false"
}

test_mixed_case_and_punctuation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh '"Five quacking Zephyrs jolt my wax bed."'
    assert_success
    assert_output "true"
}

test_a_m_and_a_m_are_26_different_characters_but_not_a_pangram() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pangram.sh 'abcdefghijklm ABCDEFGHIJKLM'
    assert_success
    assert_output "false"
}
