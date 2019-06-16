#!/usr/bin/env bash

# Translate input RNA sequences into proteins

@test "Methionine RNA sequence" {       
    #skip
    run bash protein_translation.sh "AUG"
    [[ $status -eq 0 ]]
    [[ $output == "Methionine" ]]
}

@test "Phenylalanine RNA sequence 1" {  
    skip
    run bash protein_translation.sh "UUU"
    [[ $status -eq 0 ]]
    [[ $output == "Phenylalanine" ]]
}

@test "Phenylalanine RNA sequence 2" {  
    skip
    run bash protein_translation.sh "UUC"
    [[ $status -eq 0 ]]
    [[ $output == "Phenylalanine" ]]
}

@test "Leucine RNA sequence 1" {        
    skip
    run bash protein_translation.sh "UUA"
    [[ $status -eq 0 ]]
    [[ $output == "Leucine" ]]
}

@test "Leucine RNA sequence 2" {        
    skip
    run bash protein_translation.sh "UUG"
    [[ $status -eq 0 ]]
    [[ $output == "Leucine" ]]
}

@test "Serine RNA sequence 1" { 
    skip
    run bash protein_translation.sh "UCU"
    [[ $status -eq 0 ]]
    [[ $output == "Serine" ]]
}

@test "Serine RNA sequence 2" { 
    skip
    run bash protein_translation.sh "UCC"
    [[ $status -eq 0 ]]
    [[ $output == "Serine" ]]
}

@test "Serine RNA sequence 3" { 
    skip
    run bash protein_translation.sh "UCA"
    [[ $status -eq 0 ]]
    [[ $output == "Serine" ]]
}

@test "Serine RNA sequence 4" { 
    skip
    run bash protein_translation.sh "UCG"
    [[ $status -eq 0 ]]
    [[ $output == "Serine" ]]
}

@test "Tyrosine RNA sequence 1" {       
    skip
    run bash protein_translation.sh "UAU"
    [[ $status -eq 0 ]]
    [[ $output == "Tyrosine" ]]
}

@test "Tyrosine RNA sequence 2" {       
    skip
    run bash protein_translation.sh "UAC"
    [[ $status -eq 0 ]]
    [[ $output == "Tyrosine" ]]
}

@test "Cysteine RNA sequence 1" {       
    skip
    run bash protein_translation.sh "UGU"
    [[ $status -eq 0 ]]
    [[ $output == "Cysteine" ]]
}

@test "Cysteine RNA sequence 2" {       
    skip
    run bash protein_translation.sh "UGC"
    [[ $status -eq 0 ]]
    [[ $output == "Cysteine" ]]
}

@test "Tryptophan RNA sequence" {       
    skip
    run bash protein_translation.sh "UGG"
    [[ $status -eq 0 ]]
    [[ $output == "Tryptophan" ]]
}

@test "STOP codon RNA sequence 1" {     
    skip
    run bash protein_translation.sh "UAA"
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "STOP codon RNA sequence 2" {     
    skip
    run bash protein_translation.sh "UAG"
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "STOP codon RNA sequence 3" {     
    skip
    run bash protein_translation.sh "UGA"
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "Translate RNA strand into correct protein list" {        
    skip
    run bash protein_translation.sh "AUGUUUUGG"
    [[ $status -eq 0 ]]
    [[ $output == "Methionine Phenylalanine Tryptophan" ]]
}

@test "Translation stops if STOP codon at beginning of sequence" {      
    skip
    run bash protein_translation.sh "UAGUGG"
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "Translation stops if STOP codon at end of two-codon sequence" {  
    skip
    run bash protein_translation.sh "UGGUAG"
    [[ $status -eq 0 ]]
    [[ $output == "Tryptophan" ]]
}

@test "Translation stops if STOP codon at end of three-codon sequence" {        
    skip
    run bash protein_translation.sh "AUGUUUUAA"
    [[ $status -eq 0 ]]
    [[ $output == "Methionine Phenylalanine" ]]
}

@test "Translation stops if STOP codon in middle of three-codon sequence" {     
    skip
    run bash protein_translation.sh "UGGUAGUGG"
    [[ $status -eq 0 ]]
    [[ $output == "Tryptophan" ]]
}

@test "Translation stops if STOP codon in middle of six-codon sequence" {       
    skip
    run bash protein_translation.sh "UGGUGUUAUUAAUGGUUU"
    [[ $status -eq 0 ]]
    [[ $output == "Tryptophan Cysteine Tyrosine" ]]
}

@test "Error case" {
    skip
    run bash protein_translation.sh "UGG---AUG"
    [[ $status -eq 1 ]]
    [[ $output == "Invalid codon" ]]
}
