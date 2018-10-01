#!/usr/bin/env bash

@test "count one word" {
  #skip
  run bash word_count.sh "word"
  [ "$status" -eq 0 ]
  echo $output | grep "word: 1"
  echo $output | wc -w | grep "2"
}

@test "count one of each word" {
  skip
  run bash word_count.sh "one of each"
  [ "$status" -eq 0 ]
  echo $output | grep "one: 1"
  echo $output | grep "of: 1"
  echo $output | grep "each: 1"
  echo $output | wc -w | grep "6"
}

@test "multiple occurrences of a word" {
  skip
  run bash word_count.sh "one fish two fish red fish blue fish"
  [ "$status" -eq 0 ]
  echo $output | grep "one: 1"
  echo $output | grep "fish: 4"
  echo $output | grep "two: 1"
  echo $output | grep "red: 1"
  echo $output | grep "blue: 1"
  echo $output | wc -w | grep "10"
}

@test "handles cramped lists" {
  skip
  run bash word_count.sh "one,two,three"
  [ "$status" -eq 0 ]
  echo $output | grep "one: 1"
  echo $output | grep "two: 1"
  echo $output | grep "three: 1"
  echo $output | wc -w | grep "6"
}

@test "handles expanded lists" {
  skip
  run bash word_count.sh "one,\ntwo,\nthree"
  [ "$status" -eq 0 ]
  echo $output | grep "one: 1"
  echo $output | grep "two: 1"
  echo $output | grep "three: 1"
  echo $output | wc -w | grep "6"
}

@test "ignore punctuation" {
  skip
  run bash word_count.sh "car: carpet as java: javascript!!&@$%^&"
  [ "$status" -eq 0 ]
  echo $output | grep "car: 1"
  echo $output | grep "carpet: 1"
  echo $output | grep "as: 1"
  echo $output | grep "java: 1"
  echo $output | grep "javascript: 1"
  echo $output | wc -w | grep "10"
}

@test "include numbers" {
  skip
  run bash word_count.sh "testing, 1, 2 testing"
  [ "$status" -eq 0 ]
  echo $output | grep "testing: 2"
  echo $output | grep "1: 1"
  echo $output | grep "2: 1"
  echo $output | wc -w | grep "6"
}

@test "normalize case" {
  skip
  run bash word_count.sh "go Go GO Stop stop"
  [ "$status" -eq 0 ]
  echo $output | grep "go: 3"
  echo $output | grep "stop: 2"
  echo $output | wc -w | grep "4"
}

@test "with apostrophes" {
  skip
  run bash word_count.sh "First: don't laugh. Then: don't cry."
  [ "$status" -eq 0 ]
  echo $output | grep "first: 1"
  echo $output | grep "don't: 2"
  echo $output | grep "laugh: 1"
  echo $output | grep "then: 1"
  echo $output | grep "cry: 1"
  echo $output | wc -w | grep "10"
}

@test "with quotations" {
  skip
  run bash word_count.sh "Joe can't tell between 'large' and large."
  [ "$status" -eq 0 ]
  echo $output | grep "joe: 1"
  echo $output | grep "can't: 1"
  echo $output | grep "tell: 1"
  echo $output | grep "between: 1"
  echo $output | grep "large: 2"
  echo $output | grep "and: 1"
  echo $output | wc -w | grep "12"
}

@test "multiple spaces not detected as a word" {
  skip
  run bash word_count.sh " multiple   whitespaces"
  [ "$status" -eq 0 ]
  echo $output | grep "multiple: 1"
  echo $output | grep "whitespaces: 1"
  echo $output | wc -w | grep "4"
}

