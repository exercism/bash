#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_equilateral_triangle_all_sides_are_equal() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh equilateral 2 2 2
    assert_success
    assert_output "true"
}

test_equilateral_triangle_any_side_is_unequal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh equilateral 2 3 2
    assert_success
    assert_output "false"
}

test_equilateral_triangle_no_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh equilateral 5 4 6
    assert_success
    assert_output "false"
}

test_equilateral_triangle_all_zero_sides_is_not_a_triangle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh equilateral 0 0 0
    assert_success
    assert_output "false"
}

test_equilateral_triangle_sides_may_be_floats() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh equilateral 0.5 0.5 0.5
    assert_success
    assert_output "true"
}

test_isosceles_triangle_last_two_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 3 4 4
    assert_success
    assert_output "true"
}

test_isosceles_triangle_first_two_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 4 4 3
    assert_success
    assert_output "true"
}

test_isosceles_triangle_first_and_last_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 4 3 4
    assert_success
    assert_output "true"
}

test_isosceles_triangle_equilateral_triangles_are_also_isosceles() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 4 4 4
    assert_success
    assert_output "true"
}

test_isosceles_triangle_no_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 2 3 4
    assert_success
    assert_output "false"
}

test_isosceles_triangle_first_triangle_inequality_violation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 1 1 3
    assert_success
    assert_output "false"
}

test_isosceles_triangle_second_triangle_inequality_violation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 1 3 1
    assert_success
    assert_output "false"
}

test_isosceles_triangle_third_triangle_inequality_violation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 3 1 1
    assert_success
    assert_output "false"
}

test_isosceles_triangle_sides_may_be_floats() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh isosceles 0.5 0.4 0.5
    assert_success
    assert_output "true"
}

test_scalene_triangle_no_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh scalene 5 4 6
    assert_success
    assert_output "true"
}

test_scalene_triangle_all_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh scalene 4 4 4
    assert_success
    assert_output "false"
}

test_scalene_triangle_first_and_second_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh scalene 4 4 3
    assert_success
    assert_output "false"
}

test_scalene_triangle_first_and_third_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh scalene 3 4 3
    assert_success
    assert_output "false"
}

test_scalene_triangle_second_and_third_sides_are_equal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh scalene 4 3 3
    assert_success
    assert_output "false"
}

test_scalene_triangle_may_not_violate_triangle_inequality() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh scalene 7 3 2
    assert_success
    assert_output "false"
}

test_scalene_triangle_sides_may_be_floats() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash triangle.sh scalene 0.5 0.4 0.6
    assert_success
    assert_output "true"
}
