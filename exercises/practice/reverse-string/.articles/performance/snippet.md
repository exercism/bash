```bash
while IFS= read -d "" -r -n 1 char; do
    # do something with $char
    echo "$char"
done < <(printf "%s" "$string")
```
