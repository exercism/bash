#!/usr/bin/env bash

# local version: 2.3.0.1
# 
# bash-specific test: Input validation

@test 'empty strands' {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh '' ''
  [[ $status -eq 0 ]]
  [[ $output == "0" ]]
}

@test 'single letter identical strands' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh 'A' 'A'
  [[ $status -eq 0 ]]
  [[ $output == "0" ]]
}

@test 'single letter different strands' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh 'G' 'T'
  [[ $status -eq 0 ]]
  [[ $output == "1" ]]
}

@test 'long identical strands' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh 'GGACTGAAATCTG' 'GGACTGAAATCTG'
  [[ $status -eq 0 ]]
  [[ $output == "0" ]]
}

@test 'long different strands' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh 'GGACGGATTCTG' 'AGGACGGATTCT'
  [[ $status -eq 0 ]]
  [[ $output == "9" ]]
}

@test 'disallow first strand longer' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh 'AATG' 'AAA'
  [[ $status -eq 1 ]]
  [[ $output == 'left and right strands must be of equal length' ]]
}

@test 'disallow second strand longer' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh 'ATA' 'AGTG'
  [[ $status -eq 1 ]]
  [[ $output == 'left and right strands must be of equal length' ]]
}

@test 'disallow left empty strand' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh '' 'G'
  [[ $status -eq 1 ]]
  [[ $output == 'left and right strands must be of equal length' ]]
}

@test 'disallow right empty strand' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh 'G' ''
  [[ $status -eq 1 ]]
  [[ $output == 'left and right strands must be of equal length' ]]
}

@test "no input" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh
  [[ $status -eq 1 ]]
  [[ $output == 'Usage: hamming.sh <string1> <string2>' ]]
}

@test "invalid input" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash hamming.sh 'A'
  [[ $status -eq 1 ]]
  [[ $output == 'Usage: hamming.sh <string1> <string2>' ]]
}
