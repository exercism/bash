#!/usr/bin/env bash

# local version: 1.5.0.0

@test "no matches" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "diaper" "hello world zombies pants"
  (( status == 0 ))
  [[ $output == "" ]]
}

@test "detects two anagrams" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "solemn" "lemons cherry melons"
  (( status == 0 ))
  [[ $output == "lemons melons" ]]
}

@test "does not detect anagram subsets" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "good" "dog goody"
  (( status == 0 ))
  [[ $output == "" ]]
}

@test "detects anagram" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "listen" "enlists google inlets banana"
  (( status == 0 ))
  [[ $output == "inlets" ]]
}

@test "detects three anagrams" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "allergy" "gallery ballerina regally clergy largely leading"
  (( status == 0 ))
  [[ $output == "gallery regally largely" ]]
}

@test "detects multiple anagrams with different case" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "nose" "Eons ONES"
    (( status == 0 ))
    [[ $output == "Eons ONES" ]]
}

@test "does not detect non-anagrams with identical checksum" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "mass" "last"
  (( status == 0 ))
  [[ $output == "" ]]
}

@test "detects anagrams case-insensitively" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "Orchestra" "cashregister Carthorse radishes"
  (( status == 0 ))
  [[ $output == "Carthorse" ]]
}

@test "detects anagrams using case-insensitive subject" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "Orchestra" "cashregister carthorse radishes"
  (( status == 0 ))
  [[ $output == "carthorse" ]]
}

@test "detects anagrams using case-insensitive possible matches" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "orchestra" "cashregister Carthorse radishes"
  (( status == 0 ))
  [[ $output == "Carthorse" ]]
}

@test "does not detect a anagram if the original word is repeated" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "go" "go Go GO"
  (( status == 0 ))
  [[ $output == "" ]]
}

@test "anagrams must use all letters exactly once" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "tapper" "patter"
  (( status == 0 ))
  [[ $output == "" ]]
}

@test "capital word is not own anagram" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "BANANA" "BANANA Banana banana"
  (( status == 0 ))
  [[ $output == "" ]]
}

@test "words other than themselves can be anagrams" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "LISTEN" "Listen Silent LISTEN"
  (( status == 0 ))
  [[ $output == "Silent" ]]
}
