#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <keymap_name>"
  exit 1
fi

KEYMAP_NAME="$1"
KEYBOARD="${KEYBOARD:-lily58/rev1}"
QMK_DIR="${QMK_DIR:-$HOME/keychron_qmk}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$REPO_DIR/keymaps"

mkdir -p "$OUT_DIR"

qmk c2json -kb "$KEYBOARD" -km "$KEYMAP_NAME" -o "$OUT_DIR/${KEYMAP_NAME}.json"
cp "$OUT_DIR/${KEYMAP_NAME}.json" "$OUT_DIR/latest.json"

echo "Exported: $OUT_DIR/${KEYMAP_NAME}.json"
echo "Latest:   $OUT_DIR/latest.json"
