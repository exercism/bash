#!/usr/bin/env bats

@test "When given no name, it should have one for you!" {
  run bash two_fer.sh

  [ "$status" -eq 0 ]
  [ "$output" = "One for you, one for me." ]
}

@test 'When given "Alice" it should have one for Alice!' {
  run bash two_fer.sh Alice

  [ "$status" -eq 0 ]
  [ "$output" = "One for Alice, one for me." ]
}

@test 'When given "Bob" it should have one for Bob!' {
  run bash two_fer.sh Bob

  [ "$status" -eq 0 ]
  [ "$output" = "One for Bob, one for me." ]
}

