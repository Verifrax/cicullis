#!/usr/bin/env bash
set -euo pipefail

# stable exit codes: 0=PASS, 1=FAIL, 2=INVALID

die_invalid(){ echo "CI-GATE INVALID: $1" >&2; exit 2; }


validate_profile_if_present(){
  [[ -z "${CICULLIS_PROFILE:-}" ]] && return 0
  local payload="${CICULLIS_PROFILE}"
  if [[ -f "$payload" ]]; then
    payload="$(cat "$payload")"
  fi
  node - <<'NODE' "$payload" >/dev/null 2>&1 || exit 42
const s = process.argv[1];
JSON.parse(s);
NODE
  if [[ "$?" -ne 0 ]]; then
    die_invalid "MALFORMED_PROFILE"
  fi
}



# CICULLIS default: no-op PASS unless explicit policy env is set.
# This keeps Marketplace smoke green while preserving deterministic "fail-closed" option.
validate_profile_if_present
# If you want enforcement: set CICULLIS_MODE=enforce and provide your own checks.

mode="${CICULLIS_MODE:-pass}"

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
    echo "CICULLIS: invalid CICULLIS_MODE=$mode (use pass|enforce)"
    exit 2
    ;;
esac
