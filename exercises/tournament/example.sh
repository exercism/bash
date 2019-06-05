#!/usr/bin/env bash

declare -A W D L

while IFS=';' read -r home away result; do
    # ignore invalid input
    [[ -z $home || -z $away || -z $result ]] && continue

    for team in "$home" "$away"; do
        if [[ ! -v W[$team] ]]; then
            W[$team]=0
            D[$team]=0
            L[$team]=0
        fi
    done

    case $result in 
        win)  (( W[$home]++ )); (( L[$away]++ )) ;;
        loss) (( L[$home]++ )); (( W[$away]++ )) ;;
        draw) (( D[$home]++ )); (( D[$away]++ )) ;;
        *)    : ;; # ignore it
    esac
done

echo "Team                           | MP |  W |  D |  L |  P"

for team in "${!W[@]}"; do
    mp=$(( W[$team] + D[$team] + L[$team] ))
    p=$(( 3 * W[$team] + D[$team] ))

    printf "%-30s | %2s | %2s | %2s | %2s | %2s\n" \
        "$team" $mp ${W[$team]} ${D[$team]} ${L[$team]} $p

done | sort -t"|" -k6,6nr -k1,1
