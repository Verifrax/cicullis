#!/usr/bin/env bash
set -euo pipefail

mode="${CICULLIS_MODE:-pass}"
profile="${CICULLIS_PROFILE:-}"

# Exit codes:
# 0 = pass
# 1 = enforcement fail
# 2 = malformed profile / invalid config
die2(){ echo "CICULLIS: $*" >&2; exit 2; }
die1(){ echo "CICULLIS: $*" >&2; exit 1; }

# Profile validation (always enforced if profile is provided)
if [[ -n "$profile" ]]; then
  [[ -f "$profile" ]] || die2 "profile not found: $profile"
  [[ -s "$profile" ]] || die2 "profile empty: $profile"
  if LC_ALL=C grep -q $'\x00' "$profile" 2>/dev/null; then die2 "profile contains NUL: $profile"; fi
  # Must be valid JSON (selftests expect deterministic malformed=2)
  python3 - "$profile" <<'PY' || exit 2
import json,sys
p=sys.argv[1]
try:
    with open(p,"rb") as f:
        json.load(f)
except Exception:
    raise SystemExit(2)
PY
fi

case "$mode" in
  pass)
    echo "CICULLIS: pass"
    exit 0
    ;;
  enforce)
    [[ -n "$profile" ]] || die2 "enforce requires CICULLIS_PROFILE"
    # Placeholder enforcement: profile contains token "DENY" => exit 1
    if grep -qE '(^|[[:space:]])DENY($|[[:space:]])' "$profile" 2>/dev/null; then
      die1 "policy denied by profile: $profile"
    fi
    echo "CICULLIS: enforce pass (profile=$profile)"
    exit 0
    ;;
  *)
    die2 "invalid CICULLIS_MODE=$mode (use pass|enforce)"
    ;;
esac
