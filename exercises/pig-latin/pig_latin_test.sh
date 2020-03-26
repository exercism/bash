#!/usr/bin/env bash

# local version: 1.2.0.1

# "ay" is added to words that start with vowels

@test word_beginning_with_a {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh apple
    (( status == 0 ))
    [[ $output == "appleay" ]]
}

@test word_beginning_with_e {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh ear
    (( status == 0 ))
    [[ $output == "earay" ]]
}

@test word_beginning_with_i {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh igloo
    (( status == 0 ))
    [[ $output == "iglooay" ]]
}

@test word_beginning_with_o {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh object
    (( status == 0 ))
    [[ $output == "objectay" ]]
}

@test word_beginning_with_u {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh under
    (( status == 0 ))
    [[ $output == "underay" ]]
}

@test word_beginning_with_equ {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh equal
    (( status == 0 ))
    [[ $output == "equalay" ]]
}

# first letter and ay are moved to the end of words that start with consonants

@test word_beginning_with_p {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh pig
    (( status == 0 ))
    [[ $output == "igpay" ]]
}

@test word_beginning_with_k {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh koala
    (( status == 0 ))
    [[ $output == "oalakay" ]]
}

@test word_beginning_with_x {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh xenon
    (( status == 0 ))
    [[ $output == "enonxay" ]]
}

@test word_beginning_with_q_no_u {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh qat
    (( status == 0 ))
    [[ $output == "atqay" ]]
}

# some letter clusters are treated like a single consonant

@test word_beginning_with_ch {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh chair
    (( status == 0 ))
    [[ $output == "airchay" ]]
}

@test word_beginning_with_squ {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh square
    (( status == 0 ))
    [[ $output == "aresquay" ]]
}

@test word_beginning_with_th {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh therapy
    (( status == 0 ))
    [[ $output == "erapythay" ]]
}

@test word_beginning_with_thr {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh thrush
    (( status == 0 ))
    [[ $output == "ushthray" ]]
}

@test word_beginning_with_sch {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh school
    (( status == 0 ))
    [[ $output == "oolschay" ]]
}

# some letter clusters are treated like a single vowel

@test word_beginning_with_yt {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh yttria
    (( status == 0 ))
    [[ $output == "yttriaay" ]]
}

@test word_beginning_with_xr {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh xray
    (( status == 0 ))
    [[ $output == "xrayay" ]]
}

# position of y in a word determines if it is a consonant or a vowel

@test word_beginning_with_y {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh yellow
    (( status == 0 ))
    [[ $output == "ellowyay" ]]
}

@test word_rhythm {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh rhythm
    (( status == 0 ))
    [[ $output == "ythmrhay" ]]
}

@test word_my {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh my
    (( status == 0 ))
    [[ $output == "ymay" ]]
}

# phrases are translated
@test a_whole_phrase {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh quick fast run
    (( status == 0 ))
    [[ $output == "ickquay astfay unray" ]]
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "shell globbing" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pig_latin.sh "pig*"
    (( status == 0 ))
    [[ $output == "ig*pay" ]]
}
