# T-slot Chuck Box: Design Plan

Overall size: **25 1/2" W × 17" D × 25 1/4" H** (24 3/4" frame + 1/2" cooktop). All units are inches.

## Files
- `chuckbox.scad`: parametric OpenSCAD model. Bay heights, dividers and materials are parameters; frame height and the cut list are calculated from them. Press F5 to preview. The console prints the cut list, and the model stops with an error if an item no longer fits.
- `items.md`: the items the box has to hold, with their dimensions.
- [`parts.md`](parts.md): cut list, hardware and materials, with estimated costs.

## Frame
- 1" (10-series) T-slot aluminum extrusion, chosen to keep weight down.
- Each member uses the slot type (A/B/C/D) with only the slots it needs. Joints are end-tapped and bolted, so they need no slot. See [`parts.md`](parts.md#aluminum-extrusion).

## Shelving (load-bearing)
- 1/2" birch plywood for the base and the two shelves.
- Each shelf sits on its side rails plus 3 aluminum crossbars (front, middle, back), secured with countersunk bolts.

## Cooktop (load-bearing)
- 1/2" birch plywood across the full top, used as the cooking surface.
- Must support the stove plus food and cookware while cooking.
- Sits on the top rails plus 3 aluminum crossbars, secured with countersunk bolts so the surface stays flush.

## Walls (lightweight)
- 1/4" birch plywood for the side and back panels.
- Panels sit inset directly in the T-slots, which saves weight and means no extra brackets.
- Each side wall is split into one panel per bay by the shelf rails. The back is one piece.

## Dividers
- 1/4" birch plywood, running front to back.
- Each one stands on its shelf, fixed with small L-brackets and screwed into the crossbars above.

## Door
- 1/4" birch plywood, with a 1/16" reveal around the edge.
- Swing style, hinged on the left with pivot hinges.
- Draw latch on the right.

## Bay layout (bottom → top)

| Bay | Clear height | Contents | Dividers |
|---|---|---|---|
| Bottom | 6 1/4" | Coleman Triton+ stove (5.7") | None |
| Middle | 8 1/2" | Stanley cook set (6.7"), 2 × 1 lb propane cylinders (8"), MSR Pika teapot (3.5") | 2, sized to contents: 11 1/2" (cook set) / 5" (propane) / 6 1/2" (teapot) |
| Top | 4 1/2" | Dish set (8.5" ⌀ × 3"), 1 bin (7 × 14.5 × 4") | 2, sized to contents: 9 1/2" (dish set) / 6" (free) / 7 1/2" (bin) |

The stove goes at the bottom because it's the heaviest and least-used item. Both propane cylinders stand upright in the middle compartment of the middle bay, one behind the other.

## Fit settings

| Setting | Value | Meaning |
|---|---|---|
| `clearance` | 1/4" | Space per side around each stored item |
| `slot_engage` | 1/4" | How far wall panels sit into the T-slot past the extrusion face |
