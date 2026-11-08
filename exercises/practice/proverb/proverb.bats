#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:52:45+00:00

test_zero_pieces() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
END
)
    run bash proverb.sh
    assert_success
    assert_output "$expected"
}

test_one_piece() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
And all for the want of a nail.
END
)
    run bash proverb.sh nail
    assert_success
    assert_output "$expected"
}

test_two_pieces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
For want of a nail the shoe was lost.
And all for the want of a nail.
END
)
    run bash proverb.sh nail shoe
    assert_success
    assert_output "$expected"
}

test_three_pieces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
END
)
    run bash proverb.sh nail shoe horse
    assert_success
    assert_output "$expected"
}

test_full_proverb() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
END
)
    run bash proverb.sh nail shoe horse rider message battle kingdom
    assert_success
    assert_output "$expected"
}

test_four_pieces_modernized() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
END
)
    run bash proverb.sh pin gun soldier battle
    assert_success
    assert_output "$expected"
}

# bash-specific tests: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

test_items_with_whitespace() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
For want of a rusty nail the horse shoe was lost.
And all for the want of a rusty nail.
END
)
    run bash proverb.sh "rusty nail" "horse shoe"
    assert_success
    assert_output "$expected"
}

test_shell_globbing_character() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END
For want of a quotes the * was lost.
And all for the want of a quotes.
END
)
    run bash proverb.sh quotes "*"
    assert_success
    assert_output "$expected"
}
