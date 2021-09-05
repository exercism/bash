#!/usr/bin/env bash
load bats-extra

# local version: 1.2.1.0

# Test returns true if the triangle is equilateral

@test "all sides are equal, equilateral" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 2 2 2
  assert_success
  assert_output "true"
}

@test "any side is unequal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 2 3 2
  assert_success
  assert_output "false"
}

@test "no sides are equal, equilateral" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 5 4 6
  assert_success
  assert_output "false"
}

@test "all zero sides is not a triangle" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 0 0 0
  assert_success
  assert_output "false"
}

# Bonus: deal with floats

@test "sides may be floats, equilateral" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 0.5 0.5 0.5
  assert_success
  assert_output "true"
}

# Test returns true if the triangle is isosceles

@test "last two sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 3 4 4
  assert_success
  assert_output "true"
}

@test "first two sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 4 4 3
  assert_success
  assert_output "true"
}

@test "first and last sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 4 3 4
  assert_success
  assert_output "true"
}

@test "equilateral triangles are also isosceles" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 4 4 4
  assert_success
  assert_output "true"
}

@test "no sides are equal, isosceles" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 2 3 4
  assert_success
  assert_output "false"
}

@test "first triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 1 1 3
  assert_success
  assert_output "false"
}

@test "second triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 1 3 1
  assert_success
  assert_output "false"
}

@test "third triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 3 1 1
  assert_success
  assert_output "false"
}

# Bonus: deal with floats

@test "sides may be floats, isosceles" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 0.5 0.4 0.5
  assert_success
  assert_output "true"
}

# Test returns true if the triangle is scalene

@test "no sides are equal, scalene" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 5 4 6
  assert_success
  assert_output "true"
}

@test "all sides are equal, scalene" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 4 4 4
  assert_success
  assert_output "false"
}

@test "two sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 4 4 3
  assert_success
  assert_output "false"
}

@test "may not violate triangle inequality" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 7 3 2
  assert_success
  assert_output "false"
}

# Bonus: deal with floats

@test "sides may be floats, scalene" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 0.5 0.4 0.6
  assert_success
  assert_output "true"
}
