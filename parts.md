# Parts & Materials

Bill of materials for the build. The stored items (stove, cook set, etc.) are not included; see `items.md` for those. Quantities come from the current model in `chuckbox.scad` (627 × 400 × 432 mm). All sizes in mm.

Costs are rough 2026 estimates in USD, not quotes. Check current prices before ordering.

## Aluminum extrusion

TNUTZ **EXM-2020**: 20 × 20 mm, 4 open T-slots, slot opening 6.00 ± 0.30 mm, center bore ⌀5.48 mm, 0.454 kg/m, Ix = Iy = 0.67 cm⁴. Cut lengths are on the supplier's 1/16" grid. The only crossbars are the two in the top frame that the stove stands on; elsewhere the plywood spans between the rails on its own.

| Part | Qty | Length | Order as | Use |
|---|---|---|---|---|
| Posts | 4 | 414.3 mm | 16 5/16" | Corners. Front-left: door hinges (front face). Front-right: latch strike. All four: lid struts (outer side face) |
| Front + back rails, top and bottom | 4 | 587.4 mm | 23 1/8" | Bottom: base bolts. Bottom back + top back: back panel. Top front + back: lid latches (outer face) |
| Side rails, top and bottom | 4 | 360.4 mm | 14 3/16" | Side panels. Bottom: base bolts. Top: lid hinges (outer face) |
| Shelf side rails | 2 | 360.4 mm | 14 3/16" | Side panels above and below; shelf brackets on the inner face |
| Top crossbars | 2 | 360.4 mm | 14 3/16" | Front to back in the top frame, 30 mm in from the side rails. The stove stands on them with the lids open; set the spacing to the stove's feet |
| **Total** | 16 pcs | 6.90 m (~272") | | at ~$0.15–0.22/in: **$41–60** |
| Cut to length (if not cutting yourself) | 16 cuts | | | ~$1.50–2.50/cut: $24–40 |

Unused slots stay open. Slot covers are optional, under Optional below.

## Frame joinery

There are 24 joints, one at each end of the 12 rails and crossbars. The rail ends are end-tapped and bolted through an access hole in the mating post or rail, so the T-slots stay free for the wall panels. The ⌀5.48 mm center bore is too large for M5, so the end tap is **M6**. Confirm the thread TNUTZ uses for 20-series end taps before buying bolts.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Button-head bolts | 24 (buy 30) | M6 × 12, stainless (match the supplier's end-tap thread) | $6–9 |
| End taps | 24 | M6 tap in the profile's ⌀5.48 mm center bore (partial thread; supplier tapping recommended) | DIY: $10–20 (tap + bits), or service: ~$1.50–2 each ($36–48) |
| Access holes | 24 | Wrench/driver access in the mating post or rail | DIY: incl. above, or service: ~$2–3 each ($48–72) |

## Base & shelf mounting

- **Base:** Full footprint (627.4 × 400.4) under the frame, bolted up into the bottom slots of the four bottom rails. The bottom-bay gear sits on it inside the ring of bottom rails, so it lifts ~20 mm over the bottom front rail to come out. The legs bolt to it directly.
- **Shelf:** Full depth, stopping 3 mm behind the closed inset door (its front edge is the door stop), notched around the corner posts. Rests on the shelf side rails, held by 4 angle brackets (2 per side) bolted into the rails' inner slots. The plywood is through-bolted to each bracket; 9 mm is too thin for wood screws to grip well.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Flat-head (countersunk) bolts | 10 (buy 15) | M5 × 14, stainless, up through the base into T-nuts: 3 front, 3 back, 2 per side | $4–6 |
| Angle brackets | 4 | 2020 L-bracket, 20 × 20 mm legs, for the shelf | $4–6 |
| Bracket bolts | 4 + 4 | Rail side: M5 × 10 button head into a T-nut. Plywood side: M5 × 20 countersunk through the plywood and bracket leg, nylon-insert nut below | $3–5 |
| Drop-in T-nuts, 20-series | ~45 (buy 50) | M5: 10 base, 4 shelf brackets, 1 latch strike, 8 lid hinges, 8 lid latches, 4 strut pivots, ~8 leg bolts that land under a rail (door hinge T-nuts come with the hinges) | $12–20 |

## Plywood

Baltic birch is sold in metric thicknesses, so it matches the model directly.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| .354" (9 mm) Baltic birch | ~0.73 m² of laser-cut parts | Base, shelf, 2 lids | $40–75 |
| .125" (3.2 mm) Baltic birch | ~0.67 m² of laser-cut parts | Back, 4 side panels, 2 dividers | $15–30 |
| 6 mm Baltic birch | 1 laser-cut part | Door | $15–25 |

Plywood cut list:

| Piece | Thickness | Qty | Size (mm) |
|---|---|---|---|
| Base (under the frame) | 9 | 1 | 627.4 × 400.4 |
| Shelf (onto both shelf side rails, 9 mm back from the front) | 9 | 1 | 601.2 × 378.3, corner notches 6.9 × 11 at the front, 6.9 × 6.9 at the back |
| Lids (left and right halves, 3 mm seam) | 9 | 2 | 312.2 × 400.4 |
| Back | 3.2 | 1 | 597.4 × 384.3 |
| Sides (per side, bottom → top) | 3.2 | 2 each | 370.4 × 197.9, 370.4 × 176.4 |
| Dividers, bottom bay | 3.2 | 2 | 360.4 × 227.9 |
| Door (inset, 3 mm gap all round) | 6 | 1 | 581.4 × 368.3. Laser-cut the 4 hinge bolt holes as 1.5 mm side-to-side slots for adjustment, plus the latch hole |

Panel sizes include `slot_engage` (5 mm) on each edge that sits in a slot. Measure how far your sheets actually go into the slot, then set `slot_engage` to match before cutting.

Wherever plywood rests on a rail whose top slot holds a wall panel, it stops 1.5 mm short of the panel. That leaves about 5.5 mm of bearing.

The plywood is ordered as laser-cut parts, so the sizes above go straight to the supplier. The largest piece is the 627.4 × 400.4 mm base; check it's within the supplier's maximum part size. Laser cutting leaves darkened edges, so sand them lightly before sealing.

**Sealing:** Coat the lids on **both faces and all edges** with 3–4 coats of spar urethane or marine varnish (listed under Optional). The top face takes the weather when closed, and the underside becomes the table surface when open. Seal the door the same way; uneven sealing makes plywood warp, and a warped inset door rubs.

**Slot fit:** The slot opening is 6.00 ± 0.30 mm. The 3.2 mm wall panels drop in easily; a rubber panel gasket fills the remaining ~2.8 mm so they don't rattle. Pick a gasket made for a 3 mm panel in a 6 mm slot.

## Walls & dividers

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Panel gasket | ~6.5 m | Rubber U-channel / panel retainer for 3 mm panels in the 6 mm slot, around every wall panel edge | $8–12 |
| Corner braces for dividers | 8 | 25 mm L-brackets, 2 at the bottom (into the base) and 2 at the top (into the shelf) of each divider. Into the 9 mm plywood: #6 × 1/4" wood screws. Through the 3.2 mm divider: M3 × 8 bolts + nylon-insert nuts (a screw would poke through) | $6–10 |
| Strap for the dish set | 1 | Keeps the dish set together standing on edge behind the cook set | $3–5 |

## Door

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Hinges | 2 | TNUTZ **HI-020** (80/20 #12255 equivalent), steel, black powder coat, 37 lb each, ~$4.95. Kit includes 4 × M5 × 10 flat heads + 4 T-nuts: the frame leaf uses 2 of each on the front-left post's front face. Both leaves lie flat on the front faces, pin in the 3 mm gap. T-nuts slide in the slot for up/down adjustment | $10 |
| Door-leaf bolts | 4 + 4 | M5 × 16 flat head through the hinge leaf and the 6 mm door from the front, nylon-insert nut inside | $2–3 |
| Door stop strip | ~540 mm | 3 mm rubber strip on the shelf's front edge; the closed door rests against it | $3–5 |
| Compression latch | 1 | Keyed quarter-turn compression latch (Southco E3-style), short grip for a 6 mm door (or add a spacer). Mounted 30 mm in from the door's right edge at mid-height; pulls the door tight against the stop | $10–25 |
| Latch strike | 1 | Small steel tab or 2020 L-bracket in the front-right post's inward-facing slot (M5 + T-nut), just behind the closed door where the cam hooks it | $2–4 |

## Top lids (flip out as side tables)

The top is two 9 mm lids that meet in a 3 mm seam down the middle. Each is hinged along its outer edge and flips 180° outward, so its closed underside becomes a table surface 19.5 mm above the stove's base. Two fold-up struts on the front and back posts prop each open lid. The struts only press on the lid through a rubber pad, so nothing is fastened to the lid's top face where they touch. With the lids open, the stove comes out of the top bay and stands on the two top crossbars.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Piano hinges | 2 | 2-1/2" open width (~32 mm leaves), aluminum or stainless, cut to 360 mm. Frame leaf on the top side rail's outer face, lid leaf on the lid's top face along the outer edge | $15–30 |
| Frame-leaf bolts | 8 + 8 | M5 × 10 flat head + T-nuts in the top side rail's outer slot, 4 per hinge. Drill and countersink the leaf so the holes land on the slot center, ~20 mm below the pin | $3–5 |
| Lid-leaf bolts | 8 + 8 | M5 × 16 flat head down through the leaf and lid, nylon-insert nut below. Place the holes ~26 mm from the pin so the nuts clear the side rail's inner face | $3–5 |
| Struts | 4 | 230 × 20 × 5 mm aluminum flat bar (6061), rounded ends, rubber pad on the tip. Swung up 45°, the tip lands 163 mm out under the open lid | $10–15 |
| Strut pivots | 4 + 4 | M5 shoulder bolt (or bolt + nylon washers + nylon-insert nut) into a T-nut in the post's outer slot, 262 mm above the frame bottom, so the strut swings freely | $4–8 |
| Strut tip stops | 4 | Small rubber cup or bumper on the lid's top face where each strut tip lands, so a bump can't slide the tip off | $3–5 |
| Strut keepers | 4 | Small magnet or spring clip holding each folded strut against its post for transport | $4–8 |
| Lid latches | 4 | Small stainless draw (toggle) latches, 2 per lid near the seam. Body on the outer face of the top front or back rail (2 × M5 + T-nuts); keeper on the lid's top face, through-bolted with M4 + nylon-insert nuts | $12–20 |

The lid leaf and latch keepers stand about 1.5–3 mm proud of the closed top. Folded, the struts add ~5 mm each side (637 mm wide). Open, the box plus both lids is 1255 mm wide.

## Legs

Four folding hairpin legs, 12.6" (320 mm), solid steel rod with rubber feet, rated 41 lb per leg / 165 lb for all four (Angel Sar, Home Depot model FGAQ8781, 4-pack). Standing, they put the stove's base at about 74 cm and the side tables at about 76 cm. Each leg's mounting plate bolts straight to the base plywood under a corner. All four fold left-right under the box. In each front-and-back pair, the right-hand leg is mounted one leg width further in, so the folded legs pass side by side.

**Check before buying:** the listing only says "folding hinge". Make sure the hinge positively **locks** open (spring catch, pin or detent). A leg that can fold under a sideways bump will drop the box.

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Folding hairpin legs | 4 (1 pack) | 12.6", solid steel rod, black, rubber feet (~0.5 kg each, est.; not listed) | ~$53 |
| Leg bolts | ~16 | M5 × 20 flat head up through the leg plate and base. Where a hole lands under a rail, into a T-nut in the rail's bottom slot; elsewhere a washer and nylon-insert nut on the base inside the bay. The included wood screws won't hold in 9 mm plywood | $4–8 |

The hairpin width (~45 mm), rod size, bracket depth and weight in the model are estimates; measure a leg before drilling the base. Turn the legs so their rod planes don't all face the same way; hairpins are stiff in the plane of the rods but flex across it.

## Optional

| Part | Qty | Spec | Est. cost |
|---|---|---|---|
| Slot covers | ~8 m | Slot cover strip for unused outer slots: cleaner look, nothing to snag | $8–16 |
| Carry handles | 2 | On the shelf side rails' outer slots, one per side, close to the loaded center of mass. Clear of the lid hinges and the folded struts | $15–25 |
| Wood finish | 1 qt | Spar urethane or similar, for the lids and door | $20–25 |
| Second compression latch | 1 | Only if the door bows at the top or bottom | $10–25 |
| Edge seal | ~1.5 m | Bulb seal in the inward-facing slots of the front posts and top rail, touching the door edge: keeps rain and dust out of the 3 mm gap | $5–10 |
| Seam flap | ~400 mm | Adhesive rubber strip on one lid's top edge, overlapping the other lid's, so rain can't run down the center seam. Close the other lid first | $3–5 |

## Estimated total

| Scenario | Est. cost |
|---|---|
| DIY cutting + tapping | ~$300–480 |
| Supplier cuts + machines everything | ~$400–620 |
| Optional add-ons | +$60–105 |

Most of the difference is machining. Doing the 24 end taps and access holes yourself saves about $75–100.
