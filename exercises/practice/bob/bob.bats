#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_asking_a_question() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'Does this cryogenic chamber make me look fat?'
    assert_success
    assert_output "Sure."
}

test_shouting() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'WATCH OUT!'
    assert_success
    assert_output "Whoa, chill out!"
}

test_forceful_question() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $"WHAT'S GOING ON?"
    assert_success
    assert_output "Calm down, I know what I'm doing!"
}

test_silence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $''
    assert_success
    assert_output "Fine. Be that way!"
}

test_stating_something() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'Tom-ay-to, tom-aaaah-to.'
    assert_success
    assert_output "Whatever."
}

test_asking_a_numeric_question() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'You are, what, like 15?'
    assert_success
    assert_output "Sure."
}

test_asking_gibberish() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'fffbbcbeab?'
    assert_success
    assert_output "Sure."
}

test_question_with_no_letters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'4?'
    assert_success
    assert_output "Sure."
}

test_non_letters_with_question() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $':) ?'
    assert_success
    assert_output "Sure."
}

test_prattling_on() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'Wait! Hang on. Are you going to be OK?'
    assert_success
    assert_output "Sure."
}

test_ending_with_whitespace() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'Okay if like my  spacebar  quite a bit?   '
    assert_success
    assert_output "Sure."
}

test_multiple_line_question() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'\nDoes this cryogenic chamber make\n me look fat?'
    assert_success
    assert_output "Sure."
}

test_shouting_gibberish() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'FCECDFCAAB'
    assert_success
    assert_output "Whoa, chill out!"
}

test_shouting_a_statement_containing_a_question_mark() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'DO LIONS EAT PEOPLE? AHHHHH.'
    assert_success
    assert_output "Whoa, chill out!"
}

test_shouting_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'1, 2, 3 GO!'
    assert_success
    assert_output "Whoa, chill out!"
}

test_shouting_with_special_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
    assert_success
    assert_output "Whoa, chill out!"
}

test_shouting_with_no_exclamation_mark() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'I HATE THE DENTIST'
    assert_success
    assert_output "Whoa, chill out!"
}

test_prolonged_silence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'          '
    assert_success
    assert_output "Fine. Be that way!"
}

test_alternate_silence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'\t\t\t\t\t\t\t\t\t\t'
    assert_success
    assert_output "Fine. Be that way!"
}

test_other_whitespace() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'\n\r \t'
    assert_success
    assert_output "Fine. Be that way!"
}

test_talking_forcefully() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'Hi there!'
    assert_success
    assert_output "Whatever."
}

test_using_acronyms_in_regular_speech() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $"It's OK if you don't want to go work for NASA."
    assert_success
    assert_output "Whatever."
}

test_no_letters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'1, 2, 3'
    assert_success
    assert_output "Whatever."
}

test_statement_containing_question_mark() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'Ending with ? means a question.'
    assert_success
    assert_output "Whatever."
}

test_starting_with_whitespace() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'         hmmmmmmm...'
    assert_success
    assert_output "Whatever."
}

test_non_question_ending_with_whitespace() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh $'This is a statement ending with whitespace      '
    assert_success
    assert_output "Whatever."
}

# bash-specific tests
test_no_input_is_silence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh
    assert_success
    assert_output "Fine. Be that way!"
}

test_yelling_a_filename_expansion() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh '*READ* !'
    assert_success
    assert_output "Whoa, chill out!"
}

test_asking_a_filename_expansion() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bob.sh 'bob???'
    assert_success
    assert_output "Sure."
}
