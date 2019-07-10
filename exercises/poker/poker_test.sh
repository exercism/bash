#!/usr/bin/env bash


@test "single hand always wins" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 5S 7H 8D JC" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4S 5S 7H 8D JC"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "highest card out of all hands wins" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4D 5S 6S 8D 3C" "2S 4C 7S 9H 10H" "3S 4S 5D 6H JH" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "3S 4S 5D 6H JH"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "a tie has multiple winners" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4D 5S 6S 8D 3C" "2S 4C 7S 9H 10H" "3S 4S 5D 6H JH" "3H 4H 5C 6C JD" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "3S 4S 5D 6H JH"
    echo "$output" | grep -qFx "3H 4H 5C 6C JD"
    [[ $(echo "$output" | wc -l) == "2" ]]
}

@test "multiple hands with the same high cards, tie compares next highest ranked, down to last card" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "3S 5H 6S 8D 7H" "2S 5D 6D 8C 7S" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "3S 5H 6S 8D 7H"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "one pair beats high card" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 5H 6C 8D KH" "2S 4H 6S 4D JH" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "2S 4H 6S 4D JH"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "highest pair wins" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 2H 6S 2D JH" "2S 4H 6C 4D JD" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "2S 4H 6C 4D JD"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "two pairs beats one pair" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "2S 8H 6S 8D JH" "4S 5H 4C 8C 5C" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4S 5H 4C 8C 5C"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands have two pairs, highest ranked pair wins" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "2S 8H 2D 8D 3H" "4S 5H 4C 8S 5D" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "2S 8H 2D 8D 3H"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands have two pairs, with the same highest ranked pair, tie goes to low pair" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "2S QS 2C QD JH" "JD QH JS 8D QC" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "JD QH JS 8D QC"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands have two identically ranked pairs, tie goes to remaining card (kicker)" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "JD QH JS 8D QC" "JS QS JC 2D QD" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "JD QH JS 8D QC"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "three of a kind beats two pair" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "2S 8H 2H 8D JH" "4S 5H 4C 8S 4H" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4S 5H 4C 8S 4H"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands have three of a kind, tie goes to highest ranked triplet" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "2S 2H 2C 8D JH" "4S AH AS 8C AD" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4S AH AS 8C AD"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "with multiple decks, two players can have same three of a kind, ties go to highest remaining cards" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S AH AS 7C AD" "4S AH AS 8C AD" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4S AH AS 8C AD"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "a straight beats three of a kind" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "3S 4D 2S 6D 5C" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "3S 4D 2S 6D 5C"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "aces can end a straight (10 J Q K A)" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "10D JH QS KD AC" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "10D JH QS KD AC"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "aces can start a straight (A 2 3 4 5)" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "4D AH 3S 2D 5C" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4D AH 3S 2D 5C"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands with a straight, tie goes to highest ranked card" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 6C 7S 8D 5H" "5S 7H 8S 9D 6H" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "5S 7H 8S 9D 6H"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "even though an ace is usually high, a 5-high straight is the lowest-scoring straight" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "2H 3C 4D 5D 6H" "4S AH 3S 2D 5H" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "2H 3C 4D 5D 6H"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "flush beats a straight" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4C 6H 7D 8D 5H" "2S 4S 5S 6S 7S" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "2S 4S 5S 6S 7S"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands have a flush, tie goes to high card, down to the last one if necessary" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4H 7H 8H 9H 6H" "2S 4S 5S 6S 7S" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4H 7H 8H 9H 6H"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "full house beats a flush" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "3H 6H 7H 8H 5H" "4S 5H 4C 5D 4H" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4S 5H 4C 5D 4H"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands have a full house, tie goes to highest-ranked triplet" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4H 4S 4D 9S 9D" "5H 5S 5D 8S 8D" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "5H 5S 5D 8S 8D"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "with multiple decks, both hands have a full house with the same triplet, tie goes to the pair" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "5H 5S 5D 9S 9D" "5H 5S 5D 8S 8D" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "5H 5S 5D 9S 9D"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "four of a kind beats a full house" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 5H 4D 5D 4H" "3S 3H 2S 3D 3C" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "3S 3H 2S 3D 3C"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands have four of a kind, tie goes to high quad" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "2S 2H 2C 8D 2D" "4S 5H 5S 5D 5C" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "4S 5H 5S 5D 5C"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "with multiple decks, both hands with identical four of a kind, tie determined by kicker" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "3S 3H 2S 3D 3C" "3S 3H 4S 3D 3C" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "3S 3H 4S 3D 3C"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "straight flush beats four of a kind" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4S 5H 5S 5D 5C" "7S 8S 9S 6S 10S" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "7S 8S 9S 6S 10S"
    [[ $(echo "$output" | wc -l) == "1" ]]
}

@test "both hands have straight flush, tie goes to highest-ranked card" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash poker.sh "4H 6H 7H 8H 5H" "5S 7S 8S 9S 6S" 
    [[ $status -eq 0 ]]
    echo "$output" | grep -qFx "5S 7S 8S 9S 6S"
    [[ $(echo "$output" | wc -l) == "1" ]]
}
