#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_empty_string() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh ''
    assert_success
    assert_output "true"
}

test_isogram_with_only_lower_case_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'isogram'
    assert_success
    assert_output "true"
}

test_word_with_one_duplicated_character() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'eleven'
    assert_success
    assert_output "false"
}

test_word_with_one_duplicated_character_from_the_end_of_the_alphabet() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'zzyzx'
    assert_success
    assert_output "false"
}

test_longest_reported_english_isogram() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'subdermatoglyphic'
    assert_success
    assert_output "true"
}

test_word_with_duplicated_character_in_mixed_case() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'Alphabet'
    assert_success
    assert_output "false"
}

test_word_with_duplicated_character_in_mixed_case_lowercase_first() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'alphAbet'
    assert_success
    assert_output "false"
}

test_hypothetical_isogrammic_word_with_hyphen() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'thumbscrew-japingly'
    assert_success
    assert_output "true"
}

test_hypothetical_word_with_duplicated_character_following_hyphen() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'thumbscrew-jappingly'
    assert_success
    assert_output "false"
}

test_isogram_with_duplicated_hyphen() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'six-year-old'
    assert_success
    assert_output "true"
}

test_made_up_name_that_is_an_isogram() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'Emily Jung Schwartzkopf'
    assert_success
    assert_output "true"
}

test_duplicated_character_in_the_middle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'accentor'
    assert_success
    assert_output "false"
}

test_same_first_and_last_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'angola'
    assert_success
    assert_output "false"
}

test_word_with_duplicated_character_and_with_two_hyphens() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash isogram.sh 'up-to-date'
    assert_success
    assert_output "false"
}
