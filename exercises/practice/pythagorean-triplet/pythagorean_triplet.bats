#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T06:52:43+00:00
# local version: 2.0.0.0

@test "triplets whose sum is 12" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pythagorean_triplet.sh 12
    assert_success
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$(cat <<'END_EXPECTED'
3,4,5
END_EXPECTED
)
    assert_equal "$actual" "$expected"
}

@test "triplets whose sum is 108" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pythagorean_triplet.sh 108
    assert_success
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$(cat <<'END_EXPECTED'
27,36,45
END_EXPECTED
)
    assert_equal "$actual" "$expected"
}

@test "triplets whose sum is 1000" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pythagorean_triplet.sh 1000
    assert_success
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$(cat <<'END_EXPECTED'
200,375,425
END_EXPECTED
)
    assert_equal "$actual" "$expected"
}

@test "no matching triplets for 1001" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pythagorean_triplet.sh 1001
    assert_success
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$(cat <<'END_EXPECTED'

END_EXPECTED
)
    assert_equal "$actual" "$expected"
}

@test "returns all matching triplets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pythagorean_triplet.sh 90
    assert_success
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$(cat <<'END_EXPECTED'
9,40,41
15,36,39
END_EXPECTED
)
    assert_equal "$actual" "$expected"
}

@test "several matching triplets" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pythagorean_triplet.sh 840
    assert_success
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$(cat <<'END_EXPECTED'
40,399,401
56,390,394
105,360,375
120,350,370
140,336,364
168,315,357
210,280,350
240,252,348
END_EXPECTED
)
    assert_equal "$actual" "$expected"
}

@test "triplets for large number" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    # This test is very time-consuming for a brute force solution.
    # Remove the skip and run only for extra credit (or punishment).
    [[ $RUN_HARD_TEST == "true" ]] || skip
    run bash pythagorean_triplet.sh 30000
    assert_success
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$(cat <<'END_EXPECTED'
1200,14375,14425
1875,14000,14125
5000,12000,13000
6000,11250,12750
7500,10000,12500
END_EXPECTED
)
    assert_equal "$actual" "$expected"
}
