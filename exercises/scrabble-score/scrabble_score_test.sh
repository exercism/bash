#!/usr/bin/env bats

@test 'lowercase letter' {
  #skip
  run bash scrabble_score.sh 'a'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test 'uppercase letter' {
  skip
  run bash scrabble_score.sh 'A'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]
}

@test 'valuable letter' {
  skip
  run bash scrabble_score.sh 'f'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 4 ]
}

@test 'short word' {
  skip
  run bash scrabble_score.sh 'at'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ]
}

@test 'short, valuable word' {
  skip
  run bash scrabble_score.sh 'zoo'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 12 ]
}

@test 'medium word' {
  skip
  run bash scrabble_score.sh 'street'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 6 ]
}

@test 'medium, valuable word' {
  skip
  run bash scrabble_score.sh 'quirky'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 22 ]
}

@test 'long, mixed-case word' {
  skip
  run bash scrabble_score.sh 'OxyphenButazone'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 41 ]
}

@test 'english-like word' {
  skip
  run bash scrabble_score.sh 'pinata'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 8 ]
}

@test 'empty input' {
  skip
  run bash scrabble_score.sh ''
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test 'entire alphabet available' {
  skip
  run bash scrabble_score.sh 'abcdefghijklmnopqrstuvwxyz'
  
  [ "$status" -eq 0 ]
  [ "$output" -eq 87 ]
}
