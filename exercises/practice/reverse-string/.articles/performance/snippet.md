```bash
while IFS= read -d "" -r -n 1 char; do
    echo "$char"
done < <(printf "%s" "$string")
```
