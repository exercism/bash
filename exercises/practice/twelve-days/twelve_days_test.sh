#!/usr/bin/env bash

# local version: 1.2.0.0

@test "first day a partridge in a pear tree" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 1 1
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "second day two turtle doves" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 2 2
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "third day three french hens" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 3 3
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "fourth day four calling birds" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 4 4
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "fifth day five gold rings" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 5 5
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "sixth day six geese-a-laying" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 6 6
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "seventh day seven swans-a-swimming" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 7 7
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "eighth day eight maids-a-milking" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 8 8
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "ninth day nine ladies dancing" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 9 9
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "tenth day ten lords-a-leaping" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 10 10
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "eleventh day eleven pipers piping" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 11 11
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "twelfth day twelve drummers drumming" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 12 12
    (( status == 0 ))
    [[ $output == "$expected" ]]
    }

@test "recites first three verses of the song" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 1 3
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "recites three verses from the middle of the song" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
END
)
    run bash twelve_days.sh 4 6
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "recites the whole song" {
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
    (( status == 0 ))
    [[ $output == "$expected" ]]
}
