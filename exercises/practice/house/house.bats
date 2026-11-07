#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:26:10+00:00

test_verse_one_the_house_that_jack_built() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the house that Jack built.
END
)
    run bash house.sh 1 1
    assert_success
    assert_output "$expected"
}

test_verse_two_the_malt_that_lay() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the malt that lay in the house that Jack built.
END
)
    run bash house.sh 2 2
    assert_success
    assert_output "$expected"
}

test_verse_three_the_rat_that_ate() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 3 3
    assert_success
    assert_output "$expected"
}

test_verse_four_the_cat_that_killed() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 4 4
    assert_success
    assert_output "$expected"
}

test_verse_five_the_dog_that_worried() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 5 5
    assert_success
    assert_output "$expected"
}

test_verse_six_the_cow_with_the_crumpled_horn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 6 6
    assert_success
    assert_output "$expected"
}

test_verse_seven_the_maiden_all_forlorn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 7 7
    assert_success
    assert_output "$expected"
}

test_verse_eight_the_man_all_tattered_and_torn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 8 8
    assert_success
    assert_output "$expected"
}

test_verse_nine_the_priest_all_shaven_and_shorn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 9 9
    assert_success
    assert_output "$expected"
}

test_verse_10_the_rooster_that_crowed_in_the_morn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 10 10
    assert_success
    assert_output "$expected"
}

test_verse_11_the_farmer_sowing_his_corn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 11 11
    assert_success
    assert_output "$expected"
}

test_verse_12_the_horse_and_the_hound_and_the_horn() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 12 12
    assert_success
    assert_output "$expected"
}

test_multiple_verses() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 4 8
    assert_success
    assert_output "$expected"
}

test_full_rhyme() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the house that Jack built.
This is the malt that lay in the house that Jack built.
This is the rat that ate the malt that lay in the house that Jack built.
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 1 12
    assert_success
    assert_output "$expected"
}

test_test_invalid_verse_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash house.sh 0 12
    assert_failure
    assert_output --partial "invalid"
}

test_test_invalid_verse_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash house.sh 1 -1
    assert_failure
    assert_output --partial "invalid"
}

test_test_invalid_verse_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash house.sh 14 12
    assert_failure
    assert_output --partial "invalid"
}

test_test_invalid_verse_4() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash house.sh 1 13
    assert_failure
    assert_output --partial "invalid"
}
