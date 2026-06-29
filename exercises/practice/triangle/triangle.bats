#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:25+00:00

@test "equilateral triangle: all sides are equal" {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 2 2 2
  assert_success
  assert_output "true"
}

@test "equilateral triangle: any side is unequal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 2 3 2
  assert_success
  assert_output "false"
}

@test "equilateral triangle: no sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 5 4 6
  assert_success
  assert_output "false"
}

@test "equilateral triangle: all zero sides is not a triangle" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 0 0 0
  assert_success
  assert_output "false"
}

@test "equilateral triangle: sides may be floats" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh equilateral 0.5 0.5 0.5
  assert_success
  assert_output "true"
}

@test "isosceles triangle: last two sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 3 4 4
  assert_success
  assert_output "true"
}

@test "isosceles triangle: first two sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 4 4 3
  assert_success
  assert_output "true"
}

@test "isosceles triangle: first and last sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 4 3 4
  assert_success
  assert_output "true"
}

@test "isosceles triangle: equilateral triangles are also isosceles" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 4 4 4
  assert_success
  assert_output "true"
}

@test "isosceles triangle: no sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 2 3 4
  assert_success
  assert_output "false"
}

@test "isosceles triangle: first triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 1 1 3
  assert_success
  assert_output "false"
}

@test "isosceles triangle: second triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 1 3 1
  assert_success
  assert_output "false"
}

@test "isosceles triangle: third triangle inequality violation" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 3 1 1
  assert_success
  assert_output "false"
}

@test "isosceles triangle: sides may be floats" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh isosceles 0.5 0.4 0.5
  assert_success
  assert_output "true"
}

@test "scalene triangle: no sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 5 4 6
  assert_success
  assert_output "true"
}

@test "scalene triangle: all sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 4 4 4
  assert_success
  assert_output "false"
}

@test "scalene triangle: first and second sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 4 4 3
  assert_success
  assert_output "false"
}

@test "scalene triangle: first and third sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 3 4 3
  assert_success
  assert_output "false"
}

@test "scalene triangle: second and third sides are equal" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 4 3 3
  assert_success
  assert_output "false"
}

@test "scalene triangle: may not violate triangle inequality" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 7 3 2
  assert_success
  assert_output "false"
}

@test "scalene triangle: sides may be floats" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash triangle.sh scalene 0.5 0.4 0.6
  assert_success
  assert_output "true"
}
