#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T18:47:35+00:00

@test "zero rows" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
END
)
    run bash pascals_triangle.sh 0
    assert_success
    assert_output "$expected"
}

@test "single row" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
1
END
)
    run bash pascals_triangle.sh 1
    assert_success
    assert_output "$expected"
}

@test "two rows" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
 1
1 1
END
)
    run bash pascals_triangle.sh 2
    assert_success
    assert_output "$expected"
}

@test "three rows" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
  1
 1 1
1 2 1
END
)
    run bash pascals_triangle.sh 3
    assert_success
    assert_output "$expected"
}

@test "four rows" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
   1
  1 1
 1 2 1
1 3 3 1
END
)
    run bash pascals_triangle.sh 4
    assert_success
    assert_output "$expected"
}

@test "five rows" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
END
)
    run bash pascals_triangle.sh 5
    assert_success
    assert_output "$expected"
}

@test "six rows" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
     1
    1 1
   1 2 1
  1 3 3 1
 1 4 6 4 1
1 5 10 10 5 1
END
)
    run bash pascals_triangle.sh 6
    assert_success
    assert_output "$expected"
}

@test "ten rows" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
         1
        1 1
       1 2 1
      1 3 3 1
     1 4 6 4 1
    1 5 10 10 5 1
   1 6 15 20 15 6 1
  1 7 21 35 35 21 7 1
 1 8 28 56 70 56 28 8 1
1 9 36 84 126 126 84 36 9 1
END
)
    run bash pascals_triangle.sh 10
    assert_success
    assert_output "$expected"
}
