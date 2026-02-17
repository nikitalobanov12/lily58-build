# lily58-build

Personal Lily58 QMK setup and keymap history.

## Contents

- `keyboards/lily58/keymaps/lily58_feb16/keymap.c`
- `keyboards/lily58/keymaps/lily58_feb16/rules.mk`

## Build

Run from your QMK checkout:

```bash
qmk compile -kb lily58/rev1 -km lily58_feb16 -e CONVERT_TO=helios
```

Output UF2:

```bash
lily58_rev1_lily58_feb16_helios.uf2
```
