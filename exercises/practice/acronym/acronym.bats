#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:20:25+00:00

test_basic() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Portable Network Graphics"
    assert_success
    assert_output "PNG"
}

test_lowercase_words() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Ruby on Rails"
    assert_success
    assert_output "ROR"
}

test_punctuation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "First In, First Out"
    assert_success
    assert_output "FIFO"
}

test_all_caps_word() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "GNU Image Manipulation Program"
    assert_success
    assert_output "GIMP"
}

test_punctuation_without_whitespace() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Complementary metal-oxide semiconductor"
    assert_success
    assert_output "CMOS"
}

test_very_long_abbreviation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
    assert_success
    assert_output "ROTFLSHTMDCOALM"
}

test_consecutive_delimiters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Something - I made up from thin air"
    assert_success
    assert_output "SIMUFTA"
}

test_apostrophes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Halley's Comet"
    assert_success
    assert_output "HC"
}

test_underscore_emphasis() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "The Road _Not_ Taken"
    assert_success
    assert_output "TRNT"
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

test_contains_shell_globbing_character() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Two * Words"
    assert_success
    assert_output "TW"
}
