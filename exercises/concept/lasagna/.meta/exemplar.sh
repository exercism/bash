#!/usr/bin/env bash

# `expr` is an external command that does simple arithmetic.
# Bash has a builtin way to do this, which a later concept will cover.
# shellcheck disable=SC2003

expected_minutes_in_oven=40
minutes_per_layer=2

actual_minutes_in_oven=${1:-0}
number_of_layers=${2:-1}

# Task 1
echo "Expected minutes in oven: ${expected_minutes_in_oven}"

# Task 2
remaining_minutes_in_oven=$(expr "$expected_minutes_in_oven" - "$actual_minutes_in_oven")
echo "Remaining minutes in oven: ${remaining_minutes_in_oven}"

# Task 3
preparation_time=$(expr "$number_of_layers" '*' "$minutes_per_layer")
echo "Preparation time in minutes: ${preparation_time}"

# Task 4
total_time=$(expr "$preparation_time" + "$actual_minutes_in_oven")
echo "Total time in minutes: ${total_time}"
