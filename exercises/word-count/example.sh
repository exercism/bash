#!/bin/bash

init_var=$(echo -e "$1" | tr -d '!@$%^&:.')
preprocessed_var=$(echo "${init_var//[$'\n,']/ }" | tr '[:upper:]' '[:lower:]')

read -r -a words <<< "$preprocessed_var"
declare -a control_map
declare -A word_count_map

for el in "${words[@]}"; do
  el="${el#\'}" el="${el%\'}"
  if [[ "${control_map[@]}" =~ "$el" ]]; then
    continue
  else
    control_map+=("$el")
  fi
done

for word in ${words[@]}; do
  word="${word#\'}" word="${word%\'}"
  ((word_count_map['$word']++))
done

for word in "${control_map[@]}"; do
  echo "$word: ${word_count_map[$word]}"
done
exit 0
