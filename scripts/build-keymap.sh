#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <keymap_name>"
  exit 1
fi

KEYMAP_NAME="$1"
KEYBOARD="${KEYBOARD:-lily58/rev1}"
CONVERT_TO="${CONVERT_TO:-helios}"
QMK_DIR="${QMK_DIR:-$HOME/keychron_qmk}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FIRMWARE_DIR="$REPO_DIR/firmware"

"$REPO_DIR/scripts/sync-to-qmk.sh" "$KEYMAP_NAME" "$QMK_DIR"

qmk compile -kb "$KEYBOARD" -km "$KEYMAP_NAME" -e "CONVERT_TO=$CONVERT_TO"

UF2_NAME="$(echo "$KEYBOARD" | tr '/' '_')_${KEYMAP_NAME}_${CONVERT_TO}.uf2"
UF2_SRC="$QMK_DIR/$UF2_NAME"

if [[ ! -f "$UF2_SRC" ]]; then
  echo "Expected UF2 not found: $UF2_SRC"
  exit 1
fi

mkdir -p "$FIRMWARE_DIR"
STAMP="$(date +%Y-%m-%d_%H%M)"
UF2_DST="$FIRMWARE_DIR/${STAMP}_${KEYMAP_NAME}.uf2"
cp "$UF2_SRC" "$UF2_DST"
cp "$UF2_SRC" "$FIRMWARE_DIR/latest.uf2"

echo "Built: $UF2_DST"
echo "Latest: $FIRMWARE_DIR/latest.uf2"
