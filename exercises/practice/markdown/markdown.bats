#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

# uses external tool: mktemp

setup()    { export MD_FILE; MD_FILE=$( mktemp ); }
teardown() { rm -f "$MD_FILE"; }


test_parses_normal_text_as_a_paragraph() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
This will be a paragraph
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<p>This will be a paragraph</p>"
}

test_parsing_italics() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
_This will be italic_
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<p><em>This will be italic</em></p>"
}

test_parsing_bold_text() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
__This will be bold__
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<p><strong>This will be bold</strong></p>"
}

test_mixed_normal_italics_and_bold_text() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
This will _be_ __mixed__
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<p>This will <em>be</em> <strong>mixed</strong></p>"
}

test_with_h1_header_level() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
# This will be an h1
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h1>This will be an h1</h1>"
}

test_with_h2_header_level() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
## This will be an h2
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h2>This will be an h2</h2>"
}

test_with_h3_header_level() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
### This will be an h3
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h3>This will be an h3</h3>"
}

test_with_h4_header_level() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
#### This will be an h4
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h4>This will be an h4</h4>"
}

test_with_h5_header_level() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
##### This will be an h5
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h5>This will be an h5</h5>"
}

test_with_h6_header_level() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
###### This will be an h6
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h6>This will be an h6</h6>"
}

test_h7_header_level_is_a_paragraph() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
####### This will not be an h7
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<p>####### This will not be an h7</p>"
}

test_unordered_lists() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
* Item 1
* Item 2
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<ul><li>Item 1</li><li>Item 2</li></ul>"
}

test_with_a_little_bit_of_everything() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
# Header!
* __Bold Item__
* _Italic Item_
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>"
}

test_with_markdown_symbols_in_the_header_text_that_should_not_be_interpreted() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
# This is a header with # and * in the text
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h1>This is a header with # and * in the text</h1>"
}

test_with_markdown_symbols_in_the_list_item_text_that_should_not_be_interpreted() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
* Item 1 with a # in the text
* Item 2 with * in the text
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<ul><li>Item 1 with a # in the text</li><li>Item 2 with * in the text</li></ul>"
}

test_with_markdown_symbols_in_the_paragraph_text_that_should_not_be_interpreted() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
This is a paragraph with # and * in the text
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<p>This is a paragraph with # and * in the text</p>"
}

test_unordered_lists_close_properly_with_preceding_and_following_lines() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
# Start a list
* Item 1
* Item 2
End a list
END
    run bash markdown.sh "$MD_FILE"
    assert_success
    assert_output "<h1>Start a list</h1><ul><li>Item 1</li><li>Item 2</li></ul><p>End a list</p>"
}
