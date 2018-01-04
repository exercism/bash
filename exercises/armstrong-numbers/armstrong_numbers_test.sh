#!/usr/bin/env bats

@test 'Single digits are Armstrong numbers' {
  # skip
  run ./armstrong_numbers.sh isarmstrong 5

  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'There are no two digit Armstrong numbers' {
  # skip
  run ./armstrong_numbers.sh isarmstrong 10

  [ "$status" -eq 1 ]
  [ "$output" = "false" ]
}

@test 'A three digit number that is an Armstrong number' {
  # skip
  run ./armstrong_numbers.sh isarmstrong 153

  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'A three digit number that is not an Armstrong number' {
  # skip
  run ./armstrong_numbers.sh isarmstrong 100

  [ "$status" -eq 1 ]
  [ "$output" = "false" ]
}

@test 'A four digit number that is an Armstrong number' {
  # skip
  run ./armstrong_numbers.sh isarmstrong 9474

  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'A four digit number that is not an Armstrong number' {
  # skip
  run ./armstrong_numbers.sh isarmstrong 9475

  [ "$status" -eq 1 ]
  [ "$output" = "false" ]
}

@test 'A seven digit number that is an Armstrong number' {
  # skip
  run ./armstrong_numbers.sh isarmstrong 9926315

  [ "$status" -eq 0 ]
  [ "$output" = "true" ]
}

@test 'A seven digit number that is not an Armstrong number' {
  # skip
  run ./armstrong_numbers.sh isarmstrong 9926314

  [ "$status" -eq 1 ]
  [ "$output" = "false" ]
}

