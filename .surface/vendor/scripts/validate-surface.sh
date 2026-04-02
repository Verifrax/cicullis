#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

fail=0

echo "[SURFACE_VALIDATE]"

for f in \
  "$ROOT/README.md" \
  "$ROOT/COPY_RULES.md" \
  "$ROOT/INTEGRATION_RULES.md" \
  "$ROOT/tokens/tokens.css" \
  "$ROOT/shell/base.css" \
  "$ROOT/templates/root.html" \
  "$ROOT/templates/reference.html" \
  "$ROOT/templates/tool.html" \
  "$ROOT/templates/status.html"
do
  if [ -f "$f" ]; then
    echo "OK   ${f#$ROOT/}"
  else
    echo "FAIL ${f#$ROOT/} :: missing"
    fail=1
  fi
done

for f in "$ROOT"/host-profiles/*.json; do
  python3 - <<PY "$f" >/dev/null || { echo "FAIL ${f#$ROOT/} :: invalid json"; fail=1; }
import json, pathlib, sys
json.loads(pathlib.Path(sys.argv[1]).read_text())
PY
  echo "OK   ${f#$ROOT/}"
done

grep -q "VERIFRAX-SURFACE controls form." "$ROOT/README.md" || { echo "FAIL README.md :: missing form-control rule"; fail=1; }
grep -qi "host-owning repositories control function and content" "$ROOT/README.md" || { echo "FAIL README.md :: missing function-control rule"; fail=1; }

if [ "$fail" -eq 0 ]; then
  echo "[SURFACE_VALIDATE_OK]"
else
  echo "[SURFACE_VALIDATE_FAIL]"
  exit 1
fi
