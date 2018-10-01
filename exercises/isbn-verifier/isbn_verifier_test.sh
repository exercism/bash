#!/usr/bin/env bash

@test 'valid isbn number' {
  #skip
  run bash isbn_verifier.sh '3-598-21508-8'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'invalid isbn check digit' {
  skip
  run bash isbn_verifier.sh '3-598-21508-9'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'valid isbn number with a check digit of 10' {
  skip
  run bash isbn_verifier.sh '3-598-21507-X'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'check digit is a character other than X' {
  skip
  run bash isbn_verifier.sh '3-598-21507-A'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'invalid character in isbn' {
  skip
  run bash isbn_verifier.sh '3-598-P1581-X'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'X is only valid as a check digit' {
  skip
  run bash isbn_verifier.sh '3-598-2X507-9'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'valid isbn without separating dashes' {
  skip
  run bash isbn_verifier.sh '3598215088'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'isbn without separating dashes and X as check digit' {
  skip
  run bash isbn_verifier.sh '359821507X'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'isbn without check digit and dashes' {
  skip
  run bash isbn_verifier.sh '359821507'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'too long isbn and no dashes' {
  skip
  run bash isbn_verifier.sh '3598215078X'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'too short isbn' {
  skip
  run bash isbn_verifier.sh '00'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'isbn without check digit' {
  skip
  run bash isbn_verifier.sh '3-598-21507'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'check digit of X should not be used for 0' {
  skip
  run bash isbn_verifier.sh '3-598-21515-X'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'empty isbn' {
  skip
  run bash isbn_verifier.sh ''
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'input is 9 characters' {
  skip
  run bash isbn_verifier.sh '134456729'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'invalid characters are not ignored' {
  skip
  run bash isbn_verifier.sh '3132P34035'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'input is too long but contains a valid isbn' {
  skip
  run bash isbn_verifier.sh '98245726788'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

