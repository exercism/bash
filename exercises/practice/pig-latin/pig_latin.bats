#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-28T22:44:12+00:00
# local version: 2.0.0.0

@test "word beginning with a" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh apple
    assert_success
    assert_output "appleay"
}

@test "word beginning with e" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh ear
    assert_success
    assert_output "earay"
}

@test "word beginning with i" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh igloo
    assert_success
    assert_output "iglooay"
}

@test "word beginning with o" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh object
    assert_success
    assert_output "objectay"
}

@test "word beginning with u" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh under
    assert_success
    assert_output "underay"
}

@test "word beginning with a vowel and followed by a qu" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh equal
    assert_success
    assert_output "equalay"
}

@test "word beginning with p" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh pig
    assert_success
    assert_output "igpay"
}

@test "word beginning with k" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh koala
    assert_success
    assert_output "oalakay"
}

@test "word beginning with x" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh xenon
    assert_success
    assert_output "enonxay"
}

@test "word beginning with q without a following u" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh qat
    assert_success
    assert_output "atqay"
}

@test "word beginning with consonant and vowel containing qu" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh liquid
    assert_success
    assert_output "iquidlay"
}

@test "word beginning with ch" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh chair
    assert_success
    assert_output "airchay"
}

@test "word beginning with qu" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh queen
    assert_success
    assert_output "eenquay"
}

@test "word beginning with qu and a preceding consonant" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh square
    assert_success
    assert_output "aresquay"
}

@test "word beginning with th" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh therapy
    assert_success
    assert_output "erapythay"
}

@test "word beginning with thr" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh thrush
    assert_success
    assert_output "ushthray"
}

@test "word beginning with sch" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh school
    assert_success
    assert_output "oolschay"
}

@test "word beginning with yt" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh yttria
    assert_success
    assert_output "yttriaay"
}

@test "word beginning with xr" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh xray
    assert_success
    assert_output "xrayay"
}

@test "y is treated like a consonant at the beginning of a word" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh yellow
    assert_success
    assert_output "ellowyay"
}

@test "y is treated like a vowel at the end of a consonant cluster" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh rhythm
    assert_success
    assert_output "ythmrhay"
}

@test "y as second letter in two letter word" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh my
    assert_success
    assert_output "ymay"
}

@test "a whole phrase" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh quick fast run
    assert_success
    assert_output "ickquay astfay unray"
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "shell globbing" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh "pig*"
    assert_success
    assert_output "ig*pay"
}