#!/usr/bin/env bats

@test "Test name - first test shouldn't be skipped" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash exercise_slug.sh
  [[ $status -eq 0 ]]
  [[ $output = "What's expected" ]]
}

@test "Second test onwards should be skipped" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash exercise_slug.sh
  [[ $status -eq 0 ]]
  [[ $output = "What's expected" ]]
}
