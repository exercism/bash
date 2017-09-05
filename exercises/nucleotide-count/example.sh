#!/bin/bash

input="$1";

a=0
c=0
g=0
t=0

function end() {
        echo "A: ${a}"
        echo "C: ${c}"
        echo "G: ${g}"
        echo "T: ${t}"
	exit
}

if [ ! -n "$input" ]; then
	end
fi

for i in $(seq 1 ${#input}); do
	char=${input:i-1:1}
	if [ "${char}" = "A" ]; then
		a=$((a+1))
	elif [ "${char}" = "C" ]; then
		c=$((c+1))
	elif [ "${char}" = "G" ]; then
		g=$((g+1))
	elif [ "${char}" = "T" ]; then
		t=$((t+1))
	else
		echo "Invalid nucleotide in strand"
		exit 1
	fi
done

end
