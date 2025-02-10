#!/usr/bin/env bash

readonly Colors=( black brown red orange yellow green blue violet grey white )

main () {
    case "$1" in
        colors)
            printf '%s\n' "${Colors[@]}"
            ;;

        code)
            for idx in "${!Colors[@]}"; do
                if [[ "${Colors[idx]}" == "$2" ]]; then
                    echo "$idx"
                    break
                fi
            done
            ;;
    esac
}

main "$@"
