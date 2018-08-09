#!/usr/bin/env bats

# Test returns true if the triangle is equilateral

@test "true if all sides are equal" {
  #skip
  run bash triangle.sh equilateral 2 2 2
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "false if any side is unequal" {
  skip
  run bash triangle.sh equilateral 2 3 2
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "false if no sides are equal" {
  skip
  run bash triangle.sh equilateral 5 4 6
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "All zero sides are illegal, so the triangle is not equilateral" {
  skip
  run bash triangle.sh equilateral 0 0 0
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

# Bonus: deal with floats

@test "sides may be floats" {
  skip
  run bash triangle.sh equilateral 0.5 0.5 0.5
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

# Test returns true if the triangle is isosceles

@test "true if last two sides are equal" {
  skip
  run bash triangle.sh isosceles 3 4 4
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "true if first two sides are equal" {
  skip
  run bash triangle.sh isosceles 4 4 3
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "true if first and last sides are equal" {
  skip
  run bash triangle.sh isosceles 4 3 4
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "equilateral triangles are also isosceles" {
  skip
  run bash triangle.sh isosceles 4 4 4
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "false if no sides are equal" {
  skip
  run bash triangle.sh isosceles 2 3 4
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "Sides that violate triangle inequality are not isosceles, even if two are equal" {
  skip
  run bash triangle.sh isosceles 1 1 3
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

# Bonus: deal with floats

@test "sides may be floats" {
  skip
  run bash triangle.sh isosceles 0.5 0.4 0.5
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

# Test returns true if the triangle is scalene

@test "true if no sides are equal" {
  skip
  run bash triangle.sh scalene 5 4 6
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "false if all sides are equal" {
  skip
  run bash triangle.sh scalene 4 4 4
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "false if two sides are equal" {
  skip
  run bash triangle.sh scalene 4 4 3
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "Sides that violate triangle inequality are not scalene, even if they are all different" {
  skip
  run bash triangle.sh scalene 7 3 2
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

# Bonus: deal with floats

@test "sides may be floats" {
  skip
  run bash triangle.sh scalene 0.5 0.4 0.6
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

