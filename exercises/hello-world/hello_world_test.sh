#!/usr/bin/env bash

# local version: 1.1.0.0

@test "Say Hi!" {
  run bash hello_world.sh

  (( status == 0 ))
  [[ $output = "Hello, World!" ]]
}
