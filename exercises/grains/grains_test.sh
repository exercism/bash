#!/usr/bin/env bats

@test "Square 1" {
  #skip
  run bash grains.sh 1

  [ "$status" -eq 0 ]
  [ "$output" = "1" ]
}

@test "Square 2" {
  #skip
  run bash grains.sh 2

  [ "$status" -eq 0 ]
  [ "$output" = "2" ]
}

@test "Square 3" {
  #skip
  run bash grains.sh 3

  [ "$status" -eq 0 ]
  [ "$output" = "4" ]
}

@test "Square 4" {
  #skip
  run bash grains.sh 4

  [ "$status" -eq 0 ]
  [ "$output" = "8" ]
}

@test "Square 16" {
  #skip
  run bash grains.sh 16

  [ "$status" -eq 0 ]
  [ "$output" = "32768" ]
}

@test "Square 32" {
  #skip
  run bash grains.sh 32

  [ "$status" -eq 0 ]
  [ "$output" = "2147483648" ]
}

@test "Square 64" {
  #skip
  run bash grains.sh 64

  [ "$status" -eq 0 ]
  [ "$output" = "9223372036854775808" ]
}

@test "Square 0 causes error" {
  #skip
  run bash grains.sh 0

  [ "$status" -eq 1 ]
}

@test "Square -1 causes error" {
  #skip
  run bash grains.sh -1

  [ "$status" -eq 1 ]
}

@test "Square 65 causes error" {
  #skip
  run bash grains.sh 65

  [ "$status" -eq 1 ]
}
