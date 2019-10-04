#!/usr/bin/env bash

# canonical-data version: 1.4.0

@test "count one word" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "word"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "word: 1"
  [[ $(wc -l <<<"$output") -eq 1 ]]
}

@test "count one of each word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "one of each"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "one: 1"
  echo "$output" | grep -qFx "of: 1"
  echo "$output" | grep -qFx "each: 1"
  [[ $(wc -l <<<"$output") -eq 3 ]]
}

@test "multiple occurrences of a word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "one fish two fish red fish blue fish"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "one: 1"
  echo "$output" | grep -qFx "fish: 4"
  echo "$output" | grep -qFx "two: 1"
  echo "$output" | grep -qFx "red: 1"
  echo "$output" | grep -qFx "blue: 1"
  [[ $(wc -l <<<"$output") -eq 5 ]]
}

@test "handles cramped lists" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "one,two,three"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "one: 1"
  echo "$output" | grep -qFx "two: 1"
  echo "$output" | grep -qFx "three: 1"
  [[ $(wc -l <<<"$output") -eq 3 ]]
}

@test "handles expanded lists" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "one,\ntwo,\nthree"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "one: 1"
  echo "$output" | grep -qFx "two: 1"
  echo "$output" | grep -qFx "three: 1"
  [[ $(wc -l <<<"$output") -eq 3 ]]
}

@test "ignore punctuation" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "car: carpet as java: javascript!!&@$%^&"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "car: 1"
  echo "$output" | grep -qFx "carpet: 1"
  echo "$output" | grep -qFx "as: 1"
  echo "$output" | grep -qFx "java: 1"
  echo "$output" | grep -qFx "javascript: 1"
  [[ $(wc -l <<<"$output") -eq 5 ]]
}

@test "include numbers" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "testing, 1, 2 testing"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "testing: 2"
  echo "$output" | grep -qFx "1: 1"
  echo "$output" | grep -qFx "2: 1"
  [[ $(wc -l <<<"$output") -eq 3 ]]
}

@test "normalize case" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "go Go GO Stop stop"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "go: 3"
  echo "$output" | grep -qFx "stop: 2"
  [[ $(wc -l <<<"$output") -eq 2 ]]
}

@test "with apostrophes" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "First: don't laugh. Then: don't cry."
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "first: 1"
  echo "$output" | grep -qFx "don't: 2"
  echo "$output" | grep -qFx "laugh: 1"
  echo "$output" | grep -qFx "then: 1"
  echo "$output" | grep -qFx "cry: 1"
  [[ $(wc -l <<<"$output") -eq 5 ]]
}

@test "with quotations" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "Joe can't tell between 'large' and large."
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "joe: 1"
  echo "$output" | grep -qFx "can't: 1"
  echo "$output" | grep -qFx "tell: 1"
  echo "$output" | grep -qFx "between: 1"
  echo "$output" | grep -qFx "large: 2"
  echo "$output" | grep -qFx "and: 1"
  [[ $(wc -l <<<"$output") -eq 6 ]]
}

@test "substrings from the beginning" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "Joe can't tell between apple, app and a."
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "joe: 1"
  echo "$output" | grep -qFx "can't: 1"
  echo "$output" | grep -qFx "tell: 1"
  echo "$output" | grep -qFx "apple: 1"
  echo "$output" | grep -qFx "app: 1"
  echo "$output" | grep -qFx "and: 1"
  echo "$output" | grep -qFx "a: 1"
  [[ $(wc -l <<<"$output") -eq 8 ]]
}

@test "multiple spaces not detected as a word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh " multiple   whitespaces"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "multiple: 1"
  echo "$output" | grep -qFx "whitespaces: 1"
  [[ $(wc -l <<<"$output") -eq 2 ]]
}

@test "alternating word separators are not detected as a word" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh $',\n,one,\n ,two \n \'three\''
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "one: 1"
  echo "$output" | grep -qFx "two: 1"
  echo "$output" | grep -qFx "three: 1"
  [[ $(wc -l <<< "$output") -eq 3 ]]
}

# bash-specific test: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "contains shell globbing character" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash word_count.sh "two * words"
  [[ $status -eq 0 ]]
  echo "$output" | grep -qFx "two: 1"
  echo "$output" | grep -qFx "words: 1"
  [[ $(wc -l <<< "$output") -eq 2 ]]
}
