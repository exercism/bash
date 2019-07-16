#!/usr/bin/env bash

@test "the sound for 1 is 1" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 1
  [[ $status -eq 0 ]]
  [[ $output == "1" ]]
}

@test "the sound for 3 is Pling" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 3
  [[ $status -eq 0 ]]
  [[ $output == "Pling" ]]
}

@test "the sound for 5 is Plang" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 5
  [[ $status -eq 0 ]]
  [[ $output == "Plang" ]]
}

@test "the sound for 7 is Plong" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 7
  [[ $status -eq 0 ]]
  [[ $output == "Plong" ]]
}

@test "the sound for 6 is Pling as it has a factor 3" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 6
  [[ $status -eq 0 ]]
  [[ $output == "Pling" ]]
}

@test "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 8
  [[ $status -eq 0 ]]
  [[ $output == "8" ]]
}

@test "the sound for 9 is Pling as it has a factor 3" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 9
  [[ $status -eq 0 ]]
  [[ $output == "Pling" ]]
}

@test "the sound for 10 is Plang as it has a factor 5" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 10
  [[ $status -eq 0 ]]
  [[ $output == "Plang" ]]
}

@test "the sound for 14 is Plong as it has a factor of 7" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 14
  [[ $status -eq 0 ]]
  [[ $output == "Plong" ]]
}

@test "the sound for 15 is PlingPlang as it has factors 3 and 5" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 15
  [[ $status -eq 0 ]]
  [[ $output == "PlingPlang" ]]
}

@test "the sound for 21 is PlingPlong as it has factors 3 and 7" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 21
  [[ $status -eq 0 ]]
  [[ $output == "PlingPlong" ]]
}

@test "the sound for 25 is Plang as it has a factor 5" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 25
  [[ $status -eq 0 ]]
  [[ $output == "Plang" ]]
}

@test "the sound for 27 is Pling as it has a factor 3" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 27
  [[ $status -eq 0 ]]
  [[ $output == "Pling" ]]
}

@test "the sound for 35 is PlangPlong as it has factors 5 and 7" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 35
  [[ $status -eq 0 ]]
  [[ $output == "PlangPlong" ]]
}

@test "the sound for 49 is Plong as it has a factor 7" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 49
  [[ $status -eq 0 ]]
  [[ $output == "Plong" ]]
}

@test "the sound for 52 is 52" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 52
  [[ $status -eq 0 ]]
  [[ $output == "52" ]]
}

@test "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 105
  [[ $status -eq 0 ]]
  [[ $output == "PlingPlangPlong" ]]
}

@test "the sound for 3125 is Plang as it has a factor 5" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash raindrops.sh 3125
  [[ $status -eq 0 ]]
  [[ $output == "Plang" ]]
}

