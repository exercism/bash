@test "When given no name, it should greet the world!" {
  run ./hello_world.sh

  [ "$status" -eq 0 ]
  [ "$output" = "Hello, World!" ]
}

@test 'When given "Alice" it should greet Alice!' {
  run ./hello_world.sh Alice

  [ "$status" -eq 0 ]
  [ "$output" = "Hello, Alice!" ]
}

@test 'When given "Bob" it should greet Bob!' {
  run ./hello_world.sh Bob

  [ "$status" -eq 0 ]
  [ "$output" = "Hello, Bob!" ]
}

@test 'When given an empty string it should have a space and punctuation, though admittedly this is strange.' {
  run ./hello_world.sh ""

  [ "$status" -eq 0 ]
  [ "$output" = "Hello, !" ]
}

@test 'When given "Alice and Bob" it greets them both' {
  run ./hello_world.sh Alice and Bob

  [ "$status" -eq 0 ]
  [ "$output" = "Hello, Alice and Bob!" ]
}

