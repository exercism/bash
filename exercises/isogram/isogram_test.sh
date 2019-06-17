#!/usr/bin/env bash

# Check if the given string is an isogram

@test 'empty string' {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh ''
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'isogram with only lower case characters' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'isogram'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'word with one duplicated character' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'eleven'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'word with one duplicated character from the end of the alphabet' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'zzyzx'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'longest reported english isogram' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'subdermatoglyphic'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'word with duplicated character in mixed case' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'Alphabet'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'hypothetical isogrammic word with hyphen' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'thumbscrew-japingly'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'isogram with duplicated hyphen' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'six-year-old'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'made-up name that is an isogram' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'Emily Jung Schwartzkopf'
  [ "$status" -eq 0 ]
  [ "$output" == 'true' ]
}

@test 'duplicated character in the middle' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'accentor'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'word with duplicated character in mixed case, lowercase first' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'alphAbet'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}

@test 'same first and last characters' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash isogram.sh 'angola'
  [ "$status" -eq 0 ]
  [ "$output" == 'false' ]
}
