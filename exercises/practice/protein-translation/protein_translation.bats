#!/usr/bin/env bats
load bats-extra

# Translate input RNA sequences into proteins
@test "Empty RNA sequence results in no proteins" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh ""
    assert_success
    assert_output ""
}

@test "Methionine RNA sequence" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUG"
    assert_success
    assert_output "Methionine"
}

@test "Phenylalanine RNA sequence 1" {  
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUU"
    assert_success
    assert_output "Phenylalanine"
}

@test "Phenylalanine RNA sequence 2" {  
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUC"
    assert_success
    assert_output "Phenylalanine"
}

@test "Leucine RNA sequence 1" {        
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUA"
    assert_success
    assert_output "Leucine"
}

@test "Leucine RNA sequence 2" {        
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUG"
    assert_success
    assert_output "Leucine"
}

@test "Serine RNA sequence 1" { 
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCU"
    assert_success
    assert_output "Serine"
}

@test "Serine RNA sequence 2" { 
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCC"
    assert_success
    assert_output "Serine"
}

@test "Serine RNA sequence 3" { 
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCA"
    assert_success
    assert_output "Serine"
}

@test "Serine RNA sequence 4" { 
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCG"
    assert_success
    assert_output "Serine"
}

@test "Tyrosine RNA sequence 1" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAU"
    assert_success
    assert_output "Tyrosine"
}

@test "Tyrosine RNA sequence 2" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAC"
    assert_success
    assert_output "Tyrosine"
}

@test "Cysteine RNA sequence 1" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGU"
    assert_success
    assert_output "Cysteine"
}

@test "Cysteine RNA sequence 2" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGC"
    assert_success
    assert_output "Cysteine"
}

@test "Tryptophan RNA sequence" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGG"
    assert_success
    assert_output "Tryptophan"
}

@test "STOP codon RNA sequence 1" {     
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAA"
    assert_success
    assert_output ""
}

@test "STOP codon RNA sequence 2" {     
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAG"
    assert_success
    assert_output ""
}

@test "STOP codon RNA sequence 3" {     
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGA"
    assert_success
    assert_output ""
}

@test "Sequence of two protein codons translates into proteins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUUUUU"
    assert_success
    assert_output "Phenylalanine Phenylalanine"
}

@test "Sequence of two different protein codons translates into proteins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUAUUG"
    assert_success
    assert_output "Leucine Leucine"
}

@test "Translate RNA strand into correct protein list" {        
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGUUUUGG"
    assert_success
    assert_output "Methionine Phenylalanine Tryptophan"
}

@test "Translation stops if STOP codon at beginning of sequence" {      
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAGUGG"
    assert_success
    assert_output ""
}

@test "Translation stops if STOP codon at end of two-codon sequence" {  
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUAG"
    assert_success
    assert_output "Tryptophan"
}

@test "Translation stops if STOP codon at end of three-codon sequence" {        
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGUUUUAA"
    assert_success
    assert_output "Methionine Phenylalanine"
}

@test "Translation stops if STOP codon in middle of three-codon sequence" {     
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUAGUGG"
    assert_success
    assert_output "Tryptophan"
}

@test "Translation stops if STOP codon in middle of six-codon sequence" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUGUUAUUAAUGGUUU"
    assert_success
    assert_output "Tryptophan Cysteine Tyrosine"
}

@test "Sequence of two non-STOP codons does not translate to a STOP codon" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGAUG"
    assert_success
    assert_output "Methionine Methionine"
}

@test "Error case" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGG---AUG"
    assert_failure
    assert_output "Invalid codon"
}

@test "Non-existing codon can't translate" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AAA"
    assert_failure
    assert_output "Invalid codon"
}

@test "Unknown amino acids, not part of a codon, can't translate" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "XYZ"
    assert_failure
    assert_output "Invalid codon"
}

@test "Incomplete RNA sequence can't translate" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGU"
    assert_failure
    assert_output "Invalid codon"
}

@test "Incomplete RNA sequence can translate if valid until a STOP codon" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUCUUCUAAUGGU"
    assert_success
    assert_output "Phenylalanine Phenylalanine"
}
