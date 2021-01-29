#!/usr/bin/env bash

# local version: 1.4.0.0

# uses external tool: mktemp

setup()    { export MD_FILE=$( mktemp ); }
teardown() { rm -f "$MD_FILE"; }


@test "parses normal text as a paragraph" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
This will be a  paragraph
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<p>This will be a  paragraph</p>" ]]
}

@test "parsing italics" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
_This will be italic_
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<p><em>This will be italic</em></p>" ]]
}

@test "parsing multiple italics" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
This _will_ be italic and this _won't_ be.
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<p>This <em>will</em> be italic and this <em>won't</em> be.</p>" ]]
}

@test "parsing bold text" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
__This will be bold__
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<p><strong>This will be bold</strong></p>" ]]
}

@test "mixed normal, italics and bold text" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
This will _be_ __mixed__
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<p>This will <em>be</em> <strong>mixed</strong></p>" ]]
}

@test "with h1 header level" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
# This will be an h1
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<h1>This will be an h1</h1>" ]]
}

@test "with h2 header level" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
## This  will be an h2
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<h2>This  will be an h2</h2>" ]]
}

@test "with h6 header level" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
###### This will be an h6
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<h6>This will be an h6</h6>" ]]
}

@test "unordered lists" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
      cat <<END >"$MD_FILE"
* Item 1
* Item 2
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<ul><li>Item 1</li><li>Item 2</li></ul>" ]]
}

@test "With a little bit of everything" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
      cat <<END >"$MD_FILE"
# Header!
* __Bold Item__
* _Italic Item_
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>" ]]
}

@test "with markdown symbols in the header text that should not be interpreted" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
# This is a header with # and * in the text
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<h1>This is a header with # and * in the text</h1>" ]]
}

@test "with markdown symbols in the list item text that should not be interpreted" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END >"$MD_FILE"
* Item 1 with a # in the text
* Item 2 with * in the text
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<ul><li>Item 1 with a # in the text</li><li>Item 2 with * in the text</li></ul>" ]]
}

@test "with markdown symbols in the paragraph text that should not be interpreted" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END > "$MD_FILE"
This is a paragraph with # and * in the text
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<p>This is a paragraph with # and * in the text</p>" ]]
}

@test "unordered lists close properly with preceding and following lines" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    cat <<END >"$MD_FILE"
# Start a list
* Item 1
* Item 2
End a list
END
    run bash markdown.sh "$MD_FILE"
    (( status == 0 ))
    [[ $output == "<h1>Start a list</h1><ul><li>Item 1</li><li>Item 2</li></ul><p>End a list</p>" ]]
}
