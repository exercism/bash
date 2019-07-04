#!/usr/bin/env bash

@test 'basic' {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'Portable Network Graphics'
  [[ "$status" -eq 0 ]]
  [[ "$output" == 'PNG' ]]
}

@test 'lowercase words' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'Ruby on Rails'
  [[ "$status" -eq 0 ]]
  [[ "$output" == 'ROR' ]]
}

@test 'punctuation' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'First In, First Out'
  [[ "$status" -eq 0 ]]
  [[ "$output" == 'FIFO' ]]
}

@test 'all caps word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'GNU Image Manipulation Program'
  [[ "$status" -eq 0 ]]
  [[ "$output" == 'GIMP' ]]
}

@test 'punctuation without whitespace' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'Complementary metal-oxide semiconductor'
  [[ "$status" -eq 0 ]]
  [[ "$output" == 'CMOS' ]]
}

@test 'very long abbreviation' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'
  [[ "$status" -eq 0 ]]
  [[ "$output" == 'ROTFLSHTMDCOALM' ]]
}

@test "consecutive delimiters" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh "Something - I made up from thin air"
  [[ "$status" -eq 0 ]]
  [[ "$output" == "SIMUFTA" ]]
}

@test "apostrophes" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh "Halley's Comet"
  [[ "$status" -eq 0 ]]
  [[ "$output" == "HC" ]]
}

@test "underscore emphasis" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh "The Road __Not__ Taken"
  [[ "$status" -eq 0 ]]
  [[ "$output" == "TRNT" ]]
}
