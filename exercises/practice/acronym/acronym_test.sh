#!/usr/bin/env bash
load bats-extra

# local version: 1.7.0.1

@test 'basic' {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'Portable Network Graphics'
  assert_success
  assert_output 'PNG'
}

@test 'lowercase words' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'Ruby on Rails'
  assert_success
  assert_output 'ROR'
}

@test 'punctuation' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'First In, First Out'
  assert_success
  assert_output 'FIFO'
}

@test 'all caps word' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'GNU Image Manipulation Program'
  assert_success
  assert_output 'GIMP'
}

@test 'punctuation without whitespace' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'Complementary metal-oxide semiconductor'
  assert_success
  assert_output 'CMOS'
}

@test 'very long abbreviation' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'
  assert_success
  assert_output 'ROTFLSHTMDCOALM'
}

@test "consecutive delimiters" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh "Something - I made up from thin air"
  assert_success
  assert_output "SIMUFTA"
}

@test "apostrophes" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh "Halley's Comet"
  assert_success
  assert_output "HC"
}

@test "underscore emphasis" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh "The Road __Not__ Taken"
  assert_success
  assert_output "TRNT"
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "contains shell globbing character" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash acronym.sh "Two * Words"
  assert_success
  assert_output "TW"
}
