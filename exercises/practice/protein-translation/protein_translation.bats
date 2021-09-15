#!/usr/bin/env bats
load bats-extra

# local version: 1.1.1.0

# Translate input RNA sequences into proteins

@test "Methionine RNA sequence" {       
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
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

@test "Error case" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGG---AUG"
    assert_failure
    assert_output "Invalid codon"
}
