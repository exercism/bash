#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:26:10+00:00

# usage: dnd_character.sh modifier n
# -> output expected modifier

# usage: dnd_character.sh generate
# -> output each characteristic and ability value, one per line


# ability modifier

test_ability_modifier_ability_modifier_for_score_3_is_4() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 3
    assert_success
    assert_output "-4"
}

test_ability_modifier_ability_modifier_for_score_4_is_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 4
    assert_success
    assert_output "-3"
}

test_ability_modifier_ability_modifier_for_score_5_is_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 5
    assert_success
    assert_output "-3"
}

test_ability_modifier_ability_modifier_for_score_6_is_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 6
    assert_success
    assert_output "-2"
}

test_ability_modifier_ability_modifier_for_score_7_is_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 7
    assert_success
    assert_output "-2"
}

test_ability_modifier_ability_modifier_for_score_8_is_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 8
    assert_success
    assert_output "-1"
}

test_ability_modifier_ability_modifier_for_score_9_is_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 9
    assert_success
    assert_output "-1"
}

test_ability_modifier_ability_modifier_for_score_10_is_0() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 10
    assert_success
    assert_output "0"
}

test_ability_modifier_ability_modifier_for_score_11_is_0() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 11
    assert_success
    assert_output "0"
}

test_ability_modifier_ability_modifier_for_score_12_is_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 12
    assert_success
    assert_output "1"
}

test_ability_modifier_ability_modifier_for_score_13_is_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 13
    assert_success
    assert_output "1"
}

test_ability_modifier_ability_modifier_for_score_14_is_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 14
    assert_success
    assert_output "2"
}

test_ability_modifier_ability_modifier_for_score_15_is_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 15
    assert_success
    assert_output "2"
}

test_ability_modifier_ability_modifier_for_score_16_is_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 16
    assert_success
    assert_output "3"
}

test_ability_modifier_ability_modifier_for_score_17_is_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 17
    assert_success
    assert_output "3"
}

test_ability_modifier_ability_modifier_for_score_18_is_4() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh modifier 18
    assert_success
    assert_output "4"
}



# generate a character, validate expected output
test_generate_a_character() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash dnd_character.sh generate
    assert_success
    # these don't have to appear in any particular order
    assert_line --regexp '^strength [[:digit:]]{1,2}$'
    assert_line --regexp '^dexterity [[:digit:]]{1,2}$'
    assert_line --regexp '^constitution [[:digit:]]{1,2}$'
    assert_line --regexp '^intelligence [[:digit:]]{1,2}$'
    assert_line --regexp '^wisdom [[:digit:]]{1,2}$'
    assert_line --regexp '^charisma [[:digit:]]{1,2}$'
    assert_line --regexp '^hitpoints [[:digit:]]{1,2}$'
    # no other output: `run` populates the `lines` array
    assert_equal ${#lines[@]} 7
}


# Usage: between $val $low $high
# Value is between low (inclusive) and high (inclusive).
between() {
    (( $2 <= $1 && $1 <= $3 ))
}

# random ability is within range
test_validate_ability_range_and_hitpoint_value() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    for _ in {1..50}; do
        while read -r c v; do
            if [[ $c == "hitpoints" ]]; then
                hits=$v
            else
                assert between "$v" 3 18
                [[ $c == "constitution" ]] && const=$v
            fi
        done < <(bash dnd_character.sh generate)

        const_mod=$(bash dnd_character.sh modifier "$const")
        assert_equal $((10 + const_mod)) "$hits"
    done
}
