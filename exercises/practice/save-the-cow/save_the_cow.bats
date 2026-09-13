#!/usr/bin/env bats
load bats-extra

# generated on 2026-09-13T17:59:07+00:00

@test "Initially 9 failures are allowed and no letters are guessed" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" ""
    assert_success
    assert_output --partial "Ongoing"
    assert_output --partial "____"
    assert_output --partial "9"
}

@test "After 10 failures the game is over" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
    assert_success
    assert_output --partial "Lose"
    assert_output --partial "____"
    assert_output --partial "0"
}

@test "Losing with several correct guesses" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "o" "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
    assert_success
    assert_output --partial "Lose"
    assert_output --partial "_oot"
    assert_output --partial "0"
}

@test "Feeding a correct letter removes underscores" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t"
    assert_success
    assert_output --partial "Ongoing"
    assert_output --partial "___t"
    assert_output --partial "9"
}

@test "Feeding a correct letter twice counts as a failure" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "t"
    assert_success
    assert_output --partial "Ongoing"
    assert_output --partial "___t"
    assert_output --partial "8"
}

@test "Guessing a repeated letter reveals all instances" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "t" "o"
    assert_success
    assert_output --partial "Ongoing"
    assert_output --partial "_oot"
    assert_output --partial "8"
}

@test "Getting all the letters right makes for a win" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "t" "t" "o" "l"
    assert_success
    assert_output --partial "Win"
    assert_output --partial "loot"
    assert_output --partial "8"
}

@test "Winning on the last guess is still a win" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash save_the_cow.sh "loot" "a" "b" "c" "d" "e" "f" "g" "h" "i" "t" "o" "l"
    assert_success
    assert_output --partial "Win"
    assert_output --partial "loot"
    assert_output --partial "0"
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

