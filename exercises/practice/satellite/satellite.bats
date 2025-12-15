#!/usr/bin/env bats
load bats-extra

# local version: 2.0.0.0

@test "Empty tree" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "" ""
  assert_success
  [[ $output = "{}" ]]
}

@test "Tree with one item" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a" "a"
  assert_success
  expected='{"v": "a", "l": {}, "r": {}}'
  assert_output "$expected"
}

@test "Tree with many items" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a i x f r" "i a f x r"
  assert_success

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
  assert_failure
  shopt -s nocasematch
  assert_output "traversals must have the same length"
}

@test "Reject inconsistent traversals of same length" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a b c" "x y z"
  assert_failure
  shopt -s nocasematch
  assert_output "traversals must have the same elements"
}

@test "Reject traversals with repeated elements" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a b a" "b a a"
  assert_failure
  shopt -s nocasematch
  assert_output "traversals must contain unique elements"
}

@test "A degenerate binary tree" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a b c d" "d c b a"
  assert_success
  expectedJson=$(cat << END_JSON
    {
        "v": "a",
        "l": {
            "v": "b",
            "l": {
                "v": "c",
                "l": { "v": "d", "l": {}, "r": {} },
                "r": {}
            },
            "r": {}
        },
        "r": {}
    }
END_JSON
)
  # compare without spaces
  [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}

@test "Another degenerate binary tree" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a b c d" "a b c d"
  assert_success
  expectedJson=$(cat << END_JSON
    {
        "v": "a",
        "l": {},
        "r": {
            "v": "b",
            "l": {},
            "r": {
                "v": "c",
                "l": {},
                "r": { "v": "d", "l": {}, "r": {} }
            }
        }
    }
END_JSON
)
  # compare without spaces
  [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}

@test "Tree with many more items" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash satellite.sh "a b d g h c e f i" "g d h b a e c i f"
  assert_success
  expectedJson=$(cat << END_JSON
    {
        "v": "a",
        "l": {
            "v": "b",
            "l": {
                "v": "d",
                "l": { "v": "g", "l": {}, "r": {} },
                "r": { "v": "h", "l": {}, "r": {} }
            },
            "r": {}
        },
        "r": {
            "v": "c",
            "l": { "v": "e", "l": {}, "r": {} },
            "r": {
                "v": "f",
                "l": { "v": "i", "l": {}, "r": {} },
                "r": {}
            }
        }
    }
END_JSON
)
  # compare without spaces
  [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}
