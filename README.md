# lily58-build

Personal Lily58 QMK setup and keymap history.

## Contents

- `keyboards/lily58/keymaps/lily58_feb16/keymap.c`
- `keyboards/lily58/keymaps/lily58_feb16/rules.mk`
- `keymaps/lily58_feb16.json` (exported from current keymap)

## Layer Diagram

Layer names in this setup:

- Layer 0: Base
- Layer 1: Lower (`MO(1)`)
- Layer 2: Raise (`MO(2)`)

### Layer 0 (Base)

```text
`   1   2   3   4   5        6   7   8   9   0   =
Tab Q   W   E   R   T        Y   U   I   O   P   -
Caps A  S   D   F   G        H   J   K   L   ;   '
Shift Z X   C   V   B        [   ]   N   M   ,   .
        /   Bspc Gui Alt Lwr  Spc Ent Rse PgDn PgUp
```

### Layer 1 (Lower)

```text
TRNS TRNS TRNS TRNS TRNS TRNS   TRNS TRNS TRNS TRNS TRNS TRNS
F1   F2   F3   F4   F5   F6     F7   F8   F9   F10  F11  F12
Caps !    @    #    $    %      ^    &    *    (    )    ~
Shift TRNS TRNS TRNS TRNS TRNS  TRNS TRNS NO   _    +    {
       }    Del  TRNS Alt TRNS  Pscr MO(3) TRNS TRNS
```

### Layer 2 (Raise)

```text
TRNS TRNS TRNS TRNS TRNS TRNS   MPrv MPlay MNext Mute Vol- Vol+
`    1    2    3    4    5      6    7     8     9    0    TRNS
Caps F2   F3   F4   F5   F6     Left Down  Up    Right NO   NO
Shift F8  F9   F10  F11  F12    LCtrl LAlt LGui  Shift TRNS TRNS
       TRNS Del  TRNS Alt TRNS  TRNS TRNS TRNS TRNS
```

## Build

Run from your QMK checkout:

```bash
qmk compile -kb lily58/rev1 -km lily58_feb16 -e CONVERT_TO=helios
```

## Refresh JSON export

Run from your QMK checkout:

```bash
qmk c2json -kb lily58/rev1 -km lily58_feb16 -o /path/to/lily58-build/keymaps/lily58_feb16.json
```

Output UF2:

```bash
lily58_rev1_lily58_feb16_helios.uf2
```
