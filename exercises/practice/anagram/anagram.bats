#!/usr/bin/env bats
load bats-extra

# local version: 1.5.0.0

@test "no matches" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "diaper" "hello world zombies pants"
  assert_success
  refute_output     # no output
}

@test "detects two anagrams" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "solemn" "lemons cherry melons"
  assert_success
  assert_output "lemons melons"
}

@test "does not detect anagram subsets" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "good" "dog goody"
  assert_success
  refute_output
}

@test "detects anagram" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "listen" "enlists google inlets banana"
  assert_success
  assert_output "inlets"
}

@test "detects three anagrams" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "allergy" "gallery ballerina regally clergy largely leading"
  assert_success
  assert_output "gallery regally largely"
}

@test "detects multiple anagrams with different case" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash anagram.sh "nose" "Eons ONES"
    assert_success
    assert_output "Eons ONES"
}

@test "does not detect non-anagrams with identical checksum" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "mass" "last"
  assert_success
  refute_output
}

@test "detects anagrams case-insensitively" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "Orchestra" "cashregister Carthorse radishes"
  assert_success
  assert_output "Carthorse"
}

@test "detects anagrams using case-insensitive subject" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "Orchestra" "cashregister carthorse radishes"
  assert_success
  assert_output "carthorse"
}

@test "detects anagrams using case-insensitive possible matches" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "orchestra" "cashregister Carthorse radishes"
  assert_success
  assert_output "Carthorse"
}

@test "does not detect a anagram if the original word is repeated" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "go" "goGoGO"
  assert_success
  refute_output
}

@test "anagrams must use all letters exactly once" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "tapper" "patter"
  assert_success
  refute_output
}

@test "words are not anagrams of themselves" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "BANANA" "BANANA"
  assert_success
  refute_output
}

@test "words are not anagrams of themselves even if letter case is partially different" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "BANANA" "Banana"
  assert_success
  refute_output
}

@test "words are not anagrams of themselves even if letter case is completely different" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "BANANA" "banana"
  assert_success
  refute_output
}

@test "words other than themselves can be anagrams" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash anagram.sh "LISTEN" "LISTEN Silent"
  assert_success
  assert_output "Silent"
}
