#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <keymap_name> [qmk_dir]"
  exit 1
fi

KEYMAP_NAME="$1"
QMK_DIR="${2:-${QMK_DIR:-$HOME/keychron_qmk}}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SRC_DIR="$REPO_DIR/keyboards/lily58/keymaps/$KEYMAP_NAME"
DST_DIR="$QMK_DIR/keyboards/lily58/keymaps/$KEYMAP_NAME"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Missing source keymap directory: $SRC_DIR"
  exit 1
fi

if [[ ! -d "$QMK_DIR/keyboards/lily58/keymaps" ]]; then
  echo "Missing QMK lily58 keymaps directory: $QMK_DIR/keyboards/lily58/keymaps"
  exit 1
fi

mkdir -p "$DST_DIR"
rsync -a --delete "$SRC_DIR/" "$DST_DIR/"

echo "Synced $KEYMAP_NAME to $DST_DIR"
