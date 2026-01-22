#!/bin/sh
set -eu

ROOT="$(cd "$(dirname "$0")" && pwd)"

ENGINE="$ROOT/engine"
PROFILE="$ROOT/profiles/default.profile"
STATE="$ROOT/internal/state"
LEDGER="$ROOT/internal/ledger"

mkdir -p "$STATE" "$LEDGER"

fail() {
  printf '%s\n' "CI-GATE FAILED"
  printf '%s\n' "$1"
  exit 1
}

# --- Time boundary ----------------------------------------------------------

"$ENGINE/kairoclasp.sh" "$STATE" || fail "TIME_BOUNDARY_VIOLATION"

# --- Custody ---------------------------------------------------------------

"$ENGINE/archicustos.sh" "$PROFILE" || fail "CUSTODY_VIOLATION"

# --- Provenance ------------------------------------------------------------

"$ENGINE/originseal.sh" "$STATE" || fail "PROVENANCE_VIOLATION"

# --- Boundary enforcement --------------------------------------------------

"$ENGINE/limenward.sh" "$PROFILE" || fail "BOUNDARY_VIOLATION"

# --- Deterministic verification -------------------------------------------

"$ENGINE/validexor.sh" "$PROFILE" || fail "VERIFICATION_VIOLATION"

# --- Attestation -----------------------------------------------------------

"$ENGINE/attestorium.sh" "$LEDGER" || fail "ATTESTATION_FAILURE"

# --- Judgment --------------------------------------------------------------

"$ENGINE/irrevocull.sh" || fail "JUDGMENT_FAILED"

# --- Optional execution (hard finality) ------------------------------------

if [ "${CI_CICULLIS_EXECUTE:-0}" = "1" ]; then
  "$ENGINE/guillotine.sh" || fail "EXECUTION_REFUSED"
fi

exit 0
