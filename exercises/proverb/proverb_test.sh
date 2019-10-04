#!/usr/bin/env bash

# canonical-data version: 1.1.0
# plus additional track-specific tests

@test "zero pieces" {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected=""
    run bash proverb.sh
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "one piece" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected=$(cat <<END
And all for the want of a nail.
END
)
    run bash proverb.sh nail
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "two pieces" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected=$(cat <<END
For want of a nail the shoe was lost.
And all for the want of a nail.
END
)
    run bash proverb.sh nail shoe
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "three pieces" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected=$(cat <<END
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
END
)
    run bash proverb.sh nail shoe horse
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}


@test "full proverb" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
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
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "four pieces modernized" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected=$(cat <<END
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
END
)
    run bash proverb.sh pin gun soldier battle
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

# bash-specific tests: Focus the student's attention on the effects of 
# word splitting and filename expansion:
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

@test "items with whitespace" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected=$(cat <<END
For want of a rusty nail the horse shoe was lost.
And all for the want of a rusty nail.
END
)
    run bash proverb.sh "rusty nail" "horse shoe"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "shell globbing character" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    expected=$(cat <<END
For want of a quotes the * was lost.
And all for the want of a quotes.
END
)
    run bash proverb.sh quotes "*"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}
