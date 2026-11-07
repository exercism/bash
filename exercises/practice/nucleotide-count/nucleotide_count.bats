#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_empty_strand() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nucleotide_count.sh ""
    assert_success
    assert_output $'A: 0\nC: 0\nG: 0\nT: 0'
}

test_can_count_one_nucleotide_in_single_character_input() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nucleotide_count.sh "G"
    assert_success
    assert_output $'A: 0\nC: 0\nG: 1\nT: 0'
}

test_strand_with_repeated_nucleotide() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nucleotide_count.sh "GGGGGGG"
    assert_success
    assert_output $'A: 0\nC: 0\nG: 7\nT: 0'
}

test_strand_with_multiple_nucleotides() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nucleotide_count.sh "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
    assert_success
    assert_output $'A: 20\nC: 12\nG: 17\nT: 21'
}

test_strand_with_invalid_nucleotides() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash nucleotide_count.sh "AGXXACT"
    assert_failure
    assert_output "Invalid nucleotide in strand"
}
