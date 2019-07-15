#!/usr/bin/env bash

# Test returns true if the triangle is equilateral

@test "all sides are equal, equilateral" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh equilateral 2 2 2
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "any side is unequal" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh equilateral 2 3 2
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "no sides are equal, equilateral" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh equilateral 5 4 6
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "all zero sides is not a triangle" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh equilateral 0 0 0
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

# Bonus: deal with floats

@test "sides may be floats, equilateral" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh equilateral 0.5 0.5 0.5
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

# Test returns true if the triangle is isosceles

@test "last two sides are equal" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 3 4 4
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "first two sides are equal" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 4 4 3
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "first and last sides are equal" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 4 3 4
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "equilateral triangles are also isosceles" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 4 4 4
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "no sides are equal, isosceles" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 2 3 4
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "first triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 1 1 3
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "second triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 1 1 3
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "third triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 1 1 3
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

# Bonus: deal with floats

@test "sides may be floats, isosceles" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh isosceles 0.5 0.4 0.5
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

# Test returns true if the triangle is scalene

@test "no sides are equal, scalene" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh scalene 5 4 6
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "all sides are equal, scalene" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh scalene 4 4 4
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "two sides are equal" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh scalene 4 4 3
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "may not violate triangle inequality" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh scalene 7 3 2
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

# Bonus: deal with floats

@test "sides may be floats, scalene" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash triangle.sh scalene 0.5 0.4 0.6
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

