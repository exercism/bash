#!/usr/bin/env bash

# local version: 1.1.0.0

@test 'lowercase letter' {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'a'
  
  (( status == 0 ))
  [[ $output == "1" ]]
}

@test 'uppercase letter' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'A'
  
  (( status == 0 ))
  [[ $output == "1" ]]
}

@test 'valuable letter' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'f'
  
  (( status == 0 ))
  [[ $output == "4" ]]
}

@test 'short word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'at'
  
  (( status == 0 ))
  [[ $output == "2" ]]
}

@test 'short, valuable word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'zoo'
  
  (( status == 0 ))
  [[ $output == "12" ]]
}

@test 'medium word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'street'
  
  (( status == 0 ))
  [[ $output == "6" ]]
}

@test 'medium, valuable word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'quirky'
  
  (( status == 0 ))
  [[ $output == "22" ]]
}

@test 'long, mixed-case word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'OxyphenButazone'
  
  (( status == 0 ))
  [[ $output == "41" ]]
}

@test 'english-like word' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'pinata'
  
  (( status == 0 ))
  [[ $output == "8" ]]
}

@test 'empty input' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh ''
  
  (( status == 0 ))
  [[ $output == "0" ]]
}

@test 'entire alphabet available' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash scrabble_score.sh 'abcdefghijklmnopqrstuvwxyz'
  
  (( status == 0 ))
  [[ $output == "87" ]]
}
