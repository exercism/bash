#!/usr/bin/env bash

shopping_list_file=$1

# Task 1
head -n 1 "$shopping_list_file"

# Task 2
echo
wc -l "$shopping_list_file"

# Task 3
echo
echo "The substitution for buttermilk is    regular milk"
