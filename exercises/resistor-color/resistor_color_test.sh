#!/usr/bin/env bash

@test "color code black" {
    #skip
    run bash resistor_color.sh black
    [[ $status -eq 0 ]]
    [[ $output == 0 ]]
}

@test "color code white" {
    skip
    run bash resistor_color.sh white
    [[ $status -eq 0 ]]
    [[ $output == 9 ]]
}

@test "color code orange" {
    skip
    run bash resistor_color.sh orange
    [[ $status -eq 0 ]]
    [[ $output == 3 ]]
}

@test "invalid color" {
    skip
    run bash resistor_color.sh aquamarine
    [[ $status -eq 1 ]]
    [[ $output == "invalid color" ]]
}

@test colors {
    skip
    run bash resistor_color.sh
    [[ $status -eq 0 ]]
    [[ $output == "black brown red orange yellow green blue violet grey white" ]]
}
