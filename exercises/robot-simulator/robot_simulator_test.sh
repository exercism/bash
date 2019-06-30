#!/usr/bin/env bash

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

@test "Robots are created with a position and direction" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 north
    [[ $status -eq 0 ]]
    [[ $output == "0 0 north" ]]
}

@test "Robots are created with a default position and direction" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh
    [[ $status -eq 0 ]]
    [[ $output == "0 0 north" ]]
}

@test "Negative positions are allowed" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh -1 -1 south
    [[ $status -eq 0 ]]
    [[ $output == "-1 -1 south" ]]
}


# rotates the robot's direction 90 degrees clockwise

@test "changes the direction from north to east" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 north R
    [[ $status -eq 0 ]]
    [[ $output == "0 0 east" ]]
}

@test "changes the direction from east to south" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 east R
    [[ $status -eq 0 ]]
    [[ $output == "0 0 south" ]]
}

@test "changes the direction from south to west" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 south R
    [[ $status -eq 0 ]]
    [[ $output == "0 0 west" ]]
}

@test "changes the direction from west to north" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 west R
    [[ $status -eq 0 ]]
    [[ $output == "0 0 north" ]]
}


# rotates the robot's direction 90 degrees counter-clockwise

@test "changes the direction from north to west" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 north L
    [[ $status -eq 0 ]]
    [[ $output == "0 0 west" ]]
}

@test "changes the direction from west to south" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 west L
    [[ $status -eq 0 ]]
    [[ $output == "0 0 south" ]]
}

@test "changes the direction from south to east" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 south L
    [[ $status -eq 0 ]]
    [[ $output == "0 0 east" ]]
}

@test "changes the direction from east to north" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 east L
    [[ $status -eq 0 ]]
    [[ $output == "0 0 north" ]]
}


# moves the robot forward 1 space in the direction it is pointing

@test "increases the y coordinate one when facing north" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 north A
    [[ $status -eq 0 ]]
    [[ $output == "0 1 north" ]]
}

@test "decreases the y coordinate by one when facing south" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 south A
    [[ $status -eq 0 ]]
    [[ $output == "0 -1 south" ]]
}

@test "increases the x coordinate by one when facing east" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 east A
    [[ $status -eq 0 ]]
    [[ $output == "1 0 east" ]]
}

@test "decreases the x coordinate by one when facing west" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 west A
    [[ $status -eq 0 ]]
    [[ $output == "-1 0 west" ]]
}


# Where R = Turn Right, L = Turn Left and A = Advance, the
# robot can follow a series of instructions and end up with
# the correct position and direction

@test "instructions to move east and north from README" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 7 3 north RAALAL
    [[ $status -eq 0 ]]
    [[ $output == "9 4 west" ]]
}

@test "instructions to move west and north" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 north LAAARALA
    [[ $status -eq 0 ]]
    [[ $output == "-4 1 west" ]]
}

@test "instructions to move west and south" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 2 -7 east RRAAAAALA
    [[ $status -eq 0 ]]
    [[ $output == "-3 -8 south" ]]
}

@test "instructions to move east and north" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 8 4 south LAAARRRALLLL
    [[ $status -eq 0 ]]
    [[ $output == "11 5 north" ]]
}


# error conditions

@test "invalid direction" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 foo
    [[ $status -eq 1 ]]
    [[ $output == *"invalid direction"* ]]
}

@test "invalid instructions" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash robot_simulator.sh 0 0 north LRAX
    [[ $status -eq 1 ]]
    [[ $output == *"invalid instruction"* ]]
}
