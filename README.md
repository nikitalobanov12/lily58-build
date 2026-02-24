# lily58-build

Personal Lily58 QMK source-of-truth repo.

## Why this exists

- `*.uf2` files are build artifacts, not editable source.
- The source of truth lives here under `keyboards/lily58/keymaps/<keymap_name>/`.
- Every build/export goes through scripts so there is one consistent flow.

## Repo structure

- `keyboards/lily58/keymaps/<keymap_name>/keymap.c`
- `keyboards/lily58/keymaps/<keymap_name>/rules.mk`
- `keymaps/<keymap_name>.json` (export snapshot)
- `keymaps/latest.json` (latest export alias)
- `firmware/*.uf2` (local build artifacts, gitignored)
- `scripts/` (sync/build/export workflow)

## Naming convention

Use date-based keymap names:

- `lily58_2026_02_23_devsymbols`
- `lily58_2026_02_24_media_fix`

This makes history obvious and prevents "which file is newest?" confusion.

## Workflow

1. Edit the keymap source in this repo.
2. Sync to your local QMK checkout.
3. Compile firmware.
4. Export JSON snapshot.

### 1) Sync to QMK

```bash
./scripts/sync-to-qmk.sh <keymap_name>
```

Default QMK directory is `~/keychron_qmk`. Override with `QMK_DIR=/path/to/qmk`.

### 2) Build UF2

```bash
./scripts/build-keymap.sh <keymap_name>
```

This script:
- syncs the keymap into QMK
- runs `qmk compile -kb lily58/rev1 -km <keymap_name> -e CONVERT_TO=helios`
- copies output to:
  - `firmware/<timestamp>_<keymap_name>.uf2`
  - `firmware/latest.uf2`

### 3) Export JSON snapshot

```bash
./scripts/export-json.sh <keymap_name>
```

This script writes:
- `keymaps/<keymap_name>.json`
- `keymaps/latest.json`

## Recommended release checklist

- Build succeeds via `./scripts/build-keymap.sh <keymap_name>`
- Flash `firmware/latest.uf2`
- Smoke test: base layer, symbols, nav, media keys
- Export snapshot with `./scripts/export-json.sh <keymap_name>`
- Commit `keymap.c`, `rules.mk`, and JSON snapshot together
