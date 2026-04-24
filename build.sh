#!/usr/bin/env bash
# Build slides: reads slide-order manifest, concatenates _head.html + slides + _foot.html → index.html
# To add a slide: create slides/<name>.html and add its filename to slide-order (one per line).
# To reorder: move lines in slide-order. No file renaming needed.
set -euo pipefail

OUT="index.html"

cat _head.html > "$OUT"
echo "" >> "$OUT"

while IFS= read -r slide || [[ -n "$slide" ]]; do
  [[ -z "$slide" || "$slide" == \#* ]] && continue   # skip blanks and comments
  f="slides/$slide"
  if [[ ! -f "$f" ]]; then
    echo "ERROR: slide not found: $f" >&2; exit 1
  fi
  cat "$f" >> "$OUT"
  echo "" >> "$OUT"
done < slide-order

cat _foot.html >> "$OUT"

echo "Built $OUT  ($(wc -l < "$OUT") lines)"
