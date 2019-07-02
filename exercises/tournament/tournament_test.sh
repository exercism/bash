#!/usr/bin/env bash

# Your bash program should be able to accept input
# 1. via standard input, OR
# 2. as a filename given on the cmd line.

# uses external tool: mktemp

setup()    { export INPUT_FILE=$( mktemp ); }
teardown() { rm -f "$INPUT_FILE"; }

@test "just the header if no input" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "a win is three points, a loss is zero points" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    cat <<INPUT >"$INPUT_FILE"
Allegoric Alaskans;Blithering Badgers;win
INPUT

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
Blithering Badgers             |  1 |  0 |  0 |  1 |  0
EXPECTED
)

    run bash tournament.sh "$INPUT_FILE"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "a win can also be expressed as a loss" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
Blithering Badgers;Allegoric Alaskans;loss
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
Blithering Badgers             |  1 |  0 |  0 |  1 |  0
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "a different team can win" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
Blithering Badgers;Allegoric Alaskans;win
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Blithering Badgers             |  1 |  1 |  0 |  0 |  3
Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "a draw is one point each" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
Allegoric Alaskans;Blithering Badgers;draw
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1
Blithering Badgers             |  1 |  0 |  1 |  0 |  1
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "There can be more than one match" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
Allegoric Alaskans;Blithering Badgers;win
Allegoric Alaskans;Blithering Badgers;win
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
Blithering Badgers             |  2 |  0 |  0 |  2 |  0
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "There can be more than one winner" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
Allegoric Alaskans;Blithering Badgers;loss
Allegoric Alaskans;Blithering Badgers;win
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3
Blithering Badgers             |  2 |  1 |  0 |  1 |  3
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "There can be more than two teams" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
Allegoric Alaskans;Blithering Badgers;win
Blithering Badgers;Courageous Californians;win
Courageous Californians;Allegoric Alaskans;loss
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
Blithering Badgers             |  2 |  1 |  0 |  1 |  3
Courageous Californians        |  2 |  0 |  0 |  2 |  0
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "typical input" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
Allegoric Alaskans;Blithering Badgers;win
Devastating Donkeys;Courageous Californians;draw
Devastating Donkeys;Allegoric Alaskans;win
Courageous Californians;Blithering Badgers;loss
Blithering Badgers;Devastating Donkeys;loss
Allegoric Alaskans;Courageous Californians;win
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
Blithering Badgers             |  3 |  1 |  0 |  2 |  3
Courageous Californians        |  3 |  0 |  1 |  2 |  1
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "incomplete competition (not all pairs have played)" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    cat <<INPUT > "$INPUT_FILE"
Allegoric Alaskans;Blithering Badgers;loss
Devastating Donkeys;Allegoric Alaskans;loss
Courageous Californians;Blithering Badgers;draw
Allegoric Alaskans;Courageous Californians;win
INPUT

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
Blithering Badgers             |  2 |  1 |  1 |  0 |  4
Courageous Californians        |  2 |  0 |  1 |  1 |  1
Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
EXPECTED
)

    run bash tournament.sh "$INPUT_FILE"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "ties broken alphabetically" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip

    input=$( cat <<INPUT
Courageous Californians;Devastating Donkeys;win
Allegoric Alaskans;Blithering Badgers;win
Devastating Donkeys;Allegoric Alaskans;loss
Courageous Californians;Blithering Badgers;win
Blithering Badgers;Devastating Donkeys;draw
Allegoric Alaskans;Courageous Californians;draw
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7
Courageous Californians        |  3 |  2 |  1 |  0 |  7
Blithering Badgers             |  3 |  0 |  1 |  2 |  1
Devastating Donkeys            |  3 |  0 |  1 |  2 |  1
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}
