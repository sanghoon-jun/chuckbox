# Parts & Materials

Bill of materials for the build. The stored items (stove, cook set, etc.) are not included; see `items.md` for those. Quantities come from the current model in `chuckbox.scad` (25 1/2 × 17 × 25 1/4").

Costs are rough 2026 estimates in USD, not quotes. Check current prices before ordering.

## Aluminum extrusion

Supplier slot types: **A** = 1 slot, **B** = 2 adjacent slots, **C** = 2 opposite slots, **D** = 3 slots, plain 1010 = 4 slots. Each member gets only the slots it needs; this design uses no D or 4-slot profiles.

| Part | Type | Qty | Length | Open slots: what they're for |
|---|---|---|---|---|
| Post, front-left | C | 1 | 24 3/4" | Back face: side panel. Front face: pivot hinges |
| Posts, front-right / back-left / back-right | B | 3 | 24 3/4" | Side panel + back panel. On the front-right post: side panel + outer face for the latch keeper |
| Bottom front + back rails, top front rail | A | 3 | 23 1/2" | Top face. Back rail: back panel. Top front rail: cooktop bolts. Bottom front rail: unused (A is the minimum) |
| Top back rail | C | 1 | 23 1/2" | Top: cooktop bolts. Bottom: back panel |
| Crossbars, base + under middle shelf | A | 6 | 23 1/2" | Top: shelf bolts |
| Crossbars, under top shelf + under cooktop | C | 6 | 23 1/2" | Top: shelf/cooktop bolts. Bottom: divider brackets |
| Bottom side rails | A | 2 | 15" | Top: side panel |
| Top side rails + shelf side rails | C | 6 | 15" | Top + bottom: side panels (top rails: cooktop bolts + panel) |

| Order by type | Qty × length | Inches |
|---|---|---|
| 1010-A | 9 × 23 1/2", 2 × 15" | 241 1/2" |
| 1010-B | 3 × 24 3/4" | 74 1/4" |
| 1010-C | 1 × 24 3/4", 7 × 23 1/2", 6 × 15" | 279 1/4" |
| **Total** | 28 pcs | ~595" (~50 ft) at ~$0.20–0.26/in: **$120–155** |
| Cut to length (if not cutting yourself) | 28 cuts at ~$1.50–2.50/cut | $42–70 |

Smooth faces end up on the outside of the box, so there's nothing to snag or collect dirt, and the profiles weigh slightly less. Per-inch prices for the A/B/C types may differ from standard 1010; check with your supplier.

## Frame joinery

There are 48 joints, one at each end of the 24 rails. The model uses end fastening, so the T-slots stay free for the wall panels: tap each rail end, drill an access hole in the mating post or side rail, and bolt through.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Button-head bolts | 48 (buy 50) | 1/4-20 × 3/4", stainless | $12–15 |
| End taps | 48 | 1/4-20 tap in the profile's center hole | DIY: $15–25 (tap + bits), or service: ~$1.50–2 each ($72–96) |
| Access holes | 48 | Wrench/driver access in the mating member | DIY: incl. above, or service: ~$2–3 each ($96–144) |

## Shelf & cooktop mounting

Countersunk bolts go through the plywood into T-nuts in the crossbar and rail slots, keeping the surfaces flush.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Flat-head (countersunk) bolts | 32 (buy 50) | 1/4-20 × 1", stainless: 3 shelves × 6 + cooktop × 14 | $12–15 |
| Drop-in T-nuts, 10-series | 40 (buy 50) | 1/4-20: 32 for shelves/cooktop + 8 for door hardware | $15–25 generic, ~$40–50 name brand |

## Plywood

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| 1/2" birch plywood | 1 sheet, 4' × 4' | Cooktop 25 1/2 × 17, shelves 3 × 23 1/2 × 15 | $45–70 |
| 1/4" birch plywood | 1 sheet, 4' × 8' or 5' × 5' Baltic | Back 24 × 23 1/4, sides 6 pcs, dividers 4 pcs, door 25 3/8 × 24 5/8 (~16 ft² total) | $40–60 |

Plywood cut list:

| Piece | Thickness | Qty | Size |
|---|---|---|---|
| Base + shelves | 1/2" | 3 | 23 1/2 × 15 |
| Cooktop | 1/2" | 1 | 25 1/2 × 17 |
| Back | 1/4" | 1 | 24 × 23 1/4 |
| Sides (per side, bottom → top) | 1/4" | 2 each | 15 1/2 × 7 1/4, 15 1/2 × 9 1/2, 15 1/2 × 5 1/2 |
| Dividers, middle bay | 1/4" | 2 | 15 × 8 1/2 |
| Dividers, top bay | 1/4" | 2 | 15 × 4 1/2 |
| Door | 1/4" | 1 | 25 3/8 × 24 5/8 |

Panel sizes include `slot_engage` (1/4") on each edge that sits in a slot. Measure how far your sheets actually go into the slot, then set `slot_engage` to match before cutting.

The 1/2" pieces fit a 4' × 4' sheet in three rows: two shelves side by side, then the cooktop, then the third shelf. Total height is about 47.4" with kerfs.

**Slot fit:** The 10-series slot opening is 0.256". 6 mm Baltic birch (0.236") fits better than domestic "1/4 inch" sheets, which can run about 0.20".

## Walls & dividers

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Panel gasket / edge trim | ~32 ft | Takes up slack between the 1/4" panels and the T-slot so they don't rattle | $15–25 |
| Corner braces for dividers | 16 | 1" L-brackets + #6 × 1/2" wood screws, 4 per divider | $10–15 |

## Door

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Pivot hinges | 2 | 10-series compatible, mounted to the front-left post via T-nuts | $20–40 |
| Draw latch | 1 | Stainless toggle/draw latch, right side | $8–15 |

## Optional

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Extrusion end caps | 4 | 10-series, bottom ends of the posts | $4–8 |
| Carry handles | 2 | Side-mounted, via T-nuts | $20–30 |
| Wood finish | 1 qt | Spar urethane or similar: water and heat resistance for the cooktop | $20–25 |
| Second draw latch | 1 | Keeps the 24" door tight at top and bottom in transit | $8–15 |

## Estimated total

| Scenario | Est. cost |
|---|---|
| DIY cutting + tapping | ~$310–460 |
| Supplier cuts + machines everything | ~$510–745 |
| Optional add-ons | +$50–80 |

Most of the difference is machining. Doing the 48 end taps and access holes yourself saves about $150–220.
