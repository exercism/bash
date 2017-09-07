#!/usr/bin/env bats

@test 'Complement of cytosine is guanine' {
  run bash rna_transcription.sh C

  [ "$status" -eq 0 ]
  [ "$output" == 'G' ]
}

@test 'Complement of guanine is cytosine' {
  skip
  run bash rna_transcription.sh G
  
  [ "$status" -eq 0 ]
  [ "$output" == 'C' ]
}

@test 'Complement of thymine is adenine' {
  skip
  run bash rna_transcription.sh T

  [ "$status" -eq 0 ]
  [ "$output" == 'A' ]
}

@test 'Complement of adenine is uracil' {
  skip
  run bash rna_transcription.sh A

  [ "$status" -eq 0 ]
  [ "$output" == 'U' ]
}

@test 'Complement of long string' {
  skip
  run bash rna_transcription.sh ACGTGGTCTTAA

  [ "$status" -eq 0 ]
  [ "$output" == 'UGCACCAGAAUU' ]
}

@test 'Handles invalid character' {
  skip
  run bash rna_transcription.sh U

  [ "$status" -eq 1 ]
  [ "$output" == 'Invalid nucleotide detected.' ]
}

@test 'Handles completely invalid string' {
  skip
  run bash rna_transcription.sh XXXX

  [ "$status" -eq 1 ]
  [ "$output" == 'Invalid nucleotide detected.' ]
}

@test 'Handles partially invalid string' {
  skip
  run bash rna_transcription.sh ACGTXCTTAA

  [ "$status" -eq 1 ]
  [ "$output" == 'Invalid nucleotide detected.' ]
}
