#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.1.0.0

@test 'lowercase letter' {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'a'
  
  assert_success
  assert_output "1"
}

@test 'uppercase letter' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'A'
  
  assert_success
  assert_output "1"
}

@test 'valuable letter' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'f'
  
  assert_success
  assert_output "4"
}

@test 'short word' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'at'
  
  assert_success
  assert_output "2"
}

@test 'short, valuable word' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'zoo'
  
  assert_success
  assert_output "12"
}

@test 'medium word' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'street'
  
  assert_success
  assert_output "6"
}

@test 'medium, valuable word' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'quirky'
  
  assert_success
  assert_output "22"
}

@test 'long, mixed-case word' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'OxyphenButazone'
  
  assert_success
  assert_output "41"
}

@test 'english-like word' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'pinata'
  
  assert_success
  assert_output "8"
}

@test 'empty input' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh ''
  
  assert_success
  assert_output "0"
}

@test 'entire alphabet available' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash scrabble_score.sh 'abcdefghijklmnopqrstuvwxyz'
  
  assert_success
  assert_output "87"
}
