#!/usr/bin/env bats

# local version: 2.0.0.0

@test "Empty tree" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "" ""
  (( status == 0 ))
  [[ $output = "{}" ]]
}

@test "Tree with one item" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a" "a"
  (( status == 0 ))
  expected='{"v": "a", "l": {}, "r": {}}'
  [[ $output == "$expected" ]]
}

@test "Tree with many items" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a i x f r" "i a f x r"
  (( status == 0 ))

  expectedJson=$(cat << END_JSON
    {"v": "a", 
        "l": {"v": "i", "l": {}, "r": {}}, 
        "r": {"v": "x",
            "l": {"v": "f", "l": {}, "r": {}},  
            "r": {"v": "r", "l": {}, "r": {}}
        }
    }
END_JSON
)
  # compare without spaces
  [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}

@test "Reject traversals of different length" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a b" "b a r"
  (( status == 1 ))
  shopt -s nocasematch
  [[ $output == "traversals must have the same length" ]]
}

@test "Reject inconsistent traversals of same length" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a b c" "x y z"
  (( status == 1 ))
  shopt -s nocasematch
  [[ $output == "traversals must have the same elements" ]]
}

@test "Reject traversals with repeated elements" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a b a" "b a a"
  (( status == 1 ))
  shopt -s nocasematch
  [[ $output == "traversals must contain unique elements" ]]
}
