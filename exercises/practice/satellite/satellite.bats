#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_empty_tree() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "" ""
    assert_success
    expectedJson=$(cat << END_JSON
    {}
END_JSON
)
    # compare without spaces
    [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}

test_tree_with_one_item() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "a" "a"
    assert_success
    expectedJson=$(cat << END_JSON
    {
        "v": "a",
        "l": {},
        "r": {}
    }
END_JSON
)
    # compare without spaces
    [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}

test_tree_with_many_items() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "a i x f r" "i a f x r"
    assert_success
    expectedJson=$(cat << END_JSON
    {
        "v": "a",
        "l": {
            "v": "i",
            "l": {},
            "r": {}
        },
        "r": {
            "v": "x",
            "l": {
                "v": "f",
                "l": {},
                "r": {}
            },
            "r": {
                "v": "r",
                "l": {},
                "r": {}
            }
        }
    }
END_JSON
)
    # compare without spaces
    [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}

test_reject_traversals_of_different_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "a b" "b a r"
    assert_failure
    shopt -s nocasematch
    assert_output "traversals must have the same length"
}

test_reject_inconsistent_traversals_of_same_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "x y z" "a b c"
    assert_failure
    shopt -s nocasematch
    assert_output "traversals must have the same elements"
}

test_reject_traversals_with_repeated_items() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "a b a" "b a a"
    assert_failure
    shopt -s nocasematch
    assert_output "traversals must contain unique items"
}

test_a_degenerate_binary_tree() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "a b c d" "d c b a"
    assert_success
    expectedJson=$(cat << END_JSON
    {
        "v": "a",
        "l": {
            "v": "b",
            "l": {
                "v": "c",
                "l": {
                    "v": "d",
                    "l": {},
                    "r": {}
                },
                "r": {}
            },
            "r": {}
        },
        "r": {}
    }
END_JSON
)
    # compare without spaces
    [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}

test_another_degenerate_binary_tree() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "a b c d" "a b c d"
    assert_success
    expectedJson=$(cat << END_JSON
    {
        "v": "a",
        "l": {},
        "r": {
            "v": "b",
            "l": {},
            "r": {
                "v": "c",
                "l": {},
                "r": {
                    "v": "d",
                    "l": {},
                    "r": {}
                }
            }
        }
    }
END_JSON
)
    # compare without spaces
    [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}

test_tree_with_many_more_items() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash satellite.sh "a b d g h c e f i" "g d h b a e c i f"
    assert_success
    expectedJson=$(cat << END_JSON
    {
        "v": "a",
        "l": {
            "v": "b",
            "l": {
                "v": "d",
                "l": {
                    "v": "g",
                    "l": {},
                    "r": {}
                },
                "r": {
                    "v": "h",
                    "l": {},
                    "r": {}
                }
            },
            "r": {}
        },
        "r": {
            "v": "c",
            "l": {
                "v": "e",
                "l": {},
                "r": {}
            },
            "r": {
                "v": "f",
                "l": {
                    "v": "i",
                    "l": {},
                    "r": {}
                },
                "r": {}
            }
        }
    }
END_JSON
)
    # compare without spaces
    [[ "${output//[[:space:]]/}" == "${expectedJson//[[:space:]]/}" ]]
}
