#!/usr/bin/env bats
load bats-extra

# generated on 2026-08-14T05:27:25+00:00

@test "Say Hi!" {
    run bash hello_world.sh

    # the program's exit status should be success (0)
    assert_success

    # program's output should be the expected text
    assert_output "Hello, World!"
}

