#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SURFACE_REPO="${SURFACE_REPO:-$REPO_ROOT/../VERIFRAX-SURFACE}"

if [ ! -d "$SURFACE_REPO/.git" ]; then
  echo "VERIFRAX-SURFACE repo not found at: $SURFACE_REPO" >&2
  exit 1
fi

mkdir -p "$REPO_ROOT/.surface/vendor"
rsync -a --delete "$SURFACE_REPO/tokens/" "$REPO_ROOT/.surface/vendor/tokens/"
rsync -a --delete "$SURFACE_REPO/shell/" "$REPO_ROOT/.surface/vendor/shell/"
rsync -a --delete "$SURFACE_REPO/scripts/" "$REPO_ROOT/.surface/vendor/scripts/"
git -C "$SURFACE_REPO" rev-parse HEAD > "$REPO_ROOT/.surface/SURFACE_SHA"

python3 "$REPO_ROOT/.surface/vendor/scripts/validate_host.py" "$REPO_ROOT/surface.host.json"
python3 "$REPO_ROOT/.surface/vendor/scripts/project_host.py" "$REPO_ROOT"
