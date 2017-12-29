#!/usr/bin/env bats

@test 'Single digits are armstrong numbers' {
  #skip
  run ./armstrong_numbers.sh isarmstrong 5

  [ "$status" -eq 0 ]
}

@test 'There are no two digit armstrong numbers' {
  skip
  run ./armstrong_numbers.sh isarmstrong 10

  [ "$status" -eq 1 ]
}

@test 'A three digit number that is an armstrong number' {
  skip
  run ./armstrong_numbers.sh isarmstrong 153

  [ "$status" -eq 0 ]
}

@test 'A three digit number that is not an armstrong number' {
  skip
  run ./armstrong_numbers.sh isarmstrong 100 

  [ "$status" -eq 1 ]
}

@test 'A four digit number that is an armstrong number' {
  skip
  run ./armstrong_numbers.sh isarmstrong 9475 

  [ "$status" -eq 0 ]
}

@test 'A four digit number that is not an armstrong number' {
  skip
  run ./armstrong_numbers.sh isarmstrong 9475 

  [ "$status" -eq 1 ]
}

@test 'A seven digit number that is an armstrong number' {
  skip
  run ./armstrong_numbers.sh isarmstrong 9926315 

  [ "$status" -eq 0 ]
}

@test 'A seven digit number that is not an armstrong number' {
  skip
  run ./armstrong_numbers.sh isarmstrong 9926314 

  [ "$status" -eq 1 ]
}

