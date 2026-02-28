#!/usr/bin/env bash
set -euo pipefail

mode="${CICULLIS_MODE:-pass}"
profile="${CICULLIS_PROFILE:-}"

# Exit codes (deterministic):
# 0 = pass
# 1 = enforcement fail (policy says NO)
# 2 = malformed profile / invalid configuration

die2(){ echo "CICULLIS: $*" >&2; exit 2; }
die1(){ echo "CICULLIS: $*" >&2; exit 1; }

# If a profile is provided, it must be readable.
if [[ -n "$profile" ]]; then
  [[ -f "$profile" ]] || die2 "profile not found: $profile"
fi

# Minimal "malformed profile" detector:
# - if profile exists but is empty -> malformed
# - if it contains any NUL byte -> malformed
# - if it contains a line starting with "MALFORMED:" -> malformed (test hook)
if [[ -n "$profile" ]]; then
  [[ -s "$profile" ]] || die2 "profile empty: $profile"
  if LC_ALL=C grep -q $'\x00' "$profile" 2>/dev/null; then die2 "profile contains NUL: $profile"; fi
  if grep -qE '^[[:space:]]*MALFORMED:' "$profile" 2>/dev/null; then die2 "profile marked malformed: $profile"; fi
fi

case "$mode" in
  pass)
    echo "CICULLIS: pass"
    exit 0
    ;;
  enforce)
    # No profile => deterministic config error for enforcement mode
    [[ -n "$profile" ]] || die2 "enforce requires CICULLIS_PROFILE"
    # Placeholder for real policy evaluation:
    # If profile contains "DENY" => fail-closed (1), else pass (0)
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
