# check non factors

@test "Number 1, not factor of 3, 5 or 7, should output itself: 1." {
  run bash raindrops.sh 1

  [ "$status" -eq 0 ]
  [ "$output" = "1" ]
}

@test "Number 52, not factor of 3, 5 or 7, should output itself: 52." {
  run bash raindrops.sh 52

  [ "$status" -eq 0 ]
  [ "$output" = "52" ]
}

@test "Number 21121, not factor of 3, 5 or 7, should output itself: 21121." {
  run bash raindrops.sh 21121

  [ "$status" -eq 0 ]
  [ "$output" = "21121" ]
}

# check factor themselves

@test "Number 3, only factor of 3, should output: Pling." {
  run bash raindrops.sh 3

  [ "$status" -eq 0 ]
  [ "$output" = "Pling" ]
}

@test "Number 5, only factor of 5, should output: Plang." {
  run bash raindrops.sh 5

  [ "$status" -eq 0 ]
  [ "$output" = "Plang" ]
}

@test "Number 7, only factor of 7, should output: Plong." {
  run bash raindrops.sh 7

  [ "$status" -eq 0 ]
  [ "$output" = "Plong" ]
}

# check factor with non factors

@test "Number 6, factor of 3 but not 5 or 7, should output: Pling." {
  run bash raindrops.sh 6

  [ "$status" -eq 0 ]
  [ "$output" = "Pling" ]
}

@test "Number 10, factor of 5 but not 3 or 7, should output: Plang." {
  run bash raindrops.sh 10

  [ "$status" -eq 0 ]
  [ "$output" = "Plang" ]
}

@test "Number 14, factor of 7 but not 3 or 5, should output: Plong." {
  run bash raindrops.sh 14

  [ "$status" -eq 0 ]
  [ "$output" = "Plong" ]
}

# check factor with another factor

@test "Number 15, factor of 3 and 5, should output: PlingPlang." {
  run bash raindrops.sh 15

  [ "$status" -eq 0 ]
  [ "$output" = "PlingPlang" ]
}

@test "Number 21, factor of 3 and 7, should output: PlingPlong." {
  run bash raindrops.sh 21

  [ "$status" -eq 0 ]
  [ "$output" = "PlingPlong" ]
}

@test "Number 35, factor of 5 and 7, should output: PlangPlong." {
  run bash raindrops.sh 35

  [ "$status" -eq 0 ]
  [ "$output" = "PlangPlong" ]
}

# check factor with itself

@test "Number 9, factor of 9, should output: Pling (not PlingPling)." {
  run bash raindrops.sh 9

  [ "$status" -eq 0 ]
  [ "$output" = "Pling" ]
}

@test "Number 25, factor of 5, should output: Plang (not PlangPlang)." {
  run bash raindrops.sh 25

  [ "$status" -eq 0 ]
  [ "$output" = "Plang" ]
}

@test "Number 49, factor of 7, should output: Plong (not PlongPlong)." {
  run bash raindrops.sh 49

  [ "$status" -eq 0 ]
  [ "$output" = "Plong" ]
}

# check all factors

@test "Number 105, factor of 3, 5 and 7, should output: PlingPlangPlong." {
  run bash raindrops.sh 105

  [ "$status" -eq 0 ]
  [ "$output" = "PlingPlangPlong" ]
}
