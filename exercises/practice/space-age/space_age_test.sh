#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.2.0.0

@test "age on Earth" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=31.69
    run bash space_age.sh "Earth" 1000000000
    assert_success
    assert_output "$expected"
}

@test "age on Mercury" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=280.88
    run bash space_age.sh "Mercury" 2134835688
    assert_success
    assert_output "$expected"
}

@test "age on Venus" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=9.78
    run bash space_age.sh "Venus" 189839836
    assert_success
    assert_output "$expected"
}

@test "age on Mars" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=35.88
    run bash space_age.sh "Mars" 2129871239
    assert_success
    assert_output "$expected"
}

@test "age on Jupiter" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=2.41
    run bash space_age.sh "Jupiter" 901876382
    assert_success
    assert_output "$expected"
}

@test "age on Saturn" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=2.15
    run bash space_age.sh "Saturn" 2000000000
    assert_success
    assert_output "$expected"
}

@test "age on Uranus" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=0.46
    run bash space_age.sh "Uranus" 1210123456
    assert_success
    assert_output "$expected"
}

@test "age on Neptune" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=0.35
    run bash space_age.sh "Neptune" 1821023456
    assert_success
    assert_output "$expected"
}

@test "not a planet" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="not a planet"
    run bash space_age.sh "Pluto" 1821023456
    assert_failure
    assert_output --partial "$expected"
}
