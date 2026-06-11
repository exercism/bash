#!/usr/bin/env bash

shopt -s extglob

main () {
    local word="$1"
    local date="$2"

    case "$word" in
            "NOW" ) convert_now        "$date"               ;;
           "ASAP" ) convert_asap       "$date"               ;;
            "EOW" ) convert_eow        "$date"               ;;
        +([0-9])M ) convert_variable_m "$date" "${word::-1}" ;;
        Q+([0-9]) ) convert_variable_q "$date" "${word:1}"   ;;
                * ) echo "This should not happen"            ;;
    esac
}

convert_now() {
    local date="$1"
    local due_date

    due_date=$(date -d "$date 2 hours" +%FT%T)

    echo "$due_date"
}

convert_asap() {
    local date="$1"
    local meeting_hour due_date

    meeting_hour=${date:11:2}

    if (( $((10#$meeting_hour)) < 13 )); then
        due_date=$(date -d "$date" +%F)
        due_date=$(date -d "$due_date 17:00" +%FT%T)
    else
        due_date=$(date -d "$date 1 day" +%F)
        due_date=$(date -d "$due_date 13:00" +%FT%T)
    fi

    echo "$due_date"
}

convert_eow() {
    local date="$1"
    local meeting_date meeting_weekday due_date

    meeting_date=$(date -d "$date" +%F)
    meeting_weekday=$(date -d "$date" +%u)

    if (( meeting_weekday == 1 || meeting_weekday == 2 || meeting_weekday == 3)); then
        due_date=$(date -d "$meeting_date +$(( (5 - meeting_weekday + 7) % 7 )) days" +%F)
        due_date=$(date -d "$due_date 17:00" +%FT%T)
    else
        due_date=$(date -d "$meeting_date +$(( (7 - meeting_weekday + 7) % 7 )) days" +%F)
        due_date=$(date -d "$due_date 20:00" +%FT%T)
    fi

    echo "$due_date"
}

convert_variable_m() {
    local date="$1"
    local due_month="$2"
    local meeting_year meeting_month due_weekday due_date

    meeting_year=$(date -d "$date" +%Y)
    meeting_month=$(date -d "$date" +%m)

    if (( meeting_month < due_month )); then
        due_date=$(date -d "${meeting_year}-${due_month}-01" +%F)
    else
        due_date=$(date -d "$(( meeting_year + 1 ))-${due_month}-01" +%F)
    fi

    due_weekday=$(date -d "$due_date" +%u)

    if (( due_weekday == 6 || due_weekday == 7 )); then
        due_date=$(date -d "$due_date +$(( (1 - due_weekday + 7) % 7 )) days" +%F)
    fi

    due_date=$(date -d "$due_date 08:00" +%FT%T)

    echo "$due_date"
}

convert_variable_q() {
    local date="$1"
    local due_quarter="$2"
    local meeting_year meeting_month meeting_quarter due_month due_weekday due_date

    declare -A QUARTER=(
        [1]=3
        [2]=6
        [3]=9
        [4]=12
    )

    meeting_year=$(date -d "$date" +%Y)
    meeting_month=$(date -d "$date" +%m)
    meeting_quarter=$(( (meeting_month + 2) / 3 ))
    due_month=${QUARTER[$due_quarter]}

    if (( meeting_quarter > due_quarter )); then
        due_date=$(date -d "$(( meeting_year + 1 ))-${due_month}-01" +%F)
    else
        due_date=$(date -d "${meeting_year}-${due_month}-01" +%F)
    fi

    due_date=$(date -d "$due_date +1 month -1 day" +%F)
    due_weekday=$(date -d "$due_date" +%u)

    while (( due_weekday == 6 || due_weekday == 7 )); do
        (( due_weekday-- ))
        due_date=$(date -d "$due_date -1 day" +%F)
    done

    due_date=$(date -d "$due_date 08:00" +%FT%T)

    echo "$due_date"
}

main "$@"
