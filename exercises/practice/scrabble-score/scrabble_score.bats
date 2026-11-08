#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_lowercase_letter() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'a'

    assert_success
    assert_output "1"
}

test_uppercase_letter() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'A'

    assert_success
    assert_output "1"
}

test_valuable_letter() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'f'

    assert_success
    assert_output "4"
}

test_short_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'at'

    assert_success
    assert_output "2"
}

test_short_valuable_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'zoo'

    assert_success
    assert_output "12"
}

test_medium_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'street'

    assert_success
    assert_output "6"
}

test_medium_valuable_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'quirky'

    assert_success
    assert_output "22"
}

test_long_mixed_case_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'OxyphenButazone'

    assert_success
    assert_output "41"
}

test_english_like_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'pinata'

    assert_success
    assert_output "8"
}

test_empty_input() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh ''

    assert_success
    assert_output "0"
}

test_entire_alphabet_available() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash scrabble_score.sh 'abcdefghijklmnopqrstuvwxyz'

    assert_success
    assert_output "87"
}
