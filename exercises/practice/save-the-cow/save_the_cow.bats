#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_initially_9_failures_are_allowed_and_no_letters_are_guessed() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" ""
    expected="$(cat << EXPECTED
State: Ongoing
Masked word: ____
Remaining failures: 9
EXPECTED
    )"

    assert_success
    assert_output "$expected"
}

test_after_10_failures_the_game_is_over() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
    expected="$(cat << EXPECTED
State: Lose
Masked word: ____
Remaining failures: 0
EXPECTED
    )"

    assert_success
    assert_output "$expected"
}

test_losing_with_several_correct_guesses() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "o" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
    expected="$(cat << EXPECTED
State: Lose
Masked word: _oot
Remaining failures: 0
EXPECTED
    )"

    assert_success
    assert_output "$expected"
}

test_feeding_a_correct_letter_removes_underscores() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t"
    expected="$(cat << EXPECTED
State: Ongoing
Masked word: ___t
Remaining failures: 9
EXPECTED
    )"

    assert_success
    assert_output "$expected"
}

test_feeding_a_correct_letter_twice_counts_as_a_failure() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "t"
    expected="$(cat << EXPECTED
State: Ongoing
Masked word: ___t
Remaining failures: 8
EXPECTED
    )"

    assert_success
    assert_output "$expected"
}

test_guessing_a_repeated_letter_reveals_all_instances() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "t" "o"
    expected="$(cat << EXPECTED
State: Ongoing
Masked word: _oot
Remaining failures: 8
EXPECTED
    )"

    assert_success
    assert_output "$expected"
}

test_getting_all_the_letters_right_makes_for_a_win() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "t" "o" "l"
    expected="$(cat << EXPECTED
State: Win
Masked word: loot
Remaining failures: 8
EXPECTED
    )"

    assert_success
    assert_output "$expected"
}

test_winning_on_the_last_guess_is_still_a_win() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "a" "b" "c" "d" "e" "f" "g" "h" "i" "t" "o" "l"
    expected="$(cat << EXPECTED
State: Win
Masked word: loot
Remaining failures: 0
EXPECTED
    )"

    assert_success
    assert_output "$expected"
}

test_guessing_after_a_lose_is_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k"
    assert_failure
    assert_output "cannot guess after the game is lost"
}

test_guessing_after_a_win_is_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "o" "l" "l"
    assert_failure
    assert_output "cannot guess after the game is won"
}
