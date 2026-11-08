#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_an_empty_string() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash reverse_string.sh ""
    assert_success
    assert_output ""
}

test_a_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash reverse_string.sh "robot"
    assert_success
    assert_output "tobor"
}

test_a_capitalized_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash reverse_string.sh "Ramen"
    assert_success
    assert_output "nemaR"
}

test_a_sentence_with_punctuation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash reverse_string.sh "I'm hungry!"
    assert_success
    assert_output "!yrgnuh m'I"
}

test_a_palindrome() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash reverse_string.sh "racecar"
    assert_success
    assert_output "racecar"
}

test_an_even_sized_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash reverse_string.sh "drawer"
    assert_success
    assert_output "reward"
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

test_avoid_globbing() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash reverse_string.sh " a *  b"

    assert_success
    assert_output "b  * a "
}
