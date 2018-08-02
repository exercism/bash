#!/usr/bin/env bats

@test "Test name - first test shouldn't be skipped" {
  #skip
  run bash exercise_slug.sh
  [ "$status" -eq 0 ]
  [ "$output" = "What's expected" ]
}

@test "Second test onwards should be skipped" {
  skip
  run bash exercise_slug.sh
  [ "$status" -eq 0 ]
  [ "$output" = "What's expected" ]
}
