#!/usr/bin/env bash

# local version: 2.3.0.3
# 
# bash-specific test: Input validation, proper quoting

@test 'empty strands' {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh '' ''
  (( status == 0 ))
  [[ $output == "0" ]]
}

@test 'single letter identical strands' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'A' 'A'
  (( status == 0 ))
  [[ $output == "0" ]]
}

@test 'single letter different strands' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'G' 'T'
  (( status == 0 ))
  [[ $output == "1" ]]
}

@test 'long identical strands' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'GGACTGAAATCTG' 'GGACTGAAATCTG'
  (( status == 0 ))
  [[ $output == "0" ]]
}

@test 'long different strands' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'GGACGGATTCTG' 'AGGACGGATTCT'
  (( status == 0 ))
  [[ $output == "9" ]]
}

@test 'disallow first strand longer' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'AATG' 'AAA'
  (( status == 1 ))
  [[ $output == *"strands must be of equal length"* ]]
}

@test 'disallow second strand longer' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'ATA' 'AGTG'
  (( status == 1 ))
  [[ $output == *"strands must be of equal length"* ]]
}

@test 'disallow left empty strand' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh '' 'G'
  (( status == 1 ))
  [[ $output == *"strands must be of equal length"* ]]
}

@test 'disallow right empty strand' {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'G' ''
  (( status == 1 ))
  [[ $output == *"strands must be of equal length"* ]]
}

@test "no input" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh
  (( status == 1 ))
  [[ $output == "Usage: hamming.sh <string1> <string2>" ]]
}

@test "invalid input" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'A'
  (( status == 1 ))
  [[ $output == "Usage: hamming.sh <string1> <string2>" ]]
}

# Within [[...]] the == operator is a _pattern matching_ operator.
# To test for string equality, the right-hand side must be
# quoted to prevent interpretation as a glob-style pattern.

@test "expose subtle '[[ \$x == \$y ]]' bug" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash hamming.sh 'AAA' 'A?A'
  (( status == 0 ))
  [[ $output == "1" ]]
}
