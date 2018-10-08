#!/usr/bin/env bash

# Test returns true if the triangle is equilateral

@test "A triangle is equilateral if all sides are equal" {
  #skip
  run bash triangle.sh equilateral 2 2 2
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "A triangle is not equilateral if any side is unequal" {
  skip
  run bash triangle.sh equilateral 2 3 2
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "A triangle is not equilateral if no sides are equal" {
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

@test "An equilateral triangle may have sides which are decimal numbers" {
  skip
  run bash triangle.sh equilateral 0.5 0.5 0.5
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

# Test returns true if the triangle is isosceles

@test "A triangle is an isosceles if the last two sides are equal" {
  skip
  run bash triangle.sh isosceles 3 4 4
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "A triangle is isosceles if the first two sides are equal" {
  skip
  run bash triangle.sh isosceles 4 4 3
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "A triangle is isoceles if the first and last sides are equal" {
  skip
  run bash triangle.sh isosceles 4 3 4
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "Equilateral triangles are also isosceles" {
  skip
  run bash triangle.sh isosceles 4 4 4
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "A triangle is not isosceles if no sides are equal" {
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

@test "An isoscele triangle may have sides which are decimal numbers" {
  skip
  run bash triangle.sh isosceles 0.5 0.4 0.5
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

# Test returns true if the triangle is scalene

@test "A triangle is scalene if it has no sides which are equal" {
  skip
  run bash triangle.sh scalene 5 4 6
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "A triangle is not scalene if all sides are equal" {
  skip
  run bash triangle.sh scalene 4 4 4
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "A triangle is not scalene if two sides are equal" {
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

@test "A scalene triangle may have sides which are decimal numbers" {
  skip
  run bash triangle.sh scalene 0.5 0.4 0.6
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

