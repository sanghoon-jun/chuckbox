# Parts & Materials

Bill of materials for the build. The stored items (stove, cook set, etc.) are not included; see `items.md` for those. Quantities come from the current model in `chuckbox.scad` (627 × 421 × 555 mm). All sizes in mm.

Costs are rough 2026 estimates in USD, not quotes. Check current prices before ordering.

## Aluminum extrusion

TNUTZ **EXM-2020**: 20 × 20 mm, 4 open T-slots, 0.454 kg/m, Ix = Iy = 0.67 cm⁴. Cut lengths are on the supplier's 1/16" grid. There are no crossbars; the plywood spans between the rails on its own.

| Part | Qty | Length | Order as | Use |
|---|---|---|---|---|
| Posts | 4 | 542.9 mm | 21 3/8" | Corners. Front-left: pivot hinges. Front-right: latch keeper |
| Front + back rails, top and bottom | 4 | 587.4 mm | 23 1/8" | Bottom front: base bolts. Bottom back: back panel + base brackets. Top: cooktop bolts + back panel |
| Side rails, top and bottom | 4 | 381 mm | 15" | Side panels; top rails also take cooktop bolts |
| Shelf side rails | 4 | 381 mm | 15" | Side panels above and below; shelf brackets on the inner face |
| **Total** | 16 pcs | 7.57 m (~298") | | at ~$0.15–0.22/in: **$45–65** |
| Cut to length (if not cutting yourself) | 16 cuts | | | ~$1.50–2.50/cut: $24–40 |

Unused slots stay open. Slot covers are optional, under Optional below.

## Frame joinery

There are 24 joints, one at each end of the 12 rails. The rail ends are tapped M5 and bolted through an access hole in the mating post, so the T-slots stay free for the wall panels.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Button-head bolts | 24 (buy 25) | M5 × 12, stainless | $5–8 |
| End taps | 24 | M5 tap in the profile's 4.2 mm center hole | DIY: $10–20 (tap + bits), or service: ~$1.50–2 each ($36–48) |
| Access holes | 24 | Wrench/driver access in the mating post | DIY: incl. above, or service: ~$2–3 each ($48–72) |

## Base, shelf & cooktop mounting

- **Base:** Rests on the bottom front rail and the back rail's lip. Bolted to the front rail and held at the back by 2 angle brackets.
- **Shelves:** Each rests on its shelf side rails, held by 4 angle brackets (2 per side) bolted into the rails' inner slots and screwed up into the plywood.
- **Cooktop:** Rests on the top perimeter rails and is bolted to them.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Flat-head (countersunk) bolts | 13 (buy 25) | M5 × 16, stainless: base 3 (front rail), cooktop 10 (3 front, 3 back, 2 per side) | $5–8 |
| Angle brackets | 10 | 2020 L-bracket, 20 × 20 mm legs: 8 for shelves, 2 for base | $8–12 |
| Bracket bolts + wood screws | 10 + 20 | M5 × 10 button head into a T-nut; #6 × 3/8" (3.5 × 10 mm) wood screws into the plywood | $5–8 |
| Drop-in T-nuts, 20-series | 31 (buy 50) | M5: 13 for base/cooktop bolts, 10 for brackets, 8 for door hardware | $10–20 |

## Plywood

Baltic birch is sold in metric thicknesses, so it matches the model directly.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| 12 mm Baltic birch | 1 sheet, 5' × 5' (or a 4' × 4' piece) | Base, 2 shelves, cooktop | $60–90 |
| 6 mm Baltic birch | 1 sheet, 5' × 5' | Back, 6 side panels, 4 dividers, door (~1.3 m²) | $35–55 |

Plywood cut list:

| Piece | Thickness | Qty | Size (mm) |
|---|---|---|---|
| Base (over front rail, onto back rail) | 12 | 1 | 587.4 × 406.5 |
| Shelves (onto both shelf side rails) | 12 | 2 | 598.4 × 381 |
| Cooktop | 12 | 1 | 627.4 × 421 |
| Back | 6 | 1 | 597.4 × 512.9 |
| Sides (per side, bottom → top) | 6 | 2 each | 391 × 158.8, 391 × 217.2, 391 × 116.9 |
| Dividers, middle bay | 6 | 2 | 381 × 215.2 |
| Dividers, top bay | 6 | 2 | 381 × 114.9 |
| Door | 6 | 1 | 624.4 × 539.9 |

Panel sizes include `slot_engage` (5 mm) on each edge that sits in a slot. Measure how far your sheets actually go into the slot, then set `slot_engage` to match before cutting.

Wherever plywood rests on a rail whose top slot holds a wall panel, it stops 1.5 mm short of the panel. That leaves about 5.5 mm of bearing.

The 12 mm pieces fit a 4' × 4' (1220 mm) square in two columns: base and both shelves stacked on the left (about 1177 mm tall with kerfs), and the cooktop turned sideways on the right (421 mm of the remaining 619 mm).

**Slot fit:** The 2020 slot opening is about 6.2 mm (check the supplier spec). 6 mm Baltic birch runs 5.8–6.2 mm, so it should be a snug fit without gasket. Test-fit a scrap first; sand the edges if a panel binds.

## Walls & dividers

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Corner braces for dividers | 16 | 25 mm L-brackets + #6 × 3/8" wood screws: 2 into the plywood below and 2 into the plywood above, per divider | $10–15 |

## Door

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Pivot hinges | 2 | 2020-compatible, mounted to the front-left post with M5 T-nuts | $10–25 |
| Draw latch | 1 | Stainless toggle/draw latch, right side | $8–15 |

## Optional

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Slot covers | ~10 m | 6 mm slot cover strip for unused outer slots: cleaner look, nothing to snag | $10–20 |
| Panel gasket | ~9 m | Only if the 6 mm panels rattle in the slots | $10–15 |
| Extrusion end caps | 4 | 2020, bottom ends of the posts | $3–6 |
| Carry handles | 2 | Side-mounted on the top side rails with M5 T-nuts | $15–25 |
| Wood finish | 1 qt | Spar urethane or similar: water and heat resistance for the cooktop | $20–25 |
| Second draw latch | 1 | Keeps the door tight at top and bottom in transit | $8–15 |

## Estimated total

| Scenario | Est. cost |
|---|---|
| DIY cutting + tapping | ~$210–340 |
| Supplier cuts + machines everything | ~$310–480 |
| Optional add-ons | +$65–105 |

Most of the difference is machining. Doing the 24 end taps and access holes yourself saves about $75–100.
