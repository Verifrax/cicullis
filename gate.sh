#!/usr/bin/env bash
set -euo pipefail

# CICULLIS default: no-op PASS unless explicit policy env is set.
# This keeps Marketplace smoke green while preserving deterministic "fail-closed" option.
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
