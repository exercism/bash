#!/usr/bin/env bash


colors=(
    black brown red orange yellow 
    green blue violet grey white
)

code() {
    local code="" i
    for i in "${!colors[@]}"; do
        if [[ ${colors[i]} == "$1" ]]; then
            code=$i
            break
        fi
    done

    if [[ -n $code ]]; then
        echo "$code"
    else
        echo "invalid color: $1" >&2
        return 1
    fi
}

# silently ignore extra colors
result=""
for color in "$1" "$2"; do 
    if code=$(code "$color"); then
        result+="$code"
    else
        exit 1
    fi
done
echo "${result#0}"
