#!/usr/bin/env bash

{

echo "#!/usr/bin/env bats"
echo

wget --quiet https://raw.githubusercontent.com/exercism/problem-specifications/master/exercises/yacht/canonical-data.json -O - |
	jq -r '.cases[] | .description + "\t" + (.expected | tostring) + "\t" + .input.category + "\t" + (.input.dice | map((. | tostring) + "\t") | add)' |
	while IFS=$'\t' read desc expected category dice1 dice2 dice3 dice4 dice5 ; do
		if [ "$desc" = "Yacht" ]; then
			skip="#skip"
		else
			skip="skip"
		fi
		cat <<-EOF
			@test '$desc' {
			  $skip
			  run bash yacht.sh "$category" "$dice1" "$dice2" "$dice3" "$dice4" "$dice5"
			  [ "\$status" -eq 0 ]
			  [ "\$output" -eq "$expected" ]
			}

		EOF
	done

} > yacht_test.sh

chmod 0755 yacht_test.sh
