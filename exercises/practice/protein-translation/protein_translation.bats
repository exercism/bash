#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_empty_rna_sequence_results_in_no_proteins() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh ""
    assert_success
    assert_output ""
}

test_methionine_rna_sequence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUG"
    assert_success
    assert_output "Methionine"
}

test_phenylalanine_rna_sequence_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUU"
    assert_success
    assert_output "Phenylalanine"
}

test_phenylalanine_rna_sequence_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUC"
    assert_success
    assert_output "Phenylalanine"
}

test_leucine_rna_sequence_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUA"
    assert_success
    assert_output "Leucine"
}

test_leucine_rna_sequence_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUG"
    assert_success
    assert_output "Leucine"
}

test_serine_rna_sequence_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCU"
    assert_success
    assert_output "Serine"
}

test_serine_rna_sequence_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCC"
    assert_success
    assert_output "Serine"
}

test_serine_rna_sequence_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCA"
    assert_success
    assert_output "Serine"
}

test_serine_rna_sequence_4() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCG"
    assert_success
    assert_output "Serine"
}

test_tyrosine_rna_sequence_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAU"
    assert_success
    assert_output "Tyrosine"
}

test_tyrosine_rna_sequence_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAC"
    assert_success
    assert_output "Tyrosine"
}

test_cysteine_rna_sequence_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGU"
    assert_success
    assert_output "Cysteine"
}

test_cysteine_rna_sequence_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGC"
    assert_success
    assert_output "Cysteine"
}

test_tryptophan_rna_sequence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGG"
    assert_success
    assert_output "Tryptophan"
}

test_stop_codon_rna_sequence_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAA"
    assert_success
    assert_output ""
}

test_stop_codon_rna_sequence_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAG"
    assert_success
    assert_output ""
}

test_stop_codon_rna_sequence_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGA"
    assert_success
    assert_output ""
}

test_sequence_of_two_protein_codons_translates_into_proteins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUUUUU"
    assert_success
    assert_output "Phenylalanine Phenylalanine"
}

test_sequence_of_two_different_protein_codons_translates_into_proteins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUAUUG"
    assert_success
    assert_output "Leucine Leucine"
}

test_translate_rna_strand_into_correct_protein_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGUUUUGG"
    assert_success
    assert_output "Methionine Phenylalanine Tryptophan"
}

test_translation_stops_if_stop_codon_at_beginning_of_sequence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAGUGG"
    assert_success
    assert_output ""
}

test_translation_stops_if_stop_codon_at_end_of_two_codon_sequence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUAG"
    assert_success
    assert_output "Tryptophan"
}

test_translation_stops_if_stop_codon_at_end_of_three_codon_sequence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGUUUUAA"
    assert_success
    assert_output "Methionine Phenylalanine"
}

test_translation_stops_if_stop_codon_in_middle_of_three_codon_sequence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUAGUGG"
    assert_success
    assert_output "Tryptophan"
}

test_translation_stops_if_stop_codon_in_middle_of_six_codon_sequence() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUGUUAUUAAUGGUUU"
    assert_success
    assert_output "Tryptophan Cysteine Tyrosine"
}

test_sequence_of_two_non_stop_codons_does_not_translate_to_a_stop_codon() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGAUG"
    assert_success
    assert_output "Methionine Methionine"
}

test_non_existing_codon_can_t_translate() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AAA"
    assert_failure
    assert_output "Invalid codon"
}

test_unknown_amino_acids_not_part_of_a_codon_can_t_translate() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "XYZ"
    assert_failure
    assert_output "Invalid codon"
}

test_incomplete_rna_sequence_can_t_translate() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGU"
    assert_failure
    assert_output "Invalid codon"
}

test_incomplete_rna_sequence_can_translate_if_valid_until_a_stop_codon() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUCUUCUAAUGGU"
    assert_success
    assert_output "Phenylalanine Phenylalanine"
}
