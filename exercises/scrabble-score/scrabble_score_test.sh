#!/usr/bin/env bash

@test 'lowercase letter' {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'a'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 1 ]]
}

@test 'uppercase letter' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'A'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 1 ]]
}

@test 'valuable letter' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'f'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 4 ]]
}

@test 'short word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'at'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 2 ]]
}

@test 'short, valuable word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'zoo'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 12 ]]
}

@test 'medium word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'street'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 6 ]]
}

@test 'medium, valuable word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'quirky'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 22 ]]
}

@test 'long, mixed-case word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'OxyphenButazone'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 41 ]]
}

@test 'english-like word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'pinata'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 8 ]]
}

@test 'empty input' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh ''
  
  [[ $status -eq 0 ]]
  [[ $output -eq 0 ]]
}

@test 'entire alphabet available' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'abcdefghijklmnopqrstuvwxyz'
  
  [[ $status -eq 0 ]]
  [[ $output -eq 87 ]]
}
