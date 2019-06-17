#!/usr/bin/env bash

@test 'basic' {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'Portable Network Graphics'
  [ "$status" -eq 0 ]
  [ "$output" == 'PNG' ]
}

@test 'lowercase words' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'Ruby on Rails'
  [ "$status" -eq 0 ]
  [ "$output" == 'ROR' ]
}

@test 'punctuation' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'First In, First Out'
  [ "$status" -eq 0 ]
  [ "$output" == 'FIFO' ]
}

@test 'all caps word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'GNU Image Manipulation Program'
  [ "$status" -eq 0 ]
  [ "$output" == 'GIMP' ]
}

@test 'punctuation without whitespace' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'Complementary metal-oxide semiconductor'
  [ "$status" -eq 0 ]
  [ "$output" == 'CMOS' ]
}

@test 'very long abbreviation' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash acronym.sh 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'
  [ "$status" -eq 0 ]
  [ "$output" == 'ROTFLSHTMDCOALM' ]
}
