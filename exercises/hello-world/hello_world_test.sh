#!/usr/bin/env bats

@test "Say Hi!" {
  run bash hello_world.sh

  [ "$status" -eq 0 ]
  [ "$output" = "Hello, World!" ]
}
