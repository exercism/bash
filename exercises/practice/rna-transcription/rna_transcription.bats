#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_empty_rna_sequence() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh ""
    assert_success
    assert_output ""
}

test_rna_complement_of_cytosine_is_guanine() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh "C"
    assert_success
    assert_output "G"
}

test_rna_complement_of_guanine_is_cytosine() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh "G"
    assert_success
    assert_output "C"
}

test_rna_complement_of_thymine_is_adenine() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh "T"
    assert_success
    assert_output "A"
}

test_rna_complement_of_adenine_is_uracil() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh "A"
    assert_success
    assert_output "U"
}

test_rna_complement() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh "ACGTGGTCTTAA"
    assert_success
    assert_output "UGCACCAGAAUU"
}

test_handles_invalid_character () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh ACGTXCTTA
    assert_failure
    assert_output "Invalid nucleotide detected."
}

test_handles_completely_invalid_string () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh XXXX
    assert_failure
    assert_output "Invalid nucleotide detected."
}

test_handles_partially_invalid_string () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rna_transcription.sh ACGTXCTTAA
    assert_failure
    assert_output "Invalid nucleotide detected."
}
