{
	for (field_index = 1; field_index <= NF; field_index++)
	{
		result[$field_index]++;
	}
}
END {
	for (field_index in result)
	{
		printf "%s: %d\n", field_index, result[field_index];
	}
}