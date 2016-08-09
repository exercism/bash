@test "Test saying something." {
  run bash bob.sh "Tom-ay-to, tom-aaaah-to."

  [ "$status" -eq 0 ]
  [ "$output" = "Whatever." ]
}

@test "Test shouting" {
  run bash bob.sh 'WATCH OUT!'

  [ "$status" -eq 0 ]
  [ "$output" = 'Whoa, chill out!' ]
}

@test "Test asking a question" {
  run bash bob.sh "Does this cryogenic chamber make me look fat?"

  [ "$status" -eq 0 ]
  [ "$output" = "Sure." ]
}

@test "Test asking a numeric question" {
  run bash bob.sh 'You are, what, like 15?'

  [ "$status" -eq 0 ]
  [ "$output" = "Sure." ]
}

@test "Test talking forcefully" {
  run bash bob.sh "Let's go make out behind the gym!"

  [ "$status" -eq 0 ]
  [ "$output" = "Whatever." ]
}

@test "Test using accronyms in regular speech" {
  run bash bob.sh "It's OK if you don't want to go to the DMV."

  [ "$status" -eq 0 ]
  [ "$output" = "Whatever." ]
}

@test "Test forceful question" {
  run bash bob.sh "WHAT THE HELL WERE YOU THINKING?"

  [ "$status" -eq 0 ]
  [ "$output" = "Whoa, chill out!" ]
}

@test "Test shouting numbers" {
  run bash bob.sh "1, 2, 3 GO!"

  [ "$status" -eq 0 ]
  [ "$output" = "Whoa, chill out!" ]
}

@test "Test shouting numbers" {
  run bash bob.sh "1, 2, 3"

  [ "$status" -eq 0 ]
  [ "$output" = "Whatever." ]
}

@test "Test question with only numbers" {
  run bash bob.sh '4?'

  [ "$status" -eq 0 ]
  [ "$output" = "Sure." ]
}

@test "Test shouting with special characters" {
  run bash bob.sh 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'

  [ "$status" -eq 0 ]
  [ "$output" = "Whoa, chill out!" ]
}

@test "Test shouting with umlauts" {
  run bash bob.sh 'ÜMLÄÜTS!'

  [ "$status" -eq 0 ]
  [ "$output" = "Whoa, chill out!" ]
}

@test "Test calmly speaking with umlauts" {
  run bash bob.sh 'ÜMLäÜTS!'

  [ "$status" -eq 0 ]
  [ "$output" = "Whatever." ]
}

@test "Test shouting with no exclamation mark" {
  run bash bob.sh 'I HATE YOU'

  [ "$status" -eq 0 ]
  [ "$output" = "Whoa, chill out!" ]
}

@test "Test statement containing question mark" {
  run bash bob.sh 'Ending with ? means a question.'

  [ "$status" -eq 0 ]
  [ "$output" = "Whatever." ]
}

@test "Test prattling on" {
  run bash bob.sh 'Wait! Hang on. Are you going to be OK?'

  [ "$status" -eq 0 ]
  [ "$output" = "Sure." ]
}

@test "Test silence" {
  run bash bob.sh ''

  [ "$status" -eq 0 ]
  [ "$output" = "Fine. Be that way!" ]
}

@test "Test silence" {
  run bash bob.sh

  [ "$status" -eq 0 ]
  [ "$output" = "Fine. Be that way!" ]
}

@test "Test prolonged silence" {
  run bash bob.sh "     "

  [ "$status" -eq 0 ]
  [ "$output" = "Fine. Be that way!" ]
}

@test "Test start with whitespace" {
  run bash bob.sh '         hmmmmmmm...'

  [ "$status" -eq 0 ]
  [ "$output" = "Whatever." ]
}

@test "Test question ends with whitespace" {
  run bash bob.sh 'What if we end with whitespace?   '

  [ "$status" -eq 0 ]
  [ "$output" = "Sure." ]
}

@test "Test statement ends with whitespace" {
  run bash bob.sh 'This is a statement with trailing whitespace   '

  [ "$status" -eq 0 ]
  [ "$output" = "Whatever." ]
}

# missing shouting with whitespace?
