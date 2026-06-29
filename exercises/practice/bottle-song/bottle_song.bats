#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test 'first generic verse' {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="\
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall."
    run bash bottle_song.sh 10 1
    assert_success
    assert_output "$expected"
}

@test 'last generic verse' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="\
Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall."
    run bash bottle_song.sh 3 1
    assert_success
    assert_output "$expected"
}

@test 'verse with 2 bottles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="\
Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall."
    run bash bottle_song.sh 2 1
    assert_success
    assert_output "$expected"
}

@test 'verse with 1 bottle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="\
One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall."
    run bash bottle_song.sh 1 1
    assert_success
    assert_output "$expected"
}

@test 'first two verses' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="\
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall.

Nine green bottles hanging on the wall,
Nine green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be eight green bottles hanging on the wall."
    run bash bottle_song.sh 10 2
    assert_success
    assert_output "$expected"
}

@test 'last three verses' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="\
Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall.

Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.

One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall."
    run bash bottle_song.sh 3 3
    assert_success
    assert_output "$expected"
}

@test 'all verses' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="\
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall.

Nine green bottles hanging on the wall,
Nine green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be eight green bottles hanging on the wall.

Eight green bottles hanging on the wall,
Eight green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be seven green bottles hanging on the wall.

Seven green bottles hanging on the wall,
Seven green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be six green bottles hanging on the wall.

Six green bottles hanging on the wall,
Six green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be five green bottles hanging on the wall.

Five green bottles hanging on the wall,
Five green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be four green bottles hanging on the wall.

Four green bottles hanging on the wall,
Four green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be three green bottles hanging on the wall.

Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall.

Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.

One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall."
    run bash bottle_song.sh 10 10
    assert_success
    assert_output "$expected"
}


# bash-specific tests: Input validation
@test 'no_arguments' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bottle_song.sh
    assert_failure
    assert_output --partial "2 arguments expected"
}

@test 'too_many_arguments' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bottle_song.sh 1 2 3
    assert_failure
    assert_output --partial "2 arguments expected"
}

@test 'too_many_verses' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash bottle_song.sh 1 2
    assert_failure
    assert_output --partial "cannot generate more verses than bottles"
}
