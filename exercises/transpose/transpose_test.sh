#!/usr/bin/env bash

# local version: 1.1.0.0

# Note: using ANSI-C Quoting here
# see https://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting

@test "empty string" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    input=""
    expected=""
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "two characters in a row" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input="A1"
    expected=$'A\n1'
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "two characters in a column" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input=$'A\n1'
    expected="A1"
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "simple" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input=$'ABC\n123'
    expected=$'A1\nB2\nC3'
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "single line" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input="Single line."
    expected=$'S\ni\nn\ng\nl\ne\n \nl\ni\nn\ne\n.'
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "first line longer than second line" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input=$( cat <<END
The fourth line.
The fifth line.
END
)
    expected=$( cat <<END
TT
hh
ee
  
ff
oi
uf
rt
th
h 
 l
li
in
ne
e.
.
END
)
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "second line longer than first line" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input=$( cat <<END
The first line.
The second line.
END
)
    expected=$( cat <<END
TT
hh
ee
  
fs
ie
rc
so
tn
 d
l 
il
ni
en
.e
 .
END
)
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "mixed line length" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input=$( cat << END
The longest line.
A long line.
A longer line.
A line.
END
)
    expected=$( cat <<END
TAAA
h   
elll
 ooi
lnnn
ogge
n e.
glr
ei 
snl
tei
 .n
l e
i .
n
e
.
END
)
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "square" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input=$'HEART\nEMBER\nABUSE\nRESIN\nTREND'
    expected=$'HEART\nEMBER\nABUSE\nRESIN\nTREND'
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "rectangle" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input=$'FRACTURE\nOUTLINED\nBLOOMING\nSEPTETTE'
    expected=$'FOBS\nRULE\nATOP\nCLOT\nTIME\nUNIT\nRENT\nEDGE'
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "triangle" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    input=$'T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR'
    expected=$'TEASER\n EASER\n  ASER\n   SER\n    ER\n     R'
    run bash transpose.sh <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}
