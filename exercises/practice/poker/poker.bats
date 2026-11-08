#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:23:17+00:00

test_single_hand_always_wins() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5S 7H 8D JC"
    assert_success
    assert_line "4S 5S 7H 8D JC"
    assert_equal "${#lines[@]}" "1"
}

test_highest_card_out_of_all_hands_wins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4D 5S 6S 8D 3C" "2S 4C 7S 9H 10H" "3S 4S 5D 6H JH"
    assert_success
    assert_line "3S 4S 5D 6H JH"
    assert_equal "${#lines[@]}" "1"
}

test_a_tie_has_multiple_winners() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4D 5S 6S 8D 3C" "2S 4C 7S 9H 10H" "3S 4S 5D 6H JH" "3H 4H 5C 6C JD"
    assert_success
    assert_line "3S 4S 5D 6H JH"
    assert_line "3H 4H 5C 6C JD"
    assert_equal "${#lines[@]}" "2"
}

test_multiple_hands_with_the_same_high_cards_tie_compares_next_highest_ranked_down_to_last_card() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "3S 5H 6S 8D 7H" "2S 5D 6D 8C 7S"
    assert_success
    assert_line "3S 5H 6S 8D 7H"
    assert_equal "${#lines[@]}" "1"
}

test_winning_high_card_hand_also_has_the_lowest_card() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 5H 6S 8D 7H" "3S 4D 6D 8C 7S"
    assert_success
    assert_line "2S 5H 6S 8D 7H"
    assert_equal "${#lines[@]}" "1"
}

test_one_pair_beats_high_card() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 6C 8D KH" "2S 4H 6S 4D JH"
    assert_success
    assert_line "2S 4H 6S 4D JH"
    assert_equal "${#lines[@]}" "1"
}

test_highest_pair_wins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 2H 6S 2D JH" "2S 4H 6C 4D JD"
    assert_success
    assert_line "2S 4H 6C 4D JD"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_the_same_pair_high_card_wins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4H 4S AH JC 3D" "4C 4D AS 5D 6C"
    assert_success
    assert_line "4H 4S AH JC 3D"
    assert_equal "${#lines[@]}" "1"
}

test_two_pairs_beats_one_pair() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 8H 6S 8D JH" "4S 5H 4C 8C 5C"
    assert_success
    assert_line "4S 5H 4C 8C 5C"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_two_pairs_highest_ranked_pair_wins() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 8H 2D 8D 3H" "4S 5H 4C 8S 5D"
    assert_success
    assert_line "2S 8H 2D 8D 3H"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_two_pairs_with_the_same_highest_ranked_pair_tie_goes_to_low_pair() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S QS 2C QD JH" "JD QH JS 8D QC"
    assert_success
    assert_line "JD QH JS 8D QC"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_two_identically_ranked_pairs_tie_goes_to_remaining_card_kicker() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "JD QH JS 8D QC" "JS QS JC 2D QD"
    assert_success
    assert_line "JD QH JS 8D QC"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_two_pairs_that_add_to_the_same_value_win_goes_to_highest_pair() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "6S 6H 3S 3H AS" "7H 7S 2H 2S AC"
    assert_success
    assert_line "7H 7S 2H 2S AC"
    assert_equal "${#lines[@]}" "1"
}

test_two_pairs_first_ranked_by_largest_pair() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "5C 2S 5S 4H 4C" "6S 2S 6H 7C 2C"
    assert_success
    assert_line "6S 2S 6H 7C 2C"
    assert_equal "${#lines[@]}" "1"
}

test_three_of_a_kind_beats_two_pair() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 8H 2H 8D JH" "4S 5H 4C 8S 4H"
    assert_success
    assert_line "4S 5H 4C 8S 4H"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_three_of_a_kind_tie_goes_to_highest_ranked_triplet() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 2H 2C 8D JH" "4S AH AS 8C AD"
    assert_success
    assert_line "4S AH AS 8C AD"
    assert_equal "${#lines[@]}" "1"
}

test_with_multiple_decks_two_players_can_have_same_three_of_a_kind_ties_go_to_highest_remaining_cards() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "5S AH AS 7C AD" "4S AH AS 8C AD"
    assert_success
    assert_line "4S AH AS 8C AD"
    assert_equal "${#lines[@]}" "1"
}

test_a_straight_beats_three_of_a_kind() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "3S 4D 2S 6D 5C"
    assert_success
    assert_line "3S 4D 2S 6D 5C"
    assert_equal "${#lines[@]}" "1"
}

test_aces_can_end_a_straight_10_j_q_k_a() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "10D JH QS KD AC"
    assert_success
    assert_line "10D JH QS KD AC"
    assert_equal "${#lines[@]}" "1"
}

test_aces_can_start_a_straight_a_2_3_4_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 4C 8D 4H" "4D AH 3S 2D 5C"
    assert_success
    assert_line "4D AH 3S 2D 5C"
    assert_equal "${#lines[@]}" "1"
}

test_aces_cannot_be_in_the_middle_of_a_straight_q_k_a_2_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2C 3D 7H 5H 2S" "QS KH AC 2D 3S"
    assert_success
    assert_line "2C 3D 7H 5H 2S"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_with_a_straight_tie_goes_to_highest_ranked_card() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 6C 7S 8D 5H" "5S 7H 8S 9D 6H"
    assert_success
    assert_line "5S 7H 8S 9D 6H"
    assert_equal "${#lines[@]}" "1"
}

test_even_though_an_ace_is_usually_high_a_5_high_straight_is_the_lowest_scoring_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2H 3C 4D 5D 6H" "4S AH 3S 2D 5H"
    assert_success
    assert_line "2H 3C 4D 5D 6H"
    assert_equal "${#lines[@]}" "1"
}

test_flush_beats_a_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4C 6H 7D 8D 5H" "2S 4S 5S 6S 7S"
    assert_success
    assert_line "2S 4S 5S 6S 7S"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_a_flush_tie_goes_to_high_card_down_to_the_last_one_if_necessary() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2H 7H 8H 9H 6H" "3S 5S 6S 7S 8S"
    assert_success
    assert_line "2H 7H 8H 9H 6H"
    assert_equal "${#lines[@]}" "1"
}

test_full_house_beats_a_flush() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "3H 6H 7H 8H 5H" "4S 5H 4C 5D 4H"
    assert_success
    assert_line "4S 5H 4C 5D 4H"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_a_full_house_tie_goes_to_highest_ranked_triplet() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4H 4S 4D 9S 9D" "5H 5S 5D 8S 8D"
    assert_success
    assert_line "5H 5S 5D 8S 8D"
    assert_equal "${#lines[@]}" "1"
}

test_with_multiple_decks_both_hands_have_a_full_house_with_the_same_triplet_tie_goes_to_the_pair() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "5H 5S 5D 9S 9D" "5H 5S 5D 8S 8D"
    assert_success
    assert_line "5H 5S 5D 9S 9D"
    assert_equal "${#lines[@]}" "1"
}

test_four_of_a_kind_beats_a_full_house() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 4D 5D 4H" "3S 3H 2S 3D 3C"
    assert_success
    assert_line "3S 3H 2S 3D 3C"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_four_of_a_kind_tie_goes_to_high_quad() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2S 2H 2C 8D 2D" "4S 5H 5S 5D 5C"
    assert_success
    assert_line "4S 5H 5S 5D 5C"
    assert_equal "${#lines[@]}" "1"
}

test_with_multiple_decks_both_hands_with_identical_four_of_a_kind_tie_determined_by_kicker() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "3S 3H 2S 3D 3C" "3S 3H 4S 3D 3C"
    assert_success
    assert_line "3S 3H 4S 3D 3C"
    assert_equal "${#lines[@]}" "1"
}

test_straight_flush_beats_four_of_a_kind() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4S 5H 5S 5D 5C" "7S 8S 9S 6S 10S"
    assert_success
    assert_line "7S 8S 9S 6S 10S"
    assert_equal "${#lines[@]}" "1"
}

test_aces_can_end_a_straight_flush_10_j_q_k_a() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "KC AH AS AD AC" "10C JC QC KC AC"
    assert_success
    assert_line "10C JC QC KC AC"
    assert_equal "${#lines[@]}" "1"
}

test_aces_can_start_a_straight_flush_a_2_3_4_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "KS AH AS AD AC" "4H AH 3H 2H 5H"
    assert_success
    assert_line "4H AH 3H 2H 5H"
    assert_equal "${#lines[@]}" "1"
}

test_aces_cannot_be_in_the_middle_of_a_straight_flush_q_k_a_2_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2C AC QC 10C KC" "QH KH AH 2H 3H"
    assert_success
    assert_line "2C AC QC 10C KC"
    assert_equal "${#lines[@]}" "1"
}

test_both_hands_have_a_straight_flush_tie_goes_to_highest_ranked_card() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "4H 6H 7H 8H 5H" "5S 7S 8S 9S 6S"
    assert_success
    assert_line "5S 7S 8S 9S 6S"
    assert_equal "${#lines[@]}" "1"
}

test_even_though_an_ace_is_usually_high_a_5_high_straight_flush_is_the_lowest_scoring_straight_flush() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash poker.sh "2H 3H 4H 5H 6H" "4D AD 3D 2D 5D"
    assert_success
    assert_line "2H 3H 4H 5H 6H"
    assert_equal "${#lines[@]}" "1"
}
