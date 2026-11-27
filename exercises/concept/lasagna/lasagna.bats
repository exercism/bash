#!/usr/bin/env bats
load bats-extra

# bats test_tags=task:1
test_expected_minutes_in_oven() { # @test
    run bash lasagna.sh 18 3

    assert_success
    assert_line --index 0 "Expected minutes in oven: 40"
}

# bats test_tags=task:2
test_remaining_minutes_in_oven() { # @test
    run bash lasagna.sh 18 3

    assert_success
    assert_line --index 1 "Remaining minutes in oven: 22"
}

# bats test_tags=task:2
test_remaining_minutes_in_oven_other_value() { # @test
    run bash lasagna.sh 30 3

    assert_success
    assert_line --index 1 "Remaining minutes in oven: 10"
}

# bats test_tags=task:2
test_remaining_minutes_defaults_to_zero_minutes_in_oven() { # @test
    run bash lasagna.sh

    assert_success
    assert_line --index 1 "Remaining minutes in oven: 40"
}

# bats test_tags=task:3
test_preparation_time() { # @test
    run bash lasagna.sh 18 3

    assert_success
    assert_line --index 2 "Preparation time in minutes: 6"
}

# bats test_tags=task:3
test_preparation_time_other_value() { # @test
    run bash lasagna.sh 18 5

    assert_success
    assert_line --index 2 "Preparation time in minutes: 10"
}

# bats test_tags=task:3
test_preparation_time_defaults_to_one_layer() { # @test
    run bash lasagna.sh 18

    assert_success
    assert_line --index 2 "Preparation time in minutes: 2"
}

# bats test_tags=task:4
test_total_time() { # @test
    run bash lasagna.sh 18 3

    assert_success
    assert_line --index 3 "Total time in minutes: 24"
}

# bats test_tags=task:4
test_total_time_with_defaults() { # @test
    run bash lasagna.sh

    assert_success
    assert_line --index 3 "Total time in minutes: 2"
}

# bats test_tags=task:4
test_exact_output() { # @test
    run bash lasagna.sh 10 2

    assert_success
    assert_output - <<'END'
Expected minutes in oven: 40
Remaining minutes in oven: 30
Preparation time in minutes: 4
Total time in minutes: 14
END
}
