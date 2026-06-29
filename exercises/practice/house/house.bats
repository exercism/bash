#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T18:35:03+00:00

@test "verse one - the house that jack built" {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the house that Jack built.
END
)
    run bash house.sh 1 1
    assert_success
    assert_output "$expected"
}

@test "verse two - the malt that lay" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the malt that lay in the house that Jack built.
END
)
    run bash house.sh 2 2
    assert_success
    assert_output "$expected"
}

@test "verse three - the rat that ate" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 3 3
    assert_success
    assert_output "$expected"
}

@test "verse four - the cat that killed" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 4 4
    assert_success
    assert_output "$expected"
}

@test "verse five - the dog that worried" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 5 5
    assert_success
    assert_output "$expected"
}

@test "verse six - the cow with the crumpled horn" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 6 6
    assert_success
    assert_output "$expected"
}

@test "verse seven - the maiden all forlorn" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 7 7
    assert_success
    assert_output "$expected"
}

@test "verse eight - the man all tattered and torn" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 8 8
    assert_success
    assert_output "$expected"
}

@test "verse nine - the priest all shaven and shorn" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 9 9
    assert_success
    assert_output "$expected"
}

@test "verse 10 - the rooster that crowed in the morn" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 10 10
    assert_success
    assert_output "$expected"
}

@test "verse 11 - the farmer sowing his corn" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 11 11
    assert_success
    assert_output "$expected"
}

@test "verse 12 - the horse and the hound and the horn" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
    run bash house.sh 12 12
    assert_success
    assert_output "$expected"
}

@test "multiple verses" {
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

@test "full rhyme" {
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

@test "invalid verse 1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash house.sh 0 12
    assert_failure
    assert_output --partial "invalid"
}

@test "invalid verse 2" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash house.sh 1 -1
    assert_failure
    assert_output --partial "invalid"
}

@test "invalid verse 3" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash house.sh 14 12
    assert_failure
    assert_output --partial "invalid"
}

@test "invalid verse 4" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash house.sh 1 13
    assert_failure
    assert_output --partial "invalid"
}
