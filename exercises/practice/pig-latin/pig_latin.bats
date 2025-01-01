#!/usr/bin/env bats
load bats-extra

# local version: 1.2.0.1

# "ay" is added to words that start with vowels

@test word_beginning_with_a {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh apple
    assert_success
    assert_output "appleay"
}

@test word_beginning_with_e {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh ear
    assert_success
    assert_output "earay"
}

@test word_beginning_with_i {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh igloo
    assert_success
    assert_output "iglooay"
}

@test word_beginning_with_o {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh object
    assert_success
    assert_output "objectay"
}

@test word_beginning_with_u {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh under
    assert_success
    assert_output "underay"
}

@test word_beginning_with_equ {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh equal
    assert_success
    assert_output "equalay"
}

# first letter and ay are moved to the end of words that start with consonants

@test word_beginning_with_p {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh pig
    assert_success
    assert_output "igpay"
}

@test word_beginning_with_k {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh koala
    assert_success
    assert_output "oalakay"
}

@test word_beginning_with_x {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh xenon
    assert_success
    assert_output "enonxay"
}

@test word_beginning_with_q_no_u {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh qat
    assert_success
    assert_output "atqay"
}

@test word_beginning_with_consonant_and_vowel_containing_qu {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh liquid
    assert_success
    assert_output "iquidlay"
}

# some letter clusters are treated like a single consonant

@test word_beginning_with_ch {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh chair
    assert_success
    assert_output "airchay"
}

@test word_beginning_with_squ {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh square
    assert_success
    assert_output "aresquay"
}

@test word_beginning_with_th {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh therapy
    assert_success
    assert_output "erapythay"
}

@test word_beginning_with_thr {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh thrush
    assert_success
    assert_output "ushthray"
}

@test word_beginning_with_sch {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh school
    assert_success
    assert_output "oolschay"
}

# some letter clusters are treated like a single vowel

@test word_beginning_with_yt {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh yttria
    assert_success
    assert_output "yttriaay"
}

@test word_beginning_with_xr {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh xray
    assert_success
    assert_output "xrayay"
}

# position of y in a word determines if it is a consonant or a vowel

@test word_beginning_with_y {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh yellow
    assert_success
    assert_output "ellowyay"
}

@test word_rhythm {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh rhythm
    assert_success
    assert_output "ythmrhay"
}

@test word_my {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh my
    assert_success
    assert_output "ymay"
}

# phrases are translated
@test a_whole_phrase {
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
