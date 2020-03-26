#!/usr/bin/env bash

# local version: 1.1.1.0

# Translate input RNA sequences into proteins

@test "Methionine RNA sequence" {       
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUG"
    (( status == 0 ))
    [[ $output == "Methionine" ]]
}

@test "Phenylalanine RNA sequence 1" {  
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUU"
    (( status == 0 ))
    [[ $output == "Phenylalanine" ]]
}

@test "Phenylalanine RNA sequence 2" {  
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUC"
    (( status == 0 ))
    [[ $output == "Phenylalanine" ]]
}

@test "Leucine RNA sequence 1" {        
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUA"
    (( status == 0 ))
    [[ $output == "Leucine" ]]
}

@test "Leucine RNA sequence 2" {        
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UUG"
    (( status == 0 ))
    [[ $output == "Leucine" ]]
}

@test "Serine RNA sequence 1" { 
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCU"
    (( status == 0 ))
    [[ $output == "Serine" ]]
}

@test "Serine RNA sequence 2" { 
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCC"
    (( status == 0 ))
    [[ $output == "Serine" ]]
}

@test "Serine RNA sequence 3" { 
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCA"
    (( status == 0 ))
    [[ $output == "Serine" ]]
}

@test "Serine RNA sequence 4" { 
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UCG"
    (( status == 0 ))
    [[ $output == "Serine" ]]
}

@test "Tyrosine RNA sequence 1" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAU"
    (( status == 0 ))
    [[ $output == "Tyrosine" ]]
}

@test "Tyrosine RNA sequence 2" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAC"
    (( status == 0 ))
    [[ $output == "Tyrosine" ]]
}

@test "Cysteine RNA sequence 1" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGU"
    (( status == 0 ))
    [[ $output == "Cysteine" ]]
}

@test "Cysteine RNA sequence 2" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGC"
    (( status == 0 ))
    [[ $output == "Cysteine" ]]
}

@test "Tryptophan RNA sequence" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGG"
    (( status == 0 ))
    [[ $output == "Tryptophan" ]]
}

@test "STOP codon RNA sequence 1" {     
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAA"
    (( status == 0 ))
    [[ $output == "" ]]
}

@test "STOP codon RNA sequence 2" {     
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAG"
    (( status == 0 ))
    [[ $output == "" ]]
}

@test "STOP codon RNA sequence 3" {     
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGA"
    (( status == 0 ))
    [[ $output == "" ]]
}

@test "Translate RNA strand into correct protein list" {        
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGUUUUGG"
    (( status == 0 ))
    [[ $output == "Methionine Phenylalanine Tryptophan" ]]
}

@test "Translation stops if STOP codon at beginning of sequence" {      
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UAGUGG"
    (( status == 0 ))
    [[ $output == "" ]]
}

@test "Translation stops if STOP codon at end of two-codon sequence" {  
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUAG"
    (( status == 0 ))
    [[ $output == "Tryptophan" ]]
}

@test "Translation stops if STOP codon at end of three-codon sequence" {        
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "AUGUUUUAA"
    (( status == 0 ))
    [[ $output == "Methionine Phenylalanine" ]]
}

@test "Translation stops if STOP codon in middle of three-codon sequence" {     
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUAGUGG"
    (( status == 0 ))
    [[ $output == "Tryptophan" ]]
}

@test "Translation stops if STOP codon in middle of six-codon sequence" {       
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGGUGUUAUUAAUGGUUU"
    (( status == 0 ))
    [[ $output == "Tryptophan Cysteine Tyrosine" ]]
}

@test "Error case" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash protein_translation.sh "UGG---AUG"
    (( status == 1 ))
    [[ $output == "Invalid codon" ]]
}
