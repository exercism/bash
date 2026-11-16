#!/usr/bin/env bash

main() {
    local results=()
    read -ra words <<< "$*"
    for word in "${words[@]}"; do
        results+=( "$(translate "$word")" )
    done
    echo "${results[*]}"
}

translate() {
    if [[ $1 =~ ^([aeiou]|yt|xr) ]]; then
        echo "${1}ay"
    elif [[ $1 =~ ^(.?qu)(.*)       ]] ||
         [[ $1 =~ ^([^aeiou]+)(y.*) ]] ||
         [[ $1 =~ ^([^aeiou]+)(.*)  ]]
    then
        echo "${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay"
    fi
}

main "$@"
