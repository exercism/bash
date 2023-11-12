#!/usr/bin/env bats
load bats-extra

# local version: 1.1.0.0


@test "single hand always wins" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5S 7H 8D JC"
    assert_success
    assert_line "4S 5S 7H 8D JC"
    assert_equal "${#lines[@]}" "1"
}

@test "highest card out of all hands wins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4D 5S 6S 8D 3C" "2S 4C 7S 9H 10H" "3S 4S 5D 6H JH"
    assert_success
    assert_line "3S 4S 5D 6H JH"
    assert_equal "${#lines[@]}" "1"
}

@test "a tie has multiple winners" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4D 5S 6S 8D 3C" "2S 4C 7S 9H 10H" "3S 4S 5D 6H JH" "3H 4H 5C 6C JD"
    assert_success
    assert_line "3S 4S 5D 6H JH"
    assert_line "3H 4H 5C 6C JD"
    assert_equal "${#lines[@]}" "2"
}

@test "multiple hands with the same high cards, tie compares next highest ranked, down to last card" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "3S 5H 6S 8D 7H" "2S 5D 6D 8C 7S"
    assert_success
    assert_line "3S 5H 6S 8D 7H"
    assert_equal "${#lines[@]}" "1"
}

@test "winning high card hand also has the lowest card" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 5H 6S 8D 7H" "3S 4D 6D 8C 7S"
    assert_success
    assert_line "2S 5H 6S 8D 7H"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have the same pair, high card wins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4H 4S AH JC 3D" "4C 4D AS 5D 6C"
    assert_success
    assert_line "4H 4S AH JC 3D"
    assert_equal "${#lines[@]}" "1"
}

@test "with multiple decks, two players can have same three of a kind, ties go to highest remaining cards" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S AH AS 7C AD" "4S AH AS 8C AD"
    assert_success
    assert_line "4S AH AS 8C AD"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have a flush, tie goes to high card, down to the last one if necessary" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4H 7H 8H 9H 6H" "2S 4S 5S 6S 7S"
    assert_success
    assert_line "4H 7H 8H 9H 6H"
    assert_equal "${#lines[@]}" "1"
}

@test "one pair beats high card" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 6C 8D KH" "2S 4H 6S 4D JH"
    assert_success
    assert_line "2S 4H 6S 4D JH"
    assert_equal "${#lines[@]}" "1"
}

@test "highest pair wins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 2H 6S 2D JH" "2S 4H 6C 4D JD"
    assert_success
    assert_line "2S 4H 6C 4D JD"
    assert_equal "${#lines[@]}" "1"
}

@test "two pairs beats one pair" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 8H 6S 8D JH" "4S 5H 4C 8C 5C"
    assert_success
    assert_line "4S 5H 4C 8C 5C"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have two pairs, highest ranked pair wins" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 8H 2D 8D 3H" "4S 5H 4C 8S 5D"
    assert_success
    assert_line "2S 8H 2D 8D 3H"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have two pairs, with the same highest ranked pair, tie goes to low pair" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S QS 2C QD JH" "JD QH JS 8D QC"
    assert_success
    assert_line "JD QH JS 8D QC"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have two identically ranked pairs, tie goes to remaining card (kicker)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "JD QH JS 8D QC" "JS QS JC 2D QD"
    assert_success
    assert_line "JD QH JS 8D QC"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have two pairs that add to the same value, win goes to highest pair" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "6S 6H 3S 3H AS" "7H 7S 2H 2S AC"
    assert_success
    assert_line "7H 7S 2H 2S AC"
    assert_equal "${#lines[@]}" "1"
}

@test "two pairs first ranked by largest pair" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "5C 2S 5S 4H 4C" "6S 2S 6H 7C 2C"
    assert_success
    assert_line "6S 2S 6H 7C 2C"
    assert_equal "${#lines[@]}" "1"
}

@test "three of a kind beats two pair" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 8H 2H 8D JH" "4S 5H 4C 8S 4H"
    assert_success
    assert_line "4S 5H 4C 8S 4H"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have three of a kind, tie goes to highest ranked triplet" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 2H 2C 8D JH" "4S AH AS 8C AD"
    assert_success
    assert_line "4S AH AS 8C AD"
    assert_equal "${#lines[@]}" "1"
}

@test "a straight beats three of a kind" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "3S 4D 2S 6D 5C"
    assert_success
    assert_line "3S 4D 2S 6D 5C"
    assert_equal "${#lines[@]}" "1"
}

@test "aces can end a straight (10 J Q K A)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "10D JH QS KD AC"
    assert_success
    assert_line "10D JH QS KD AC"
    assert_equal "${#lines[@]}" "1"
}

@test "aces can start a straight (A 2 3 4 5)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "4D AH 3S 2D 5C"
    assert_success
    assert_line "4D AH 3S 2D 5C"
    assert_equal "${#lines[@]}" "1"
}

@test "aces cannot be in the middle of a straight (Q K A 2 3)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2C 3D 7H 5H 2S" "QS KH AC 2D 3S"
    assert_success
    assert_line "2C 3D 7H 5H 2S"
    assert_equal "${#lines[@]}" "1"
}


@test "both hands with a straight, tie goes to highest ranked card" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 6C 7S 8D 5H" "5S 7H 8S 9D 6H"
    assert_success
    assert_line "5S 7H 8S 9D 6H"
    assert_equal "${#lines[@]}" "1"
}

@test "even though an ace is usually high, a 5-high straight is the lowest-scoring straight" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2H 3C 4D 5D 6H" "4S AH 3S 2D 5H"
    assert_success
    assert_line "2H 3C 4D 5D 6H"
    assert_equal "${#lines[@]}" "1"
}

@test "flush beats a straight" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4C 6H 7D 8D 5H" "2S 4S 5S 6S 7S"
    assert_success
    assert_line "2S 4S 5S 6S 7S"
    assert_equal "${#lines[@]}" "1"
}

@test "full house beats a flush" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "3H 6H 7H 8H 5H" "4S 5H 4C 5D 4H"
    assert_success
    assert_line "4S 5H 4C 5D 4H"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have a full house, tie goes to highest-ranked triplet" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4H 4S 4D 9S 9D" "5H 5S 5D 8S 8D"
    assert_success
    assert_line "5H 5S 5D 8S 8D"
    assert_equal "${#lines[@]}" "1"
}

@test "with multiple decks, both hands have a full house with the same triplet, tie goes to the pair" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "5H 5S 5D 9S 9D" "5H 5S 5D 8S 8D"
    assert_success
    assert_line "5H 5S 5D 9S 9D"
    assert_equal "${#lines[@]}" "1"
}

@test "four of a kind beats a full house" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 4D 5D 4H" "3S 3H 2S 3D 3C"
    assert_success
    assert_line "3S 3H 2S 3D 3C"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have four of a kind, tie goes to high quad" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 2H 2C 8D 2D" "4S 5H 5S 5D 5C"
    assert_success
    assert_line "4S 5H 5S 5D 5C"
    assert_equal "${#lines[@]}" "1"
}

@test "with multiple decks, both hands with identical four of a kind, tie determined by kicker" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "3S 3H 2S 3D 3C" "3S 3H 4S 3D 3C"
    assert_success
    assert_line "3S 3H 4S 3D 3C"
    assert_equal "${#lines[@]}" "1"
}

@test "straight flush beats four of a kind" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 5S 5D 5C" "7S 8S 9S 6S 10S"
    assert_success
    assert_line "7S 8S 9S 6S 10S"
    assert_equal "${#lines[@]}" "1"
}

@test "aces can end a straight flush (10 J Q K A)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "KC AH AS AD AC" "10C JC QC KC AC"
    assert_success
    assert_line "10C JC QC KC AC"
    assert_equal "${#lines[@]}" "1"
}

@test "aces can start a straight flush (A 2 3 4 5)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "KS AH AS AD AC" "4H AH 3H 2H 5H"
    assert_success
    assert_line "4H AH 3H 2H 5H"
    assert_equal "${#lines[@]}" "1"
}

@test "aces cannot be in the middle of a straight flush (Q K A 2 3)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2C AC QC 10C KC" "QH KH AH 2H 3H"
    assert_success
    assert_line "2C AC QC 10C KC"
    assert_equal "${#lines[@]}" "1"
}

@test "both hands have straight flush, tie goes to highest-ranked card" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4H 6H 7H 8H 5H" "5S 7S 8S 9S 6S"
    assert_success
    assert_line "5S 7S 8S 9S 6S"
    assert_equal "${#lines[@]}" "1"
}

@test "even though an ace is usually high, a 5-high straight flush is the lowest-scoring straight flush" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2H 3H 4H 5H 6H" "4D AD 3D 2D 5D"
    assert_success
    assert_line "2H 3H 4H 5H 6H"
    assert_equal "${#lines[@]}" "1"
}
