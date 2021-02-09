#!/usr/bin/env bash

# Some global boolean flags
#
# I like to use the builtin commands `true` and `false` as
# boolean values. Then instead of using:
#      if [[ $var == true ]]; then echo something; fi
# we can just rely on the exit status:
#      $var && echo something

case_insensitive=false
filename_only=false
line_numbers=false
full_line=false
inverted=false

main() {
    local opt pattern file
    local OPTIND OPTARG  # when using `getopts` in a function

    # Process options
    while getopts :ilnxv opt; do
        case $opt in
        i) case_insensitive=true ;;
        l) filename_only=true ;;
        n) line_numbers=true ;;
        v) inverted=true ;;
        x) full_line=true ;;
        ?) echo "Unknown option: $OPTARG" >&2 ;;
        esac
    done
    shift $((OPTIND - 1))

    local pattern=$1
    shift

    $case_insensitive && pattern=${pattern,,}
    $full_line        && pattern="^${pattern}$"

    for file; do
        process_file "$file" "$pattern" "$#"
    done
}

process_file() {
    local file=$1 pattern=$2 num_files=$3
    local -i lineno=0

    while IFS= read -r line; do
        (( lineno++ ))
        $case_insensitive && line_cmp=${line,,} || line_cmp=$line

        if { ! $inverted &&   [[ $line_cmp =~ $pattern ]]; } ||
           {   $inverted && ! [[ $line_cmp =~ $pattern ]]; }
        then
            if $filename_only; then
                printf "%s\n" "$file"
                break
            fi
            output "$num_files" "$file" "$lineno" "$line"
        fi
    done < "$file"
}

output() {
    local n=$1 file=$2 lineno=$3 line=$4
    local prefix=""
    (( n > 1 ))   && prefix+="$file:"
    $line_numbers && prefix+="$lineno:"
    printf "%s%s\n" "$prefix" "$line"
}

main "$@"
