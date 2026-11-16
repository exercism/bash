#!/usr/bin/env bats
load bats-extra

# local version: 3.2.0.1
# bash-specific test: Input validation

# Input parameters are:
# 1. starting x position
# 2. starting y position
# 3. starting direction
# 4. (optional) instructions

# Output is a 3-word string:
# 1. ending x position
# 2. ending y position
# 3. ending direction


# A robot is created with a position and a direction

robots_are_created_with_a_position_and_direction() { # @test
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 north
    assert_success
    assert_output "0 0 north"
}

robots_are_created_with_a_default_position_and_direction() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh
    assert_success
    assert_output "0 0 north"
}

negative_positions_are_allowed() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh -1 -1 south
    assert_success
    assert_output "-1 -1 south"
}


# rotates the robot's direction 90 degrees clockwise

changes_the_direction_from_north_to_east() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 north R
    assert_success
    assert_output "0 0 east"
}

changes_the_direction_from_east_to_south() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 east R
    assert_success
    assert_output "0 0 south"
}

changes_the_direction_from_south_to_west() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 south R
    assert_success
    assert_output "0 0 west"
}

changes_the_direction_from_west_to_north() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 west R
    assert_success
    assert_output "0 0 north"
}


# rotates the robot's direction 90 degrees counter-clockwise

changes_the_direction_from_north_to_west() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 north L
    assert_success
    assert_output "0 0 west"
}

changes_the_direction_from_west_to_south() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 west L
    assert_success
    assert_output "0 0 south"
}

changes_the_direction_from_south_to_east() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 south L
    assert_success
    assert_output "0 0 east"
}

changes_the_direction_from_east_to_north() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 east L
    assert_success
    assert_output "0 0 north"
}


# moves the robot forward 1 space in the direction it is pointing

increases_the_y_coordinate_one_when_facing_north() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 north A
    assert_success
    assert_output "0 1 north"
}

decreases_the_y_coordinate_by_one_when_facing_south() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 south A
    assert_success
    assert_output "0 -1 south"
}

increases_the_x_coordinate_by_one_when_facing_east() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 east A
    assert_success
    assert_output "1 0 east"
}

decreases_the_x_coordinate_by_one_when_facing_west() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 west A
    assert_success
    assert_output "-1 0 west"
}


# Where R = Turn Right, L = Turn Left and A = Advance, the
# robot can follow a series of instructions and end up with
# the correct position and direction

instructions_to_move_east_and_north_from_readme() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 7 3 north RAALAL
    assert_success
    assert_output "9 4 west"
}

instructions_to_move_west_and_north() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 north LAAARALA
    assert_success
    assert_output "-4 1 west"
}

instructions_to_move_west_and_south() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 2 -7 east RRAAAAALA
    assert_success
    assert_output "-3 -8 south"
}

instructions_to_move_east_and_north() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 8 4 south LAAARRRALLLL
    assert_success
    assert_output "11 5 north"
}


# error conditions

invalid_direction() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 foo
    assert_failure
    assert_output --partial "invalid direction"
}

invalid_instructions() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash robot_simulator.sh 0 0 north LRAX
    assert_failure
    assert_output --partial "invalid instruction"
}
