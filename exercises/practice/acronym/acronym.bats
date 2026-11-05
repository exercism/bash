#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-05T22:34:09+00:00

function basic { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Portable Network Graphics"
    assert_success
    assert_output "PNG"
}

function lowercase_words { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Ruby on Rails"
    assert_success
    assert_output "ROR"
}

function punctuation { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "First In, First Out"
    assert_success
    assert_output "FIFO"
}

function all_caps_word { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "GNU Image Manipulation Program"
    assert_success
    assert_output "GIMP"
}

function punctuation_without_whitespace { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Complementary metal-oxide semiconductor"
    assert_success
    assert_output "CMOS"
}

function very_long_abbreviation { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
    assert_success
    assert_output "ROTFLSHTMDCOALM"
}

function consecutive_delimiters { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Something - I made up from thin air"
    assert_success
    assert_output "SIMUFTA"
}

function apostrophes { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Halley's Comet"
    assert_success
    assert_output "HC"
}

function underscore_emphasis { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "The Road _Not_ Taken"
    assert_success
    assert_output "TRNT"
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

function contains_shell_globbing_character { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash acronym.sh "Two * Words"
    assert_success
    assert_output "TW"
}
