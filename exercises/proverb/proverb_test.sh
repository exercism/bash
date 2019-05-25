#!/usr/bin/env bash

@test "zero pieces" {
    #skip
    expected=""
    run bash proverb.sh
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "one piece" {
    skip
    expected=$(cat <<END
And all for the want of a nail.
END
)
    run bash proverb.sh nail
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "two pieces" {
    skip
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
    skip
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
    skip
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
    skip
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
