#!/usr/bin/env bats
load bats-extra

# `run --keep-empty-lines` keeps the blank lines between tasks in $lines,
# so that assert_line --index numbers match the visible output.
bats_require_minimum_version 1.5.0

# bats test_tags=task:1
test_print_shopping_list_name() { # @test
    run --keep-empty-lines bash shopping.sh shopping-list.txt

    assert_success
    assert_line --index 0 "Ingredients for pancakes"
}

# bats test_tags=task:1
test_read_shopping_list_name_from_file() { # @test
    list_file="${BATS_TEST_TMPDIR}/different-shopping-list.txt"
    printf 'A different shopping list\n' > "$list_file"

    run --keep-empty-lines bash shopping.sh "$list_file"

    assert_success
    assert_line --index 0 "A different shopping list"
}

# bats test_tags=task:2
test_count_shopping_list_lines() { # @test
    run --keep-empty-lines bash shopping.sh shopping-list.txt

    assert_success
    assert_line --index 1 ""
    # `wc` output formatting (padding of the count) varies between
    # implementations (e.g. GNU vs BSD/macOS), so match loosely.
    assert_line --index 2 --regexp '^[[:space:]]*21[[:space:]]+shopping-list\.txt$'
}

# bats test_tags=task:3
test_print_buttermilk_substitution() { # @test
    run bash shopping.sh shopping-list.txt

    assert_success
    # `wc` output formatting (padding of the count) varies between
    # implementations (e.g. GNU vs BSD/macOS), so match loosely.
    assert_output --regexp '^Ingredients for pancakes

[[:space:]]*21[[:space:]]+shopping-list\.txt

The substitution for buttermilk is    regular milk$'
}
