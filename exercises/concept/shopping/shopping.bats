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
test_list_required_ingredients() { # @test
    run --keep-empty-lines bash shopping.sh shopping-list.txt

    assert_success
    assert_line --index 1 ""
    assert_line --index 2 "Required ingredients"
    assert_line --index 3 "1 cup flour"
    assert_line --index 4 "0.25 cup sugar"
    assert_line --index 5 "1 teaspoon baking powder"
    assert_line --index 6 "0.25 teaspoon baking soda"
    assert_line --index 7 "1 pinch salt"
    assert_line --index 8 "1 cup buttermilk"
    assert_line --index 9 "1 egg"
    assert_line --index 10 "1 tablespoon melted butter"
}

# bats test_tags=task:2
test_read_required_ingredients_from_file() { # @test
    list_file="${BATS_TEST_TMPDIR}/different-shopping-list.txt"

    cat > "$list_file" <<'EOF'
A different shopping list

Coupon: free syrup with any pancake mix

Required ingredients
2 cups oats
3 bananas
EOF

    run --keep-empty-lines bash shopping.sh "$list_file"

    assert_success
    assert_line --index 0 "A different shopping list"
    assert_line --index 1 ""
    assert_line --index 2 "Required ingredients"
    assert_line --index 3 "2 cups oats"
    assert_line --index 4 "3 bananas"
    assert_line --index 5 ""
    assert_line --index 6 "The substitution for buttermilk is    regular milk"
}

# bats test_tags=task:3
test_print_buttermilk_substitution() { # @test
    run bash shopping.sh shopping-list.txt

    assert_success
    assert_output 'Ingredients for pancakes

Required ingredients
1 cup flour
0.25 cup sugar
1 teaspoon baking powder
0.25 teaspoon baking soda
1 pinch salt
1 cup buttermilk
1 egg
1 tablespoon melted butter

The substitution for buttermilk is    regular milk'
}
