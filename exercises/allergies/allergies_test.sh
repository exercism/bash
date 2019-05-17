#!/usr/bin/env bash

@test 'no_allergies_means_not_allergic' {
    #skip
    run bash allergies.sh 0 allergic_to peanuts
    [[ $status -eq 0 ]] 
    [[ $output = "false" ]]
    run bash allergies.sh 0 allergic_to cats
    [[ $status -eq 0 ]] 
    [[ $output = "false" ]]
    run bash allergies.sh 0 allergic_to strawberries
    [[ $status -eq 0 ]] 
    [[ $output = "false" ]]
}

@test 'is_allergic_to_eggs' {
    skip 
    run bash allergies.sh 1 allergic_to eggs
    [[ $status -eq 0 ]]
    [[ $output = "true" ]]
}

@test 'allergic_to_eggs_in_addition_to_other_stuff' {
    skip 
    run bash allergies.sh 5 allergic_to eggs
    [[ $status -eq 0 ]]
    [[ $output = "true" ]]
    run bash allergies.sh 5 allergic_to shellfish
    [[ $status -eq 0 ]]
    [[ $output = "true" ]]
    run bash allergies.sh 5 allergic_to strawberries
    [[ $status -eq 0 ]] 
    [[ $output = "false" ]]
}

@test 'allergic_to_strawberries_but_not_peanuts' {
    skip 
    run bash allergies.sh 9 allergic_to eggs
    [[ $status -eq 0 ]]
    [[ $output = "true" ]]
    run bash allergies.sh 9 allergic_to peanuts
    [[ $status -eq 0 ]] 
    [[ $output = "false" ]]
    run bash allergies.sh 9 allergic_to shellfish
    [[ $status -eq 0 ]] 
    [[ $output = "false" ]]
    run bash allergies.sh 9 allergic_to strawberries
    [[ $status -eq 0 ]]
    [[ $output = "true" ]]
}

@test 'no_allergies_at_all' {
    skip 
    run bash allergies.sh 0 list
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test 'allergic_to_just_eggs' {
    skip 
    run bash allergies.sh 1 list
    [[ $status -eq 0 ]]
    [[ $output == "eggs" ]]
}

@test 'allergic_to_just_peanuts' {
    skip 
    run bash allergies.sh 2 list
    [[ $status -eq 0 ]]
    [[ $output == "peanuts" ]]
}

@test 'allergic_to_just_strawberries' {
    skip 
    run bash allergies.sh 8 list
    [[ $status -eq 0 ]]
    [[ $output == "strawberries" ]]
}

@test 'allergic_to_eggs_and_peanuts' {
    skip 
    run bash allergies.sh 3 list
    [[ $status -eq 0 ]]
    [[ $output == "eggs peanuts" ]]
}

@test 'allergic_to_more_than_eggs_but_not_peanuts' {
    skip 
    run bash allergies.sh 5 list
    [[ $status -eq 0 ]]
    [[ $output == "eggs shellfish" ]]
}

@test 'allergic_to_lots_of_stuff' {
    skip 
    run bash allergies.sh 248 list
    [[ $status -eq 0 ]]
    [[ $output == "strawberries tomatoes chocolate pollen cats" ]]
}

@test 'allergic_to_everything' {
    skip 
    run bash allergies.sh 255 list
    [[ $status -eq 0 ]]
    [[ $output == "eggs peanuts shellfish strawberries tomatoes chocolate pollen cats" ]]
}

@test 'ignore_non_allergen_score_parts' {
    skip 
    run bash allergies.sh 509 list
    [[ $status -eq 0 ]]
    [[ $output == "eggs shellfish strawberries tomatoes chocolate pollen cats" ]]
}
