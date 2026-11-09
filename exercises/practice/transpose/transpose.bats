#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_empty_string() { # @test
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

test_two_characters_in_a_row() { # @test
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

test_two_characters_in_a_column() { # @test
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

test_simple() { # @test
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

test_single_line() { # @test
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

test_first_line_longer_than_second_line() { # @test
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

test_second_line_longer_than_first_line() { # @test
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

test_mixed_line_length() { # @test
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

test_square() { # @test
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

test_rectangle() { # @test
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

test_triangle() { # @test
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

test_jagged_triangle() { # @test
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
