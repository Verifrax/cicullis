#!/usr/bin/env bash
set -euo pipefail

# stable exit codes:
# 0 = PASS
# 1 = FAIL (policy)
# 2 = INVALID (configuration)
die_invalid(){ echo "CI-GATE INVALID: $1" >&2; exit 2; }

mode="${CICULLIS_MODE:-pass}"
profile_path="${CICULLIS_PROFILE:-}"

# args: --profile <path> (required by Integrity Checks/malformed-profile-test)
while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile)
      [[ $# -ge 2 ]] || die_invalid "PROFILE_ARG_MISSING"
      profile_path="$2"
      shift 2
      ;;
    --mode)
      [[ $# -ge 2 ]] || die_invalid "MODE_ARG_MISSING"
      mode="$2"
      shift 2
      ;;
    -h|--help)
      echo "usage: gate.sh [--mode pass|enforce] [--profile PATH]"
      exit 0
      ;;
    *)
      die_invalid "UNKNOWN_ARG:$1"
      ;;
  esac
done

# pre-mode config validity (even in pass)
if [[ -n "${profile_path:-}" ]]; then
  [[ -f "$profile_path" ]] || die_invalid "PROFILE_NOT_FOUND"
  if ! python3 - <<'PY' "$profile_path" >/dev/null 2>&1; then
import json, sys
with open(sys.argv[1], "r", encoding="utf-8") as fp:
  json.load(fp)
PY
    die_invalid "MALFORMED_PROFILE"
  fi
fi

case "$mode" in
  pass)
    echo "CICULLIS: pass (default). Set CICULLIS_MODE=enforce to activate enforcement."
    exit 0
    ;;
  enforce)
    echo "CICULLIS: enforce requested, but no policy configured in this runner."
    echo "Set CICULLIS_POLICY or vendor your policy checks."
    exit 1
    ;;
  *)
    die_invalid "INVALID_MODE:$mode"
    ;;
esac
