#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

join() {
    local IFS=$'\n'
    echo "$*"
}

test_no_columns() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        ""
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        ""
    )
    assert_output "$(join "${expected[@]}")"
}

test_no_flowers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "   "
        "   "
        "   "
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "   "
        "   "
        "   "
    )
    assert_output "$(join "${expected[@]}")"
}

test_garden_full_of_flowers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "***"
        "***"
        "***"
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "***"
        "***"
        "***"
    )
    assert_output "$(join "${expected[@]}")"
}

test_flower_surrounded_by_spaces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "   "
        " * "
        "   "
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "111"
        "1*1"
        "111"
    )
    assert_output "$(join "${expected[@]}")"
}

test_space_surrounded_by_flowers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "***"
        "* *"
        "***"
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "***"
        "*8*"
        "***"
    )
    assert_output "$(join "${expected[@]}")"
}

test_horizontal_line() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        " * * "
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "1*2*1"
    )
    assert_output "$(join "${expected[@]}")"
}

test_horizontal_line_flowers_at_edges() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "*   *"
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "*1 1*"
    )
    assert_output "$(join "${expected[@]}")"
}

test_vertical_line() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        " "
        "*"
        " "
        "*"
        " "
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "1"
        "*"
        "2"
        "*"
        "1"
    )
    assert_output "$(join "${expected[@]}")"
}

test_vertical_line_flowers_at_edges() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "*"
        " "
        " "
        " "
        "*"
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "*"
        "1"
        " "
        "1"
        "*"
    )
    assert_output "$(join "${expected[@]}")"
}

test_cross() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        "  *  "
        "  *  "
        "*****"
        "  *  "
        "  *  "
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        " 2*2 "
        "25*52"
        "*****"
        "25*52"
        " 2*2 "
    )
    assert_output "$(join "${expected[@]}")"
}

test_large_garden() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        " *  * "
        "  *   "
        "    * "
        "   * *"
        " *  * "
        "      "
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "1*22*1"
        "12*322"
        " 123*2"
        "112*4*"
        "1*22*2"
        "111111"
    )
    assert_output "$(join "${expected[@]}")"
}

test_multiple_adjacent_flowers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=(
        " ** "
    )
    run bash flower_field.sh "${input[@]}"
    assert_success
    expected=(
        "1**1"
    )
    assert_output "$(join "${expected[@]}")"
}
