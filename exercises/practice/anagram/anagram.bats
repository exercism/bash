#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T04:26:49+00:00

test_no_matches() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "diaper" "hello world zombies pants"
    assert_success
    refute_output
}

test_detects_two_anagrams() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "solemn" "lemons cherry melons"
    assert_success
    assert_output "lemons melons"
}

test_does_not_detect_anagram_subsets() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "good" "dog goody"
    assert_success
    refute_output
}

test_detects_anagram() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "listen" "enlists google inlets banana"
    assert_success
    assert_output "inlets"
}

test_detects_three_anagrams() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "allergy" "gallery ballerina regally clergy largely leading"
    assert_success
    assert_output "gallery regally largely"
}

test_detects_multiple_anagrams_with_different_case() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "nose" "Eons ONES"
    assert_success
    assert_output "Eons ONES"
}

test_does_not_detect_non_anagrams_with_identical_checksum() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "mass" "last"
    assert_success
    refute_output
}

test_detects_anagrams_case_insensitively() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "Orchestra" "cashregister Carthorse radishes"
    assert_success
    assert_output "Carthorse"
}

test_detects_anagrams_using_case_insensitive_subject() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "Orchestra" "cashregister carthorse radishes"
    assert_success
    assert_output "carthorse"
}

test_detects_anagrams_using_case_insensitive_possible_matches() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "orchestra" "cashregister Carthorse radishes"
    assert_success
    assert_output "Carthorse"
}

test_does_not_detect_an_anagram_if_the_original_word_is_repeated() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "go" "goGoGO"
    assert_success
    refute_output
}

test_anagrams_must_use_all_letters_exactly_once() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "tapper" "patter"
    assert_success
    refute_output
}

test_words_are_not_anagrams_of_themselves() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "BANANA" "BANANA"
    assert_success
    refute_output
}

test_words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "BANANA" "Banana"
    assert_success
    refute_output
}

test_words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "BANANA" "banana"
    assert_success
    refute_output
}

test_words_other_than_themselves_can_be_anagrams() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "LISTEN" "LISTEN Silent"
    assert_success
    assert_output "Silent"
}
