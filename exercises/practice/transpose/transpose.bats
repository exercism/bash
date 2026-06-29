#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:25+00:00

@test "empty string" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END

END
)
    expected=$(cat <<END

END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "two characters in a row" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
A1
END
)
    expected=$(cat <<END
A
1
END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "two characters in a column" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
A
1
END
)
    expected=$(cat <<END
A1
END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "simple" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
ABC
123
END
)
    expected=$(cat <<END
A1
B2
C3
END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "single line" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
Single line.
END
)
    expected=$(cat <<END
S
i
n
g
l
e
 
l
i
n
e
.
END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "first line longer than second line" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
The fourth line.
The fifth line.
END
)
    expected=$(cat <<END
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
    assert_success
    assert_output "$expected"
}

@test "second line longer than first line" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
The first line.
The second line.
END
)
    expected=$(cat <<END
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
    assert_success
    assert_output "$expected"
}

@test "mixed line length" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
The longest line.
A long line.
A longer line.
A line.
END
)
    expected=$(cat <<END
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
    assert_success
    assert_output "$expected"
}

@test "square" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
HEART
EMBER
ABUSE
RESIN
TREND
END
)
    expected=$(cat <<END
HEART
EMBER
ABUSE
RESIN
TREND
END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "rectangle" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
FRACTURE
OUTLINED
BLOOMING
SEPTETTE
END
)
    expected=$(cat <<END
FOBS
RULE
ATOP
CLOT
TIME
UNIT
RENT
EDGE
END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "triangle" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
T
EE
AAA
SSSS
EEEEE
RRRRRR
END
)
    expected=$(cat <<END
TEASER
 EASER
  ASER
   SER
    ER
     R
END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "jagged triangle" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END
11
2
3333
444
555555
66666
END
)
    expected=$(cat <<END
123456
1 3456
  3456
  3 56
    56
    5
END
)
    run bash transpose.sh <<< "$input"
    assert_success
    assert_output "$expected"
}
