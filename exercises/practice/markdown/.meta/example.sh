#!/usr/bin/env bash

shopt -s extglob

# globals
in_list=false
html=""

main() {
    local file=$1
    local -i n

    while IFS= read -r line; do

        # Handle inline formatting.
        #
        # My method of scanning for strong and emphasized
        # text (using regular expressions) is not entirely
        # correct: I don't handle intermingled markup quite
        # right.  For example:
        #
        #     some _italic and __bold italic___ text
        #
        # is rendered as
        #
        #     some <em>italic and <strong>bold italic</em></strong> text
        #     ......^^.............^^^^^^..............^^...^^^^^^......
        #
        # instead of
        #
        #     some <em>italic and <strong>bold italic</strong></em> text
        #     ......^^.............^^^^^^..............^^^^^^...^^.......
        #
        # This is a consequence of regex greedy matching.
        # See below for more details.

        line=$(strong "$line")
        line=$(em "$line")

        # Check for a list item

        if [[ $line == "* "* ]]; then
            open_list
            html+="<li>${line#??}</li>"

        else
            close_list

            # Check for a heading

            if [[ $line =~ ^("#"{1,6})" "(.*) ]]; then
                n=${#BASH_REMATCH[1]}
                html+=$(printf "<h%d>%s</h%d>" $n "${BASH_REMATCH[2]}" $n)

            else
                # It's a plain paragraph

                html+="<p>$line</p>"
            fi
        fi
    done < "$file"

    close_list

    printf "%s" "$html"
}

open_list() {
    if ! $in_list; then
        html+="<ul>"
        in_list=true
    fi
}

close_list() {
    if $in_list; then
        html+="</ul>"
        in_list=false
    fi
}

em() {
    local line=$1
    while [[ $line =~ ^([^_]*)_([^_]+)_(.*) ]]; do
        printf -v line "%s<em>%s</em>%s" \
            "${BASH_REMATCH[1]}" \
            "${BASH_REMATCH[2]}" \
            "${BASH_REMATCH[3]}"
    done
    printf "%s" "$line"
}

strong() {
    local line=$1
    local orig pre post

    # I'd like to do:
    #     [[ $line =~ ^(.*?)__(.+?)__(.*) ]]
    # but bash doesn't have non-greedy matching.
    # So, we have the nested regexes below.

    while true; do
        orig=$line
        if [[ $line =~ ^(.+)__(.*) ]]; then
            pre=${BASH_REMATCH[1]}
            post=${BASH_REMATCH[2]}
            if [[ $pre =~ ^(.*)__(.+) ]]; then
                printf -v line "%s<strong>%s</strong>%s" \
                    "${BASH_REMATCH[1]}" \
                    "${BASH_REMATCH[2]}" \
                    "$post"
            fi
        fi
        [[ $line == "$orig" ]] && break
    done
    printf "%s" "$line"
}

main "$@"
