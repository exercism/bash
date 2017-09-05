#!/usr/bin/env bats

@test "empty strand" {
	run ./nucleotide_count.sh ""

	[ "$status" -eq 0 ]
	[ "$output" = $'A: 0\nC: 0\nG: 0\nT: 0' ]
}

@test "strand with repeated nucleotide" {
	run ./nucleotide_count.sh "GGGGGGG"

	[ "$status" -eq 0 ]
	[ "$output" = $'A: 0\nC: 0\nG: 7\nT: 0' ]
}

@test "strand with multiple nucleotides" {
	run ./nucleotide_count.sh "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

	[ "$status" -eq 0 ]
	[ "$output" = $'A: 20\nC: 12\nG: 17\nT: 21' ]
}

@test "strand with invalid nucleotides" {
	run ./nucleotide_count.sh "AGXXACT"

	[ "$status" -eq 1 ]
	[ "$output" = "Invalid nucleotide in strand" ]
}
