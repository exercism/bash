#!/usr/bin/env bash

# local version: 1.7.0.1

@test 'basic' {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'Portable Network Graphics'
  (( status == 0 ))
  [[ "$output" == 'PNG' ]]
}

@test 'lowercase words' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'Ruby on Rails'
  (( status == 0 ))
  [[ "$output" == 'ROR' ]]
}

@test 'punctuation' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'First In, First Out'
  (( status == 0 ))
  [[ "$output" == 'FIFO' ]]
}

@test 'all caps word' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'GNU Image Manipulation Program'
  (( status == 0 ))
  [[ "$output" == 'GIMP' ]]
}

@test 'punctuation without whitespace' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'Complementary metal-oxide semiconductor'
  (( status == 0 ))
  [[ "$output" == 'CMOS' ]]
}

@test 'very long abbreviation' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'
  (( status == 0 ))
  [[ "$output" == 'ROTFLSHTMDCOALM' ]]
}

@test "consecutive delimiters" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh "Something - I made up from thin air"
  (( status == 0 ))
  [[ "$output" == "SIMUFTA" ]]
}

@test "apostrophes" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh "Halley's Comet"
  (( status == 0 ))
  [[ "$output" == "HC" ]]
}

@test "underscore emphasis" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh "The Road __Not__ Taken"
  (( status == 0 ))
  [[ "$output" == "TRNT" ]]
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "contains shell globbing character" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh "Two * Words"
  (( status == 0 ))
  [[ "$output" == "TW" ]]
}
