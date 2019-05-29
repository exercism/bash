#!/usr/bin/env bash

declare -A map=(
    [AUG]="Methionine"
    [UUU]="Phenylalanine" [UUC]="Phenylalanine"
    [UUA]="Leucine"       [UUG]="Leucine"
    [UCU]="Serine"        [UCC]="Serine"
    [UCA]="Serine"        [UCG]="Serine"
    [UAU]="Tyrosine"      [UAC]="Tyrosine"
    [UGU]="Cysteine"      [UGC]="Cysteine"
    [UGG]="Tryptophan"
    [UAA]="STOP"          [UAG]="STOP"        [UGA]="STOP"
)

proteins=()

codons=$1

while [[ -n $codons ]]; do
    codon=${codons:0:3}
    protein=${map[$codon]}
    if [[ -z $protein ]]; then
        echo "Invalid codon" >&2
        exit 1
    fi
    [[ $protein == STOP ]] && break
    proteins+=($protein)
    codons=${codons#???}
done

echo "${proteins[*]}"
