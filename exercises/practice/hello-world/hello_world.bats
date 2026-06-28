#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-28T21:39:37+00:00
# local version: 2.0.0.0

@test "Say Hi!" {
  run bash hello_world.sh

  # the program's exit status should be success (0)
  assert_success

  # program's output should be the expected text
  assert_output "Hello, World!"
}
