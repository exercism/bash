declare -A trans
trans[G]='C'
trans[C]='G'
trans[A]='U'
trans[T]='A'

for i in $(seq 1 ${#1}); do
  nt="${1:$i-1:1}"
  comp_nt="${trans[$nt]}"

  if [ -z "$comp_nt" ]; then
    echo 'Invalid nucleotide detected.'
    exit 1
  fi

  complement="$complement$comp_nt"
done

echo $complement

