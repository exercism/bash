#!/usr/bin/env bash

# local version: 1.4.0.0

@test "stating something" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'Tom-ay-to, tom-aaaah-to.'
  [[ $status -eq 0 ]]
  [[ $output == "Whatever." ]]
}

@test "shouting" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'WATCH OUT!'
  [[ $status -eq 0 ]]
  [[ $output == "Whoa, chill out!" ]]
}

@test "shouting gibberish" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'FCECDFCAAB'
  [[ $status -eq 0 ]]
  [[ $output == "Whoa, chill out!" ]]
}

@test "asking a question" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'Does this cryogenic chamber make me look fat?'
  [[ $status -eq 0 ]]
  [[ $output == "Sure." ]]
}

@test "asking a numeric question" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'You are, what, like 15?'
  [[ $status -eq 0 ]]
  [[ $output == "Sure." ]]
}

@test "asking gibberish" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'fffbbcbeab?'
  [[ $status -eq 0 ]]
  [[ $output == "Sure." ]]
}

@test "talking forcefully" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh "Let's go make out behind the gym!"
  [[ $status -eq 0 ]]
  [[ $output == "Whatever." ]]
}

@test "using acronyms in regular speech" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh "It's OK if you don't want to go to the DMV."
  [[ $status -eq 0 ]]
  [[ $output == "Whatever." ]]
}

@test "forceful question" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'WHAT THE HELL WERE YOU THINKING?'
  [[ $status -eq 0 ]]
  [[ $output == "Calm down, I know what I'm doing!" ]]
}

@test "shouting numbers" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh '1, 2, 3 GO!'
  [[ $status -eq 0 ]]
  [[ $output == "Whoa, chill out!" ]]
}

@test "no letters" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh '1, 2, 3'
  [[ $status -eq 0 ]]
  [[ $output == "Whatever." ]]
}

@test "question with no letters" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh '4?'
  [[ $status -eq 0 ]]
  [[ $output == "Sure." ]]
}

@test "shouting with special characters" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
  [[ $status -eq 0 ]]
  [[ $output == "Whoa, chill out!" ]]
}

@test "shouting with no exclamation mark" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'I HATE THE DMV'
  [[ $status -eq 0 ]]
  [[ $output == "Whoa, chill out!" ]]
}

@test "statement containing question mark" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'Ending with ? means a question.'
  [[ $status -eq 0 ]]
  [[ $output == "Whatever." ]]
}

@test "non-letters with question" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh ':) ?'
  [[ $status -eq 0 ]]
  [[ $output == "Sure." ]]
}

@test "prattling on" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'Wait! Hang on. Are you going to be OK?'
  [[ $status -eq 0 ]]
  [[ $output == "Sure." ]]
}

@test "silence" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh ''
  [[ $status -eq 0 ]]
  [[ $output == "Fine. Be that way!" ]]
}

@test "prolonged silence" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh '          '
  [[ $status -eq 0 ]]
  [[ $output == "Fine. Be that way!" ]]
}

@test "alternate silence" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh $'\t\t\t\t\t\t\t\t\t\t'
  [[ $status -eq 0 ]]
  [[ $output == "Fine. Be that way!" ]]
}

@test "multiple line question" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh $'\nDoes this cryogenic chamber make me look fat?\nNo'
  [[ $status -eq 0 ]]
  [[ $output == "Whatever." ]]
}

@test "starting with whitespace" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh '         hmmmmmmm...'
  [[ $status -eq 0 ]]
  [[ $output == "Whatever." ]]
}

@test "ending with whitespace" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'Okay if like my  spacebar  quite a bit?   '
  [[ $status -eq 0 ]]
  [[ $output == "Sure." ]]
}
# This test might act differently depending on your platform
@test "other whitespace" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh $'\n\r \t'
  [[ $status -eq 0 ]]
  [[ $output == "Fine. Be that way!" ]]
}

@test "non-question ending with whitespace" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh 'This is a statement ending with whitespace      '
  [[ $status -eq 0 ]]
  [[ $output == "Whatever." ]]
}

@test "no input is silence" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash bob.sh
  [[ $status -eq 0 ]]
  [[ $output == "Fine. Be that way!" ]]
}
