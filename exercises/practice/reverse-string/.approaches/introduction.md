
  167  str='Hello, World!'
  168  rev <<< $str
  169  grep -o . <<< $str
  170  grep -o . <<< $str | tac
  171  grep -o . <<< $str | tac | paste -s -d ''
  172  awk -F '' '{for (i = 1, j = NF; i < j; i++, j--) {tmp = $i; $i = $j; $j = tmp}; print $i}' <<< $str
  173  awk -F '' '{for (i = 1, j = NF; i < j; i++, j--) {tmp = $i; $i = $j; $j = tmp}; print}' <<< $str
  174  reverse() { local reversed=""; local i; for ((i = 0; i < ${#1}; i++)); do reversed=${1:i:1}$reversed; done; echo "$reversed"; }
  175  reverse "$str"
  176  set +x
  177  declare -f reverse
  178  set +x
  179  reverse "$str"
  180  reverse2 () { local reversed="" i; for ((i = ${#1} - 1; i >= 0; i--)); do reversed+=${1:i:1}; done; echo "$reversed"; }
  181  reverse "$str"
  182  reverse2 "$str"
  183  reverse3 () { local reversed="" char; while IFS= read -r -d '' char; do reversed=$char$reversed; done < <(printf '%s' "$1"); echo "$reversed"; }
  184  reverse3 "$str"
  185  reverse3 () { local reversed="" char; while IFS= read -r -d '' -n 1 char; do reversed=$char$reversed; done < <(printf '%s' "$1"); echo "$reversed"; }
  186  reverse3 "$str"
  187  printf '%s\n' one two three
  188  printf '%s\n' one two three | rev
  189  printf '%s\n' one two three | tac
  190  printf '%s\n' one two three | tac | rev
  191  echo "$str" | rev
  192  rev <<< "$str"
  193  grep -o . <<< "$str"
  194  grep -o . <<< "$str" | tac
  195  grep -o . <<< "$str" | tac | paste -s -d ''
