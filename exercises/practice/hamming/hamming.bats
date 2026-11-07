#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:26:10+00:00

test_empty_strands() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh '' ''
    assert_success
    assert_output "0"
}

test_single_letter_identical_strands() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'A' 'A'
    assert_success
    assert_output "0"
}

test_single_letter_different_strands() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'G' 'T'
    assert_success
    assert_output "1"
}

test_long_identical_strands() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'GGACTGAAATCTG' 'GGACTGAAATCTG'
    assert_success
    assert_output "0"
}

test_long_different_strands() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'GGACGGATTCTG' 'AGGACGGATTCT'
    assert_success
    assert_output "9"
}

test_disallow_first_strand_longer() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'AATG' 'AAA'
    assert_failure
    assert_output --partial "strands must be of equal length"
}

test_disallow_second_strand_longer() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'ATA' 'AGTG'
    assert_failure
    assert_output --partial "strands must be of equal length"
}

test_disallow_empty_first_strand() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh '' 'G'
    assert_failure
    assert_output --partial "strands must be of equal length"
}

test_disallow_empty_second_strand() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'G' ''
    assert_failure
    assert_output --partial "strands must be of equal length"
}

test_no_input() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh
    assert_failure
    assert_output "Usage: hamming.sh <string1> <string2>"
}

test_invalid_input() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'A'
    assert_failure
    assert_output "Usage: hamming.sh <string1> <string2>"
}

# Within [[...]] the == operator is a _pattern matching_ operator.
# To test for string equality, the right-hand side must be
# quoted to prevent interpretation as a glob-style pattern.

test_expose_subtle_pattern_bug() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash hamming.sh 'AAA' 'A?A'
    assert_success
    assert_output "1"
}
