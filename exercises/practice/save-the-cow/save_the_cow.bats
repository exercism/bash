#!/usr/bin/env bats
load bats-extra

# generated on 2026-09-13T19:12:55+00:00

@test "Initially 9 failures are allowed and no letters are guessed" {
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

@test "After 10 failures the game is over" {
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

@test "Losing with several correct guesses" {
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

@test "Feeding a correct letter removes underscores" {
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

@test "Feeding a correct letter twice counts as a failure" {
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

@test "Guessing a repeated letter reveals all instances" {
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

@test "Getting all the letters right makes for a win" {
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

@test "Winning on the last guess is still a win" {
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

@test "Guessing after a lose is error" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k"
    assert_failure
    assert_output "cannot guess after the game is lost"
}

@test "Guessing after a win is error" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "o" "l" "l"
    assert_failure
    assert_output "cannot guess after the game is won"
}

