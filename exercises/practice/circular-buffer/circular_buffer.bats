#!/usr/bin/env bats
load bats-extra

bash_version=$((10 * BASH_VERSINFO[0] + BASH_VERSINFO[1]))
if (( bash_version < 43 )); then
    echo "This exercise requires at least bash version 4.3" >&2
    exit 4
fi

## append entries to a list and return the new list

setup() { source circular_buffer.sh; }

@test "reading empty buffer should fail" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 1

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" fail

    buffer::destroy buff
}

@test "can read an item just written" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 1

    buffer::write buff 'A'      && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 'A'

    buffer::destroy buff
}

@test "each item may only be read once" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 1

    buffer::write buff 'A'      && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 'A'

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" fail

    buffer::destroy buff
}

@test "items are read in the order they are written" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 2

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok
    buffer::write buff 2        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 1

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 2

    buffer::destroy buff
}

@test "full buffer can't be written to" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 1

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::write buff 2        && result=ok || result=fail
    assert_equal "$result" fail

    buffer::destroy buff
}

@test "a read frees up capacity for another write" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 1

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 1

    buffer::write buff 2        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 2

    buffer::destroy buff
}

@test "read position is maintained even across multiple writes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 3

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok
    buffer::write buff 2        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 1

    buffer::write buff 3        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 2

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 3

    buffer::destroy buff
}

@test "items cleared out of buffer can't be read" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 1

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::clear buff

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" fail

    buffer::destroy buff
}

@test "clear frees up capacity for another write" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 1

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::clear buff

    buffer::write buff 2        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 2

    buffer::destroy buff
}

@test "clear does nothing on empty buffer" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 1

    buffer::clear buff

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 1

    buffer::destroy buff
}

@test "overwrite acts like write on non-full buffer" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 2

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::overwrite buff 2    && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 1

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 2

    buffer::destroy buff
}

@test "overwrite replaces the oldest item on full buffer" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 2

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok
    buffer::write buff 2        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::overwrite buff 3    && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 2

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 3

    buffer::destroy buff
}

@test "overwrite replaces the oldest item remaining in buffer following a read" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 3

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok
    buffer::write buff 2        && result=ok || result=fail
    assert_equal "$result" ok
    buffer::write buff 3        && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 1

    buffer::write buff 4        && result=ok || result=fail
    assert_equal "$result" ok
    buffer::overwrite buff 5    && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 3

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 4

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 5

    buffer::destroy buff
}

@test "initial clear does not affect wrapping around" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    buffer::new buff 2

    buffer::clear buff

    buffer::write buff 1        && result=ok || result=fail
    assert_equal "$result" ok
    buffer::write buff 2        && result=ok || result=fail
    assert_equal "$result" ok
    buffer::overwrite buff 3    && result=ok || result=fail
    assert_equal "$result" ok
    buffer::overwrite buff 4    && result=ok || result=fail
    assert_equal "$result" ok

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 3

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" ok
    assert_equal "$value" 4

    buffer::read buff value     && result=ok || result=fail
    assert_equal "$result" fail

    buffer::destroy buff
}
