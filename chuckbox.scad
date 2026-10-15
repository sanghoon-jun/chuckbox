// T-slot chuck box: 2020 (20 x 20 mm) aluminum extrusion frame, TNUTZ EXM-2020
// Units: mm. Item sizes come from product specs in inches and are converted with IN.
// The box is sized from the items: width, depth and bay heights are derived, then
// extrusion lengths are rounded up to the supplier's 1/16" cut grid.
//
// Coordinates: X = width (left->right), Y = depth (front->back), Z = height.
// Front face (door side) is at Y = 0.

IN = 25.4;
LB = 0.4536;

/* [Materials] */
ext         = 20;     // 2020 profile size
slot_open   = 6.0;    // slot opening, 6.00 +/-0.30 (TNUTZ EXM-2020 drawing)
shelf_t     = 9;      // .354" (9 mm) Baltic birch: base + shelves (load-bearing)
top_t       = 9;      // .354" (9 mm) Baltic birch top lids (flip out as side tables)
panel_t     = 0.125*IN; // .125" (3.2 mm) Baltic birch: side + back walls, dividers; rubber gasket fills the slot
slot_engage = 5;      // how far wall panels sit into the slot past the extrusion face
door_t      = 6;      // 6 mm Baltic birch door (thin panels would warp at this size)
base_below  = true;   // base plywood under the frame (bottom-bay gear sits inside the bottom rails, legs bolt to it)
door_style  = "inset";  // "inset": fits the opening, flush with the frame face; "overlay": covers the whole front
door_gap    = 3;      // gap around the door edge (3 mm absorbs frame and door tolerances)
// Inset door latch: keyed quarter-turn compression latch (Southco E3-style, short grip) near
// the door's right edge; its cam hooks a strike tab bolted into the front-right post's
// inward-facing slot and pulls the door tight against the stop.
latch_inset = 30;     // latch center from the door's right edge
latch_knob_d = 30;    // front knob/key housing diameter (approx.)
latch_cam   = [35, 15, 3];    // cam arm: length, width, thickness (approx.)
strike      = [15, 20, 3];    // strike tab: reach into the opening, height, thickness
// Door hinges: TNUTZ HI-020 (80/20 #12255 equivalent), 20-series steel hinge, 37 lb each.
// Frame leaf on the front-left post's front face with the included M5 flat heads + T-nuts;
// door leaf through-bolted to the door.
hinge_h     = 40;     // hinge length along the post (assumed; measure)
hinge_leaf  = 20;     // leaf width from the pin (1.59" total open width / 2)
hinge_t     = 5;      // leaf thickness, 0.196" (assumed per leaf; measure)
hinge_pin_d = 8;      // knuckle diameter (approx.)
hinge_pin_x = -2;     // overlay: pin just past the post edge so the holes land on the slot center
door_off    = 2*hinge_t;   // overlay: closed door stands off the frame by both leaves; bumpers match on the latch side
len_step    = IN/16;  // supplier cut-length increment for extrusion (1/16")

/* [Layout] */
clearance = 6;        // per side, around stored items
// Vertical dividers (thin ply, front-to-back) per bay, bottom -> top.
// A number = that many evenly spaced dividers.
// A list = widths of the compartments left -> right; the last compartment gets the rest.
dividers  = [[280, 115], 0];
// bottom: cook set + dish set behind it | propane x2 (front-to-back) | teapot

/* [View] */
show_panels = true;
show_door   = true;
show_items  = true;
door_angle  = 100;    // 0 = closed
lid_angle   = 180;    // top lids: 0 = closed, 180 = flipped out as side tables
legs_open   = true;   // folding legs: true = standing, false = folded flat under the box

// ---------- Top lids: two halves that flip out as side tables ----------
// The top is split down the middle. Each half is hinged along its outer edge with a piano
// hinge: frame leaf on the top side rail's outer face (M5 flat heads + T-nuts in the slot),
// lid leaf on the lid's top face. Flipped 180 degrees, the lid sticks out to the side as a
// table, propped by 2 fold-up struts pivoting on the front and back posts' outer faces.
// The struts only press on the lid (rubber pad), so the table face stays clear.
// With the lids open, the stove sits on 2 front-to-back crossbars in the top frame.
lid_gap   = 3;          // center seam
lhinge    = [32, 1.5];  // piano hinge: leaf width from the pin, thickness (2-1/2" open width)
strut     = [230, 20, 5];   // aluminum flat bar: length, width, thickness
strut_ang = 45;         // from vertical, when propping a lid
xbar_in   = 30;         // crossbar gap from the side rail's inner face (match the stove's feet; measure)

// ---------- Folding legs ----------
// 4 folding hairpin legs, 12.6" (Angel Sar FGAQ8781 4-pack), solid steel rod, 41 lb per leg.
// With the base under the frame, each bolts straight to the base under a corner (otherwise
// through a 4 mm aluminum adapter plate into the rails' bottom slots). All legs fold left-right; the right-hand leg
// of each pair sits one leg width further in, so folded legs pass side by side.
// Check that the hinge positively locks open before relying on it.
leg_len   = 12.6*IN;  // overall leg height below its mounting plate
leg_w     = 45;       // hairpin width (rod spread) and bracket width (approx.; measure)
leg_rod   = 9.5;      // rod diameter (approx.)
leg_br    = 20;       // hinge bracket depth below the plate (approx.)
leg_kg    = 0.5;      // per leg (estimate; not listed)
adapter   = [100, 100, 4];
leg_in    = 5;        // leg tube inset from the box edge

// ---------- Stored items (spec inches -> mm) ----------
stove   = [22.6, 13.7, 5.7] * IN;   // Coleman Triton+ (InstaStart), lid closed, lying flat
cook_d  = 10.3 * IN;                // Stanley Even-Heat Camp Pro, packed
cook_h  = 6.7 * IN;
cyl_d   = 3.88 * IN;                // Coleman 1 lb propane
cyl_h   = 8 * IN;
cyl_qty = 2;
tea_d   = 5.5 * IN;                 // MSR Pika 1L teapot
tea_h   = 3.5 * IN;
dish_d  = 8.5 * IN;                 // dish set, stored on edge behind the cook set
dish_h  = 3 * IN;
// Item weights, kg
item_kg = 8.5*LB + 8.2*LB + cyl_qty*2*LB + 5.2/16*LB + 60/16*LB;

// ---------- Material weights ----------
al_kg_m   = 0.454;    // EXM-2020
ply_kg_m3 = 680;      // Baltic birch
hw_kg     = 1.2;      // bolts, T-nuts, brackets, door + lid hinges, latches, panel gasket (estimate)

// ---------- Derived size ----------
function snap(x) = ceil(x/len_step - 1e-6) * len_step;   // round up to the cut grid
function on_grid(x) = abs(x/len_step - round(x/len_step)) < 1e-6;
c2 = 2*clearance;

// Rails span the inside, so they set the inside size directly
inner_w = snap(stove[0] + c2);
inner_d = snap(max(stove[1] + c2,
                   cook_d + dish_h + 3*clearance,                 // cook set, dish set behind it
                   cyl_qty*cyl_d + (cyl_qty + 1)*clearance,       // propane row
                   tea_d + c2));
W = inner_w + 2*ext;
D = inner_d + 2*ext;

// Clear bay heights, bottom -> top, from the tallest item in each bay.
// Posts are rounded up to the cut grid; the extra goes to the top bay.
// The gear (7.4 kg) goes low, under the shelf, so nothing is stored right under the burners.
// The stove is out on top whenever it's lit, so its bay is empty while cooking.
bays_min = [max(cyl_h, cook_h, tea_h, dish_d) + c2,     // propane, cook set, teapot, dish set on edge
            stove[2] + c2 + ext];                        // stove, under the top crossbars
n_bays = len(bays_min);
function vsum(v, n) = n <= 0 ? 0 : v[n - 1] + vsum(v, n - 1);
// With the base under the frame, the bottom bay floor is the frame bottom (z = 0)
base_off = base_below ? -(ext + shelf_t) : 0;
H_raw = base_off + n_bays*shelf_t + vsum(bays_min, n_bays) + ext;
H     = snap(H_raw);
bays  = [for (i = [0 : n_bays - 1]) bays_min[i] + (i == n_bays - 1 ? H - H_raw : 0)];

// Z of the rail level under bay i (level 0 = base, level n_bays = top rails).
// Plywood sits on top of each level's rails; a bay's clear height runs from its
// plywood up to the underside of the plywood above (no crossbars).
function level_z(i) = i == 0 ? base_off : level_z(i - 1) + shelf_t + bays[i - 1];
function rail_z(i)  = i == 0 ? 0 : level_z(i);   // z of the rails under bay i
function bay_floor(i) = level_z(i) + ext + shelf_t;

// Plywood overlapping a rail stops 1.5 mm short of the wall panel in that rail's slot
panel_gap = ext/2 + panel_t/2 + 1.5;
// Base runs over the front rail and onto the back rail
base_d  = D - panel_gap;
// Shelves span side to side, resting on the shelf side rails, plus angle brackets
shelf_w = W - 2*panel_gap;
// Full depth: flush with the front face (closed door) and 1.5 mm short of the back panel,
// notched around the four corner posts
// With an inset door, the shelf stops door_gap behind the closed door; its front edge
// (with a rubber strip) is the door stop
shelf_y0 = door_style == "inset" ? door_t + door_gap : 0;
shelf_d = D - panel_gap - shelf_y0;
notch   = ext - panel_gap;   // how far the shelf overlaps the post footprint, each side
bracket = [20, 20, 3];   // 2020 angle bracket: width along rail, leg length, thickness
bracket_ys = [D/4, 3*D/4];

function in_str(x) =     // mm -> inches as a fraction to the nearest 1/16
    let (t = x/IN, w = floor(t + 1e-6), n = round((t - w)*16), g = gcd(n, 16))
    n == 0 ? str(w, "\"") : w == 0 ? str(n/g, "/", 16/g, "\"") : str(w, " ", n/g, "/", 16/g, "\"");
function gcd(a, b) = b == 0 ? a : gcd(b, a % b);
function mm(x) = str(round(x*10)/10);

// ---------- Fit checks ----------
// Bottom bay: compartment 0 = cook set with the dish set on edge behind it,
// 1 = all propane cylinders in a front-to-back row, 2 = teapot
assert(len(dividers) == n_bays, "dividers needs one entry per bay");
assert(n_dividers(dividers[0]) >= 2, "Bottom bay needs 3 compartments");
assert(comp_w(0, 0) >= max(cook_d, dish_d) + c2, "Cook set compartment too narrow");
assert(comp_w(0, 1) >= cyl_d + c2, "Propane compartment too narrow");
assert(comp_w(0, 2) >= tea_d + c2, "Teapot compartment too narrow");
// Shelf brackets stick down into the bay below at the side walls (cook set, teapot)
assert(bays[0] - max(cook_h, tea_h) - bracket[2] >= clearance, "Gear hits the shelf brackets");
// Top bay: the stove fits under the crossbars, and both crossbars land under the stove
assert(bays[1] - ext - stove[2] >= clearance, "Stove hits the top crossbars");
assert(ext + xbar_in >= (W - stove[0])/2 + 10, "Crossbars must sit under the stove");
// Folded struts stay above the bottom of the base
assert(strut_z - strut[0] >= -shelf_t, "Struts hang below the box when folded");

// ---------- 2020 profile (simplified, 4 slots) ----------
module profile_2020() {
    lip   = 1.5;    // lip thickness, 1.50 +/-0.15
    cav_w = 7.6;    // slot cavity width (simplified; real cavity widens to 11.9)
    cav_d = 4.0;    // slot cavity depth below lip
    difference() {
        square(ext, center=true);
        for (i = [0:3]) rotate(i*90) {
            translate([ext/2 - lip - 0.01, -slot_open/2]) square([lip + 0.02, slot_open]);
            translate([ext/2 - lip - cav_d, -cav_w/2]) square([cav_d, cav_w]);
        }
        circle(d=5.48, $fn=24);  // center bore 5.48 +/-0.20: too big for M5; end-tap M6
    }
}

module ext_bar(len) color("Silver") linear_extrude(len) profile_2020();

// Each bar is placed by the min corner of its 20x20 cross-section.
module bar(axis, x, y, z, len) {
    if (axis == "x")      translate([x, y + ext/2, z + ext/2]) rotate([0, 90, 0]) ext_bar(len);
    else if (axis == "y") translate([x + ext/2, y, z + ext/2]) rotate([-90, 0, 0]) ext_bar(len);
    else                  translate([x + ext/2, y + ext/2, z]) ext_bar(len);
}

// ---------- Frame members: [name, axis, x, y, z, length] ----------
members = concat(
    [for (x = [0, W-ext], y = [0, D-ext]) ["post", "z", x, y, 0, H]],
    // Bottom + top perimeter rails
    [for (z = [0, H-ext], y = [0, D-ext]) ["front/back rail", "x", ext, y, z, inner_w]],
    [for (z = [0, H-ext], x = [0, W-ext]) ["side rail", "y", x, ext, z, inner_d]],
    // Shelf side rails
    [for (i = [1 : n_bays - 1], x = [0, W-ext]) ["shelf side rail", "y", x, ext, level_z(i), inner_d]],
    // Top crossbars, front to back: the stove stands on them with the lids open
    [for (x = [ext + xbar_in, W - 2*ext - xbar_in]) ["crossbar", "y", x, ext, H - ext, inner_d]]
);

module frame() for (m = members) bar(m[1], m[2], m[3], m[4], m[5]);

// ---------- Plywood ----------
module shelf(z) color("BurlyWood") translate([0, 0, z + ext]) difference() {
    translate([panel_gap, shelf_y0, 0]) cube([shelf_w, shelf_d, shelf_t]);
    for (x = [panel_gap - 1, W - ext], y = [-1, D - ext])
        translate([x, y, -1]) cube([notch + 1, ext + 1, shelf_t + 2]);
}
module base() color("BurlyWood")
    if (base_below) translate([0, 0, -shelf_t]) cube([W, D, shelf_t]);   // full footprint, bolted up into the bottom rails
    else translate([ext, 0, ext]) cube([inner_w, base_d, shelf_t]);

// Angle brackets: bolted into a rail's inner slot, top leg flush with the rail top,
// M5 countersunk bolt down through the plywood and the leg, nylon-insert nut below
module shelf_brackets() color("DimGray") {
    t = bracket[2];
    for (i = [1 : n_bays - 1], y = bracket_ys) {
        z = level_z(i) + ext;
        translate([ext, y - bracket[0]/2, z - bracket[1]])  cube([t, bracket[0], bracket[1]]);
        translate([ext, y - bracket[0]/2, z - t])           cube([bracket[1], bracket[0], t]);
        translate([W - ext - t, y - bracket[0]/2, z - bracket[1]]) cube([t, bracket[0], bracket[1]]);
        translate([W - ext - bracket[1], y - bracket[0]/2, z - t]) cube([bracket[1], bracket[0], t]);
    }
    // Base on top of the rails: back edge held by brackets on the bottom back rail's inner face
    if (!base_below) for (x = [W/4, 3*W/4]) {
        translate([x - bracket[0]/2, D - ext - t, 0])                cube([bracket[0], t, ext]);
        translate([x - bracket[0]/2, D - ext - bracket[1], ext - t]) cube([bracket[0], bracket[1], t]);
    }
}

// ---------- Top lids ----------
lid_w   = (W - lid_gap)/2;
lid_pin = [-lhinge[1]/2, H + top_t + lhinge[1]/2];   // hinge pin x, z (left lid)
lid_open_z = 2*lid_pin[1] - H - top_t;               // flipped lid's underside (its closed top face)
table_z = 2*lid_pin[1] - H;                          // flipped lid's table surface
strut_z = lid_open_z - strut[0]*cos(strut_ang);      // strut pivot on the post's outer face
latch_xs = [lid_w - 40];                             // lid latch, from the hinge edge

// Left lid, hinged at x = 0; the right lid is its mirror
module lid() {
    translate([lid_pin[0], 0, lid_pin[1]]) rotate([0, -lid_angle, 0]) translate([-lid_pin[0], 0, -lid_pin[1]]) {
        color("BurlyWood") translate([0, 0, H]) cube([lid_w, D, top_t]);
        color("Silver") translate([lid_pin[0], ext, H + top_t]) cube([lhinge[0], inner_d, lhinge[1]]);   // lid leaf
        // Latch keepers on the lid's top face, front and back
        color("DimGray") for (x = latch_xs, y = [2, D - 14]) translate([x, y, H + top_t]) cube([20, 12, 3]);
    }
    color("Silver") {
        translate([lid_pin[0], ext, lid_pin[1]]) rotate([-90, 0, 0]) cylinder(d=4, h=inner_d, $fn=16);   // knuckle
        translate([-lhinge[1], ext, lid_pin[1] - lhinge[0]]) cube([lhinge[1], inner_d, lhinge[0]]);   // frame leaf
    }
    // Draw latch bodies on the front and back top rails' outer faces
    color("DimGray") for (x = latch_xs) {
        translate([x - 5, -8, H - ext + 2]) cube([30, 8, 16]);
        translate([x - 5, D, H - ext + 2]) cube([30, 8, 16]);
    }
    // Fold-up struts on the front and back posts' outer faces: up under the flipped lid, or folded down
    color("Silver") for (y = [ext/2, D - ext/2])
        translate([0, y - strut[1]/2, strut_z]) {
            if (lid_angle == 180) rotate([0, -strut_ang, 0]) translate([-strut[2], 0, 0]) cube([strut[2], strut[1], strut[0]]);
            else translate([-strut[2], 0, -strut[0]]) cube([strut[2], strut[1], strut[0]]);
        }
}

module lids() {
    lid();
    translate([W, 0, 0]) mirror([1, 0, 0]) lid();
}

function side_h(i) = rail_z(i + 1) - rail_z(i) - ext + 2*slot_engage;
back_w = inner_w + 2*slot_engage;
back_h = H - 2*ext + 2*slot_engage;
side_d = inner_d + 2*slot_engage;

module panels() {
    e = slot_engage;
    c = ext/2 - panel_t/2;   // panel sits on the slot centerline
    color("Wheat") {
        // Back (one piece; no back shelf rails)
        translate([ext - e, D - ext + c, ext - e]) cube([back_w, panel_t, back_h]);
        // Sides, one panel per bay between shelf rails
        for (x = [c, W - ext + c], i = [0 : n_bays - 1])
            translate([x, ext - e, rail_z(i) + ext - e]) cube([panel_t, side_d, side_h(i)]);
    }
}

// Each divider stands on its shelf, fixed with small L-brackets to the plywood
// below and above.
function psum(v, n) = n <= 0 ? 0 : v[n - 1] + psum(v, n - 1);
function n_dividers(d) = is_list(d) ? len(d) : d;
function comp_widths(d) =
    is_list(d) ? concat(d, [inner_w - len(d)*panel_t - psum(d, len(d))])
               : [for (k = [0 : d]) (inner_w - d*panel_t) / (d + 1)];
function comp_w(i, k)  = comp_widths(dividers[i])[k];
function comp_x0(i, k) = ext + psum(comp_widths(dividers[i]), k) + k*panel_t;  // left edge
function comp_cx(i, k) = comp_x0(i, k) + comp_w(i, k)/2;                      // center

module bay_dividers() color("Wheat")
    for (i = [0 : n_bays - 1]) if (n_dividers(dividers[i]) > 0)
        for (k = [1 : n_dividers(dividers[i])])
            translate([comp_x0(i, k) - panel_t, ext, bay_floor(i)])
                cube([panel_t, inner_d, bays[i]]);

// ---------- Door (swing, 2 hinges at left, draw latch at right) ----------
// Inset: fills the front opening between the posts, above the base plywood's front edge
// and below the top rail.
door_x0 = door_style == "inset" ? ext + door_gap : door_gap;
door_z0 = door_style == "inset" ? ext + (base_below ? 0 : shelf_t) + door_gap : door_gap;
door_w  = door_style == "inset" ? inner_w - 2*door_gap : W - 2*door_gap;
door_h  = door_style == "inset" ? H - ext - door_gap - door_z0 : H - 2*door_gap;
hinge_zs = [door_z0 + 30, door_z0 + door_h - 30 - hinge_h];

module door() if (door_style == "inset") door_inset(); else door_overlay();

// Inset: hinge leaves lie flat on the front faces of the post and the door, pin in the gap
module door_inset() {
    latch_z = door_z0 + door_h/2;
    pin = [ext + door_gap/2, -hinge_t/2];
    translate([pin[0], pin[1], 0]) {
        rotate([0, 0, -door_angle]) translate([-pin[0], -pin[1], 0]) {
            color("Tan") translate([door_x0, 0, door_z0]) cube([door_w, door_t, door_h]);
            // Door leaves, on the door's front face
            color("Black") for (z = hinge_zs)
                translate([pin[0], -hinge_t, z]) cube([hinge_leaf, hinge_t, hinge_h]);
            // Compression latch: knob on the front, body through the door, cam behind
            lx = door_x0 + door_w - latch_inset;
            color("DimGray") {
                translate([lx, 0, latch_z]) rotate([90, 0, 0]) cylinder(d=latch_knob_d, h=6, $fn=32);
                translate([lx, door_t, latch_z]) rotate([-90, 0, 0]) cylinder(d=16, h=strike[2] + 6, $fn=24);
                translate([lx - latch_cam[1]/2, door_t + strike[2] + 3, latch_z - latch_cam[1]/2])
                    cube([latch_cam[0] + latch_cam[1]/2, latch_cam[2], latch_cam[1]]);
            }
        }
    }
    // Hinge knuckles
    color("Black") for (z = hinge_zs) translate([pin[0], pin[1], z]) cylinder(d=hinge_pin_d, h=hinge_h, $fn=24);
    // Frame leaves, on the front-left post's front face
    color("Black") for (z = hinge_zs) translate([pin[0] - hinge_leaf, -hinge_t, z]) cube([hinge_leaf, hinge_t, hinge_h]);
    // Strike tab in the front-right post's inward-facing slot, just behind the closed door
    color("DimGray") translate([W - ext - strike[0], door_t + 2, latch_z - strike[1]/2])
        cube([strike[0], strike[2], strike[1]]);
    // Door stop: rubber strip on the shelf's front edge
    color("DimGray") translate([door_x0 + 20, door_t, level_z(1) + ext]) cube([door_w - 40, door_gap, shelf_t]);
}

module door_overlay() {
    latch_z = H/2 - 10;
    // Hinge axis at the front-left corner, between the two closed leaves
    translate([hinge_pin_x, -hinge_t, 0]) {
        rotate([0, 0, -door_angle]) translate([-hinge_pin_x, hinge_t, 0]) {
            color("Tan") translate([door_gap, -door_off - door_t, door_gap])
                cube([W - 2*door_gap, door_t, H - 2*door_gap]);
            // Door leaves, on the door's inner face
            color("Black") for (z = hinge_zs)
                translate([hinge_pin_x, -door_off, z]) cube([hinge_leaf, hinge_t, hinge_h]);
            // Draw latch body on the door face
            color("DimGray") translate([W - 40, -door_off - door_t - 5, latch_z]) cube([35, 5, 20]);
        }
        // Hinge knuckles
        color("Black") for (z = hinge_zs) translate([0, 0, z]) cylinder(d=hinge_pin_d, h=hinge_h, $fn=24);
    }
    // Frame leaves, on the front-left post's front face
    color("Black") for (z = hinge_zs) translate([hinge_pin_x, -hinge_t, z]) cube([hinge_leaf, hinge_t, hinge_h]);
    // Rubber bumpers on the front-right post, same thickness as the closed hinge
    color("DimGray") for (z = hinge_zs) translate([W - ext + 4, -door_off, z + hinge_h/2 - 6]) cube([12, door_off, 12]);
    // Latch keeper on the right post's side face
    color("DimGray") translate([W, 2, latch_z]) cube([4, 16, 20]);
}

// ---------- Stored items (ghosted) ----------
module items() {
    // Top bay: stove, centered (out on the crossbars when the lids are open)
    color([0.2, 0.4, 0.8, 0.5])
        if (lid_angle == 180) translate([(W - stove[0])/2, (D - stove[1])/2, H]) cube(stove);
        else translate([(W - stove[0])/2, (D - stove[1])/2, bay_floor(1)]) cube(stove);
    // Bottom bay: cook set in the left compartment, at the front
    color([0.8, 0.3, 0.2, 0.5])
        translate([comp_cx(0, 0), ext + clearance + cook_d/2, bay_floor(0)])
            cylinder(d=cook_d, h=cook_h, $fn=64);
    // Bottom bay: upright propane cylinders in a row, front to back, in compartment 1
    color([0.2, 0.7, 0.3, 0.5])
        for (j = [0 : cyl_qty - 1])
            translate([comp_cx(0, 1), ext + clearance + cyl_d/2 + j*(cyl_d + clearance), bay_floor(0)])
                cylinder(d=cyl_d, h=cyl_h, $fn=48);
    // Bottom bay: teapot in compartment 2, at the front
    color([0.6, 0.6, 0.6, 0.5])
        translate([comp_cx(0, 2), ext + clearance + tea_d/2, bay_floor(0)])
            cylinder(d=tea_d, h=tea_h, $fn=48);
    // Bottom bay: dish set standing on edge behind the cook set
    color([0.9, 0.9, 0.9, 0.5])
        translate([comp_cx(0, 0), ext + 2*clearance + cook_d, bay_floor(0) + dish_d/2])
            rotate([-90, 0, 0]) cylinder(d=dish_d, h=dish_h, $fn=64);
}

// ---------- Legs ----------
leg_pos   = [[leg_in, leg_in, 1],                                 // front-left, folds toward +x
             [W - leg_in - leg_w, leg_in + leg_w + 5, -1],         // front-right, offset back, folds toward -x
             [leg_in, D - leg_in - 2*leg_w - 5, 1],                // back-left, offset forward, folds toward +x
             [W - leg_in - leg_w, D - leg_in - leg_w, -1]];        // back-right, folds toward -x
module hairpin(len) {   // hanging down from z = 0, rods spread along y
    for (y = [leg_rod/2, leg_w - leg_rod/2]) translate([leg_w/2, y, -len]) cylinder(d=leg_rod, h=len, $fn=16);
    translate([leg_w/2, leg_rod/2, -len]) rotate([-90, 0, 0]) cylinder(d=leg_rod, h=leg_w - leg_rod, $fn=16);
}
under = base_below ? shelf_t : adapter[2];   // what the legs mount under
module legs() {
    for (p = leg_pos) {
        // Adapter plate under the corner (not needed when the legs bolt to the base)
        if (!base_below)
            color("Silver") translate([p[2] > 0 ? 0 : W - adapter[0], p[1] < D/2 ? 0 : D - adapter[1], -adapter[2]])
                cube(adapter);
        color("Black") translate([p[0], p[1], -under]) {
            translate([0, 0, -leg_br]) cube([leg_w, leg_w, leg_br]);    // hinge bracket
            if (legs_open) translate([0, 0, -leg_br]) hairpin(leg_len - leg_br);
            else   // folded flat along x
                translate([leg_w/2, 0, -leg_br/2]) rotate([0, p[2] > 0 ? -90 : 90, 0]) hairpin(leg_len - leg_br);
        }
    }
}

// ---------- Assembly ----------
module chuckbox() {
    frame();
    base();
    for (i = [1 : n_bays - 1]) shelf(level_z(i));
    shelf_brackets();
    lids();
    bay_dividers();
    if (show_panels) panels();
    if (show_door)   door();
    if (show_items)  items();
    legs();
}

chuckbox();

// ---------- Cut list (mm; extrusion also in inches for the supplier) ----------
for (m = members) assert(on_grid(m[5]), str(m[0], " length ", m[5], " mm is not on the 1/16\" grid"));
echo(str("Overall: ", mm(W), " x ", mm(D), " x ", mm(H + top_t + (base_below ? shelf_t : 0)), " mm (frame ", mm(H),
         " + lids ", mm(top_t), base_below ? str(" + base ", mm(shelf_t)) : "", ")"));
echo(str("Legs: hairpin ", mm(leg_len), " mm; standing, stove base ", mm(leg_len + under + H), " mm, side tables ",
         mm(leg_len + under + table_z), " mm; packed height with legs folded ", mm(leg_br + under + H + top_t), " mm"));
echo(str("Lids: closed width ", mm(W + 2*strut[2]), " mm (struts folded); open as tables ", mm(W + 2*(lid_w + lhinge[1])),
         " mm wide, table surface ", mm(table_z - H), " mm above the stove base; strut pivot z ", mm(strut_z),
         ", tip ", mm(strut[0]*sin(strut_ang)), " mm out"));
echo(str("Bays (bottom->top): ", [for (b = bays) mm(b)], " mm"));
for (L = [H, inner_w, inner_d])
    let (n = len([for (m = members) if (m[5] == L) 1]))
    echo(str("2020: ", n, " x ", mm(L), " mm (", in_str(L), ")"));
echo(str(shelf_t, " mm ply base: 1 x ", base_below ? str(mm(W), " x ", mm(D), " (under the frame)") : str(mm(inner_w), " x ", mm(base_d))));
echo(str(shelf_t, " mm ply shelves: ", n_bays - 1, " x ", mm(shelf_w), " x ", mm(shelf_d),
         ", corner notches ", mm(notch), " x ", mm(ext - shelf_y0), " front, ", mm(notch), " x ", mm(notch), " back"));
echo(str(top_t, " mm ply lids: 2 x ", mm(lid_w), " x ", mm(D)));
echo(str(mm(panel_t), " mm ply back: 1 x ", mm(back_w), " x ", mm(back_h)));
echo(str(mm(panel_t), " mm ply sides (bottom->top, 2 each): ", mm(side_d), " x ", [for (i = [0 : n_bays - 1]) mm(side_h(i))]));
for (i = [0 : n_bays - 1]) if (n_dividers(dividers[i]) > 0)
    echo(str(mm(panel_t), " mm ply dividers, bay ", i, ": ", n_dividers(dividers[i]), " x ", mm(inner_d), " x ", mm(bays[i]),
             " -> compartment widths ", [for (w = comp_widths(dividers[i])) mm(w)]));
echo(str(mm(door_t), " mm ply door (", door_style, "): 1 x ", mm(door_w), " x ", mm(door_h)));

// ---------- Weight estimate (kg) ----------
al_m   = vsum([for (m = members) m[5]], len(members)) / 1000;
ply_thick  = (((base_below ? W*D : inner_w*base_d) + (n_bays - 1)*shelf_w*shelf_d)*shelf_t + 2*lid_w*D*top_t) / 1e9 * ply_kg_m3;
div_a  = vsum([for (i = [0 : n_bays - 1]) n_dividers(dividers[i]) * inner_d * bays[i]], n_bays);
ply_thin = (back_w*back_h + 2*side_d*vsum([for (i = [0 : n_bays - 1]) side_h(i)], n_bays) + div_a)
           * panel_t / 1e9 * ply_kg_m3;
ply_door = door_w*door_h * door_t / 1e9 * ply_kg_m3;
strut_kg = 4*strut[0]*strut[1]*strut[2] / 1e9 * 2700;   // aluminum flat bar
legs_kg = 4*leg_kg + (base_below ? 0 : 4*adapter[0]*adapter[1]*adapter[2]/1e9*2700);
dry_kg = al_m*al_kg_m + ply_thick + ply_thin + ply_door + strut_kg + legs_kg + hw_kg;
echo(str("Weight: extrusion ", mm(al_m*al_kg_m), " kg (", mm(al_m), " m), base + shelf + lid ply ", mm(ply_thick),
         " kg, panel + divider ply ", mm(ply_thin), " kg, door ", mm(ply_door), " kg, struts ", mm(strut_kg), " kg, legs ", mm(legs_kg),
         " kg, hardware ", mm(hw_kg), " kg"));
echo(str("Dry ", mm(dry_kg), " kg (", mm(dry_kg/LB), " lb), gross ", mm(dry_kg + item_kg),
         " kg (", mm((dry_kg + item_kg)/LB), " lb)"));
