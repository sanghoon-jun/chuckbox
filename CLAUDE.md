# ChuckBox

## Goal
Design tool for a chuck box built around the listed items (`items.md`) and design needs (`README.md`). Outputs: `chuckbox.scad` (model) and `parts.md` (parts list).

## Design constraints
- Extrusion lengths: multiples of 1/16" (`len_step`); round up, never down.
- Write lengths as fractions (`24 3/4"`).
- Each shelf must carry more than 2× the total weight of the items placed on it.

## Workflow
- Every item added to `items.md` must be placed in the box (model + Location column). Ask the user where to put it.
- After any design change, update `parts.md` to match.
