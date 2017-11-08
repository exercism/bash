#!/usr/bin/env bats

@test 'Equilateral is true if all sides are equal' {
  run bash example.sh is_equilateral 2 2 2

  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test 'Equilateral is false if any side is unequal' {
  run bash example.sh is_equilateral 2 3 2

  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test 'Equilateral is false if no sides are equal' {
  run bash example.sh is_equilateral 5 4 6

  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test 'Isosceles is true if the last two sides are equal' {
  run bash example.sh is_isosceles 3 4 4

  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test 'Isosceles is true if the first two sides are equal' {
  run bash example.sh is_isosceles 4 4 3

  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test 'Isosceles is true if the first and last side are equal' {
  run bash example.sh is_isosceles 4 3 4

  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test 'Equilateral triangles are also isosceles' {
  run bash example.sh is_isosceles 4 4 4

  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test 'False if no sides are equal' {
  run bash example.sh is_isosceles 2 3 4

  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test 'Sides that violate the triangle inequality are not isosceles, even if two are equal' {
  run bash example.sh is_isosceles 1 1 3

  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test 'Scalene is true if no sides are equal' {
  run bash example.sh is_scalene 5 4 6

  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test 'Scalene is false if all sides are equal' {
  run bash example.sh is_scalene 4 4 4

  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test 'Scalene is false if two sides are equal' {
  run bash example.sh is_scalene 4 4 3

  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test 'Sides that violate the triangle inequality are not scalene, even if they are all different' {
  run bash example.sh is_scalene 7 3 2

  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test 'All zero sides are illegal, so the triangle is not scalene' {
  run bash example.sh is_scalene 0 0 0

  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}