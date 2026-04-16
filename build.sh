#!/usr/bin/env bash
# Build slides: concatenates _head.html + slides/*.html (sorted) + _foot.html → index.html
set -euo pipefail

OUT="index.html"

cat _head.html > "$OUT"
echo "" >> "$OUT"

for f in slides/*.html; do
  cat "$f" >> "$OUT"
  echo "" >> "$OUT"
done

cat _foot.html >> "$OUT"

echo "Built $OUT  ($(wc -l < "$OUT") lines)"
