#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_a() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh apple
    assert_success
    assert_output "appleay"
}

test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_e() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh ear
    assert_success
    assert_output "earay"
}

test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_i() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh igloo
    assert_success
    assert_output "iglooay"
}

test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_o() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh object
    assert_success
    assert_output "objectay"
}

test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_u() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh under
    assert_success
    assert_output "underay"
}

test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_a_vowel_and_followed_by_a_qu() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh equal
    assert_success
    assert_output "equalay"
}

test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_p() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh pig
    assert_success
    assert_output "igpay"
}

test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_k() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh koala
    assert_success
    assert_output "oalakay"
}

test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_x() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh xenon
    assert_success
    assert_output "enonxay"
}

test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_q_without_a_following_u() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh qat
    assert_success
    assert_output "atqay"
}

test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_consonant_and_vowel_containing_qu() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh liquid
    assert_success
    assert_output "iquidlay"
}

test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_ch() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh chair
    assert_success
    assert_output "airchay"
}

test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_qu() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh queen
    assert_success
    assert_output "eenquay"
}

test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_qu_and_a_preceding_consonant() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh square
    assert_success
    assert_output "aresquay"
}

test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_th() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh therapy
    assert_success
    assert_output "erapythay"
}

test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_thr() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh thrush
    assert_success
    assert_output "ushthray"
}

test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_sch() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh school
    assert_success
    assert_output "oolschay"
}

test_some_letter_clusters_are_treated_like_a_single_vowel_word_beginning_with_yt() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh yttria
    assert_success
    assert_output "yttriaay"
}

test_some_letter_clusters_are_treated_like_a_single_vowel_word_beginning_with_xr() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh xray
    assert_success
    assert_output "xrayay"
}

test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel_y_is_treated_like_a_consonant_at_the_beginning_of_a_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh yellow
    assert_success
    assert_output "ellowyay"
}

test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel_y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh rhythm
    assert_success
    assert_output "ythmrhay"
}

test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel_y_as_second_letter_in_two_letter_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh my
    assert_success
    assert_output "ymay"
}

test_phrases_are_translated_a_whole_phrase() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh why do squids enjoy xrays
    assert_success
    assert_output "ywhay oday idssquay enjoyay xraysay"
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

test_shell_globbing() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh "pig*"
    assert_success
    assert_output "ig*pay"
}
