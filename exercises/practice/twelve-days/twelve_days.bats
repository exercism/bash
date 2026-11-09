#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_verse_first_day_a_partridge_in_a_pear_tree() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 1 1
    assert_success
    assert_output "$expected"
}

test_verse_second_day_two_turtle_doves() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 2 2
    assert_success
    assert_output "$expected"
}

test_verse_third_day_three_french_hens() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 3 3
    assert_success
    assert_output "$expected"
}

test_verse_fourth_day_four_calling_birds() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 4 4
    assert_success
    assert_output "$expected"
}

test_verse_fifth_day_five_gold_rings() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 5 5
    assert_success
    assert_output "$expected"
}

test_verse_sixth_day_six_geese_a_laying() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 6 6
    assert_success
    assert_output "$expected"
}

test_verse_seventh_day_seven_swans_a_swimming() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 7 7
    assert_success
    assert_output "$expected"
}

test_verse_eighth_day_eight_maids_a_milking() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 8 8
    assert_success
    assert_output "$expected"
}

test_verse_ninth_day_nine_ladies_dancing() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 9 9
    assert_success
    assert_output "$expected"
}

test_verse_tenth_day_ten_lords_a_leaping() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 10 10
    assert_success
    assert_output "$expected"
}

test_verse_eleventh_day_eleven_pipers_piping() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 11 11
    assert_success
    assert_output "$expected"
}

test_verse_twelfth_day_twelve_drummers_drumming() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 12 12
    assert_success
    assert_output "$expected"
}

test_lyrics_recites_first_three_verses_of_the_song() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 1 3
    assert_success
    assert_output "$expected"
}

test_lyrics_recites_three_verses_from_the_middle_of_the_song() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 4 6
    assert_success
    assert_output "$expected"
}

test_lyrics_recites_the_whole_song() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 1 12
    assert_success
    assert_output "$expected"
}
