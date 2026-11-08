#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:58:21+00:00
# Your bash program should be able to accept input
# 1. via standard input, OR
# 2. as a filename given on the cmd line.

# uses external tool: mktemp

setup() {
    export INPUT_FILE HAS_TTY
    INPUT_FILE=$( mktemp )
    [[ -t 0 ]] && HAS_TTY=1 || HAS_TTY=0
}
teardown() { rm -f "$INPUT_FILE"; }

test_just_the_header_if_no_input() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    input=$( cat <<INPUT
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    assert_success
    assert_output "$expected"
}

test_a_win_is_three_points_a_loss_is_zero_points() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    input=$( cat <<INPUT
Allegoric Alaskans;Blithering Badgers;win
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
Blithering Badgers             |  1 |  0 |  0 |  1 |  0
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    assert_success
    assert_output "$expected"
}

test_with_a_file_ensure_points_sorted_numerically () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # ignore this test in CI
    (( HAS_TTY )) || skip

    cat << INPUT > "$INPUT_FILE"
Allegoric Alaskans;Blithering Badgers;win
INPUT

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
Blithering Badgers             |  1 |  0 |  0 |  1 |  0
EXPECTED
)

    run bash tournament.sh "$INPUT_FILE"
    assert_success
    assert_output "$expected"
}

test_a_win_can_also_be_expressed_as_a_loss() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

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
    assert_success
    assert_output "$expected"
}

test_a_different_team_can_win() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

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
    assert_success
    assert_output "$expected"
}

test_a_draw_is_one_point_each() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

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
    assert_success
    assert_output "$expected"
}

test_there_can_be_more_than_one_match() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

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
    assert_success
    assert_output "$expected"
}

test_there_can_be_more_than_one_winner() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

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
    assert_success
    assert_output "$expected"
}

test_there_can_be_more_than_two_teams() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

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
    assert_success
    assert_output "$expected"
}

test_typical_input() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

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
    assert_success
    assert_output "$expected"
}

test_incomplete_competition_not_all_pairs_have_played() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    input=$( cat <<INPUT
Allegoric Alaskans;Blithering Badgers;loss
Devastating Donkeys;Allegoric Alaskans;loss
Courageous Californians;Blithering Badgers;draw
Allegoric Alaskans;Courageous Californians;win
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
Blithering Badgers             |  2 |  1 |  1 |  0 |  4
Courageous Californians        |  2 |  0 |  1 |  1 |  1
Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    assert_success
    assert_output "$expected"
}

test_with_a_file_ensure_points_sorted_numerically () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    # ignore this test in CI
    (( HAS_TTY )) || skip

    cat << INPUT > "$INPUT_FILE"
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
    assert_success
    assert_output "$expected"
}

test_ties_broken_alphabetically() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

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
    assert_success
    assert_output "$expected"
}

test_ensure_points_sorted_numerically() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    input=$( cat <<INPUT
Devastating Donkeys;Blithering Badgers;win
Devastating Donkeys;Blithering Badgers;win
Devastating Donkeys;Blithering Badgers;win
Devastating Donkeys;Blithering Badgers;win
Blithering Badgers;Devastating Donkeys;win
INPUT
)

    expected=$( cat <<EXPECTED
Team                           | MP |  W |  D |  L |  P
Devastating Donkeys            |  5 |  4 |  0 |  1 | 12
Blithering Badgers             |  5 |  1 |  0 |  4 |  3
EXPECTED
)

    run bash tournament.sh  <<< "$input"
    assert_success
    assert_output "$expected"
}
