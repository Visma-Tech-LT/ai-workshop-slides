#!/usr/bin/env bash
# PostToolUse hook: rebuild index.html when a slide-relevant file is written.
# Claude Code passes tool input as JSON on stdin.

input=$(cat)

# Extract file_path from JSON (works without jq)
file_path=$(echo "$input" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null)

if [[ -z "$file_path" ]]; then
  exit 0
fi

case "$file_path" in
  */slides/*.html|*/_head.html|*/_foot.html|*/slide-order)
    cd "$(dirname "$file_path")"
    # Walk up to find build.sh
    while [[ "$PWD" != "/" && ! -f "build.sh" ]]; do cd ..; done
    if [[ -f "build.sh" ]]; then
      bash build.sh >/dev/null 2>&1 && echo "[auto-build] index.html rebuilt"
    fi
    ;;
esac
