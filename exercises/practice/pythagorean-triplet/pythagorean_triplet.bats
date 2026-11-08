#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:25:39+00:00

test_triplets_whose_sum_is_12() { # @test
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

test_triplets_whose_sum_is_108() { # @test
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

test_triplets_whose_sum_is_1000() { # @test
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

test_no_matching_triplets_for_1001() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash pythagorean_triplet.sh 1001
    assert_success
    actual=$( sort -t, -n -k1,1 <<< "$output" )
    expected=$(cat <<'END_EXPECTED'

END_EXPECTED
)
    assert_equal "$actual" "$expected"
}

test_returns_all_matching_triplets() { # @test
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

test_several_matching_triplets() { # @test
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

test_triplets_for_large_number() { # @test
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
