#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_root_of_1() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "1"
    assert_success
    assert_output "1"
}

test_root_of_4() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "4"
    assert_success
    assert_output "2"
}

test_root_of_25() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "25"
    assert_success
    assert_output "5"
}

test_root_of_81() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "81"
    assert_success
    assert_output "9"
}

test_root_of_196() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "196"
    assert_success
    assert_output "14"
}

test_root_of_65025() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash square_root.sh "65025"
    assert_success
    assert_output "255"
}
