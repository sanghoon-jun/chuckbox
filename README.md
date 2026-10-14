# T-slot Chuck Box: Design Plan

Overall size: **627 W × 421 D × 555 H mm** (24.7 × 16.6 × 21.8 in): a 542.9 mm frame plus the 12 mm cooktop. All units are mm.

| Closed | Open, with items | Frame, shelves + dividers |
|---|---|---|
| ![Closed](images/closed.png) | ![Open with items](images/open.png) | ![Frame](images/frame.png) |

## Files
- `chuckbox.scad`: parametric OpenSCAD model. Width, depth and bay heights are calculated from the items, then extrusion lengths are rounded up to the supplier's 1/16" cut grid. Press F5 to preview. The console prints the cut list and weight estimate, and the model stops with an error if an item no longer fits.
- `items.md`: the items the box has to hold, with their dimensions.
- [`parts.md`](parts.md): cut list, hardware and materials, with estimated costs.

## Frame
- 2020 (20 × 20 mm) T-slot aluminum extrusion, TNUTZ EXM-2020, all 4 slots open. Chosen to keep weight down.
- Joints are end-tapped M5 and bolted, so they need no slot. See [`parts.md`](parts.md#aluminum-extrusion).

## Shelving (load-bearing)
- 12 mm Baltic birch for the base and the two shelves.
- No crossbars. The plywood spans between rails on its own: the middle shelf at 2× its load sags about 0.5 mm, and its 2020 side rails about 0.1 mm.
- Shelves rest on the shelf side rails and are held by angle brackets in the rails' inner slots.
- The base runs over the front rail and onto the back rail, bolted at the front and bracketed at the back.
- Each bay's clear height runs right up to the plywood above.

## Cooktop (load-bearing)
- 12 mm Baltic birch across the full top, used as the cooking surface.
- Must support the stove plus food and cookware while cooking. A 10 kg point load at the middle of a top rail sags it about 1 mm.
- Sits on the top perimeter rails, secured with countersunk bolts so the surface stays flush.

## Walls (lightweight)
- 6 mm Baltic birch for the side and back panels.
- Panels sit inset directly in the ~6.2 mm T-slots, which saves weight and means no extra brackets.
- Each side wall is split into one panel per bay by the shelf rails. The back is one piece.

## Dividers
- 6 mm Baltic birch, running front to back.
- Each one is fixed with small L-brackets to the plywood below and above. In the middle bay, the dividers also help hold up the top shelf.

## Door
- 6 mm Baltic birch, with a 1.5 mm reveal around the edge.
- Swing style, hinged on the left with pivot hinges.
- Draw latch on the right.

## Bay layout (bottom → top)

| Bay | Clear height | Contents | Dividers |
|---|---|---|---|
| Bottom | 156.8 mm | Coleman Triton+ stove (145 mm) | None |
| Middle | 215.2 mm | Stanley cook set (170 mm), 2 × 1 lb propane cylinders (203 mm), MSR Pika teapot (89 mm) | 2, sized to contents: 280 (cook set) / 115 (propane) / 180.4 (teapot) |
| Top | 114.9 mm | Dish set (216 ⌀ × 76 mm), 1 bin (178 × 368 × 102 mm) | 2, sized to contents: 230 (dish set) / 152 (free) / 193.4 (bin) |

The stove goes at the bottom because it's the heaviest and least-used item. Both propane cylinders stand upright in the middle compartment of the middle bay, one behind the other.

## Weight

**Dry: ~17.4 kg (38.3 lb). Gross: ~28.6 kg (63.1 lb)**, not counting the bin (weight TBD). These are estimates from the model's cut list using typical material weights.

| Component | Basis | Est. weight |
|---|---|---|
| T-slot extrusion | 7.6 m of EXM-2020 at 0.454 kg/m | 3.4 kg |
| 12 mm Baltic birch | 0.96 m² at ~680 kg/m³ | 7.8 kg |
| 6 mm Baltic birch | 1.28 m² at ~680 kg/m³ | 5.2 kg |
| Hardware | Bolts, T-nuts, brackets, hinges, latch | 0.9 kg |
| **Dry weight** | Empty box | **17.4 kg** |
| Items | Stove 3.86, cook set 3.72, propane 2 × ~0.91, teapot 0.15, dish set 1.70 kg (bin: TBD) | 11.2 kg |
| **Gross weight** | Box + items | **28.6 kg** |

## Fit settings

| Setting | Value | Meaning |
|---|---|---|
| `clearance` | 6 mm | Space per side around each stored item |
| `slot_engage` | 5 mm | How far wall panels sit into the T-slot past the extrusion face |
