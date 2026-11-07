#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T22:08:03+00:00

test_say_hi() { # @test
    run bash hello_world.sh

    # the program's exit status should be success (0)
    assert_success

    # program's output should be the expected text
    assert_output "Hello, World!"
}
