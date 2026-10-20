#!/usr/bin/env bash
# Validate all templates in templates/*.xml: well-formed XML and required fields.
set -euo pipefail
cd "$(dirname "$0")/.."

required=(Name Repository Registry Support Overview Category TemplateURL Icon)
fail=0
shopt -s nullglob
files=(templates/*.xml)

if [ ${#files[@]} -eq 0 ]; then
  echo "No templates found (templates/*.xml) - nothing to validate."
  exit 0
fi

for f in "${files[@]}"; do
  if ! xmllint --noout "$f" 2>/dev/null; then
    echo "FAIL $f: not well-formed XML"; fail=1; continue
  fi
  for tag in "${required[@]}"; do
    val=$(xmllint --xpath "string(/Container/$tag)" "$f" 2>/dev/null || true)
    if [ -z "$val" ]; then
      echo "FAIL $f: missing or empty <$tag>"; fail=1
    fi
  done
  echo "ok   $f"
done
exit $fail
