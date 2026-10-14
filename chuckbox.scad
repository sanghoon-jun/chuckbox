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
slot_open   = 6.2;    // slot opening (check against supplier spec)
shelf_t     = 12;     // 12 mm Baltic birch: base + shelves (load-bearing)
top_t       = 12;     // 12 mm Baltic birch cooktop: carries stove + food (load-bearing)
panel_t     = 6;      // 6 mm Baltic birch: side + back walls, dividers
slot_engage = 5;      // how far wall panels sit into the slot past the extrusion face
door_t      = 6;      // door panel thickness
door_gap    = 1.5;    // reveal around the door edge
len_step    = IN/16;  // supplier cut-length increment for extrusion (1/16")

/* [Layout] */
clearance = 6;        // per side, around stored items
// Vertical dividers (6 mm ply, front-to-back) per bay, bottom -> top.
// A number = that many evenly spaced dividers.
// A list = widths of the compartments left -> right; the last compartment gets the rest.
dividers  = [0, [280, 115], [230, 152]];
// middle: cook set | propane x2 (front-to-back) | teapot
// top:    dish set | free | bin

/* [View] */
show_panels = true;
show_door   = true;
show_items  = true;
door_angle  = 100;    // 0 = closed

// ---------- Stored items (spec inches -> mm) ----------
stove   = [22.6, 13.7, 5.7] * IN;   // Coleman Triton+ (InstaStart), lid closed, lying flat
cook_d  = 10.3 * IN;                // Stanley Even-Heat Camp Pro, packed
cook_h  = 6.7 * IN;
cyl_d   = 3.88 * IN;                // Coleman 1 lb propane
cyl_h   = 8 * IN;
cyl_qty = 2;
tea_d   = 5.5 * IN;                 // MSR Pika 1L teapot
tea_h   = 3.5 * IN;
dish_d  = 8.5 * IN;                 // dish set, top bay, left compartment
dish_h  = 3 * IN;
bin     = [7, 14.5, 4] * IN;        // storage bins, top bay, one per compartment, rightmost first
bin_qty = 1;
// Item weights, kg (bin: TBD)
item_kg = 8.5*LB + 8.2*LB + cyl_qty*2*LB + 5.2/16*LB + 60/16*LB;

// ---------- Material weights ----------
al_kg_m   = 0.454;    // EXM-2020
ply_kg_m3 = 680;      // Baltic birch
hw_kg     = 0.9;      // bolts, T-nuts, brackets, hinges, latch, gasket (estimate)

// ---------- Derived size ----------
function snap(x) = ceil(x/len_step - 1e-6) * len_step;   // round up to the cut grid
function on_grid(x) = abs(x/len_step - round(x/len_step)) < 1e-6;
c2 = 2*clearance;

// Rails span the inside, so they set the inside size directly
inner_w = snap(stove[0] + c2);
inner_d = snap(max(stove[1] + c2, bin[1] + c2, cook_d + c2, dish_d + c2,
                   cyl_qty*cyl_d + (cyl_qty + 1)*clearance));
W = inner_w + 2*ext;
D = inner_d + 2*ext;

// Clear bay heights, bottom -> top, from the tallest item in each bay.
// Posts are rounded up to the cut grid; the extra goes to the top bay.
bays_min = [stove[2] + c2,                         // stove (heaviest, least used -> low)
            max(cyl_h, cook_h, tea_h) + c2,         // propane, cook set, teapot
            max(bin[2], dish_h) + c2];              // bin, dish set
n_bays = len(bays_min);
function vsum(v, n) = n <= 0 ? 0 : v[n - 1] + vsum(v, n - 1);
H_raw = n_bays*shelf_t + vsum(bays_min, n_bays) + ext;
H     = snap(H_raw);
bays  = [for (i = [0 : n_bays - 1]) bays_min[i] + (i == n_bays - 1 ? H - H_raw : 0)];

// Z of the rail level under bay i (level 0 = base, level n_bays = top rails).
// Plywood sits on top of each level's rails; a bay's clear height runs from its
// plywood up to the underside of the plywood above (no crossbars).
function level_z(i) = i == 0 ? 0 : level_z(i - 1) + shelf_t + bays[i - 1];
function bay_floor(i) = level_z(i) + ext + shelf_t;

// Plywood overlapping a rail stops 1.5 mm short of the wall panel in that rail's slot
panel_gap = ext/2 + panel_t/2 + 1.5;
// Base runs over the front rail and onto the back rail
base_d  = D - panel_gap;
// Shelves span side to side, resting on the shelf side rails, plus angle brackets
shelf_w = W - 2*panel_gap;
bracket = [20, 20, 3];   // 2020 angle bracket: width along rail, leg length, thickness
bracket_ys = [D/4, 3*D/4];

function in_str(x) =     // mm -> inches as a fraction to the nearest 1/16
    let (t = x/IN, w = floor(t + 1e-6), n = round((t - w)*16), g = gcd(n, 16))
    n == 0 ? str(w, "\"") : w == 0 ? str(n/g, "/", 16/g, "\"") : str(w, " ", n/g, "/", 16/g, "\"");
function gcd(a, b) = b == 0 ? a : gcd(b, a % b);
function mm(x) = str(round(x*10)/10);

// ---------- Fit checks ----------
// Top bay: compartment 0 = dish set, rightmost bin_qty compartments = one bin each
function bin_comps() = [for (k = [n_dividers(dividers[2]) - bin_qty + 1 : n_dividers(dividers[2])]) k];
assert(comp_w(2, 0) >= dish_d + c2, "Dish set compartment too narrow");
assert(n_dividers(dividers[2]) >= bin_qty, "Top bay needs one compartment per bin");
for (k = bin_comps())
    assert(comp_w(2, k) >= bin[0] + c2, str("Bin compartment ", k, " too narrow"));
// Middle bay: compartment 0 = cook set, 1 = all propane cylinders in a front-to-back row, 2 = teapot
assert(n_dividers(dividers[1]) >= 2, "Gas bay needs 3 compartments");
assert(comp_w(1, 0) >= cook_d + c2, "Cook set compartment too narrow");
assert(comp_w(1, 1) >= cyl_d + c2, "Propane compartment too narrow");
assert(comp_w(1, 2) >= tea_d + c2, "Teapot compartment too narrow");
// Shelf brackets stick down into the bay below at the side walls
assert(bays[0] - stove[2] - bracket[2] >= clearance, "Stove hits the shelf brackets");

// ---------- 2020 profile (simplified, 4 slots) ----------
module profile_2020() {
    lip   = 1.8;    // lip thickness
    cav_w = 7.6;    // slot cavity width
    cav_d = 4.3;    // slot cavity depth below lip
    difference() {
        square(ext, center=true);
        for (i = [0:3]) rotate(i*90) {
            translate([ext/2 - lip - 0.01, -slot_open/2]) square([lip + 0.02, slot_open]);
            translate([ext/2 - lip - cav_d, -cav_w/2]) square([cav_d, cav_w]);
        }
        circle(d=4.2, $fn=24);   // tapped M5 at the ends
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
    [for (i = [1 : n_bays - 1], x = [0, W-ext]) ["shelf side rail", "y", x, ext, level_z(i), inner_d]]
);

module frame() for (m = members) bar(m[1], m[2], m[3], m[4], m[5]);

// ---------- Plywood ----------
module shelf(z) color("BurlyWood") translate([panel_gap, ext, z + ext]) cube([shelf_w, inner_d, shelf_t]);
module base() color("BurlyWood") translate([ext, 0, ext]) cube([inner_w, base_d, shelf_t]);

// Angle brackets: bolted into a rail's inner slot, top leg flush with the rail top,
// screwed up into the plywood
module shelf_brackets() color("DimGray") {
    t = bracket[2];
    for (i = [1 : n_bays - 1], y = bracket_ys) {
        z = level_z(i) + ext;
        translate([ext, y - bracket[0]/2, z - bracket[1]])  cube([t, bracket[0], bracket[1]]);
        translate([ext, y - bracket[0]/2, z - t])           cube([bracket[1], bracket[0], t]);
        translate([W - ext - t, y - bracket[0]/2, z - bracket[1]]) cube([t, bracket[0], bracket[1]]);
        translate([W - ext - bracket[1], y - bracket[0]/2, z - t]) cube([bracket[1], bracket[0], t]);
    }
    // Base: back edge held by brackets on the bottom back rail's inner face
    for (x = [W/4, 3*W/4]) {
        translate([x - bracket[0]/2, D - ext - t, 0])                cube([bracket[0], t, ext]);
        translate([x - bracket[0]/2, D - ext - bracket[1], ext - t]) cube([bracket[0], bracket[1], t]);
    }
}

// Full-footprint cooktop on the top perimeter rails, countersunk bolts, flush surface
module cooktop() color("BurlyWood") translate([0, 0, H]) cube([W, D, top_t]);

function side_h(i) = level_z(i + 1) - level_z(i) - ext + 2*slot_engage;
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
            translate([x, ext - e, level_z(i) + ext - e]) cube([panel_t, side_d, side_h(i)]);
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

// ---------- Door (swing, pivot hinges at left, draw latch at right) ----------
module door() {
    latch_z = H/2 - 10;
    rotate([0, 0, -door_angle]) {
        color("Tan") translate([door_gap, -door_t, door_gap])
            cube([W - 2*door_gap, door_t, H - 2*door_gap]);
        // Draw latch body on the door face
        color("DimGray") translate([W - 40, -door_t - 5, latch_z]) cube([35, 5, 20]);
    }
    // Pivot hinge pins, top and bottom
    color("DimGray") for (z = [0, H - ext]) translate([0, 0, z]) cylinder(d=6, h=ext, $fn=24);
    // Latch keeper on the right post's side face
    color("DimGray") translate([W, 2, latch_z]) cube([4, 16, 20]);
}

// ---------- Stored items (ghosted) ----------
module items() {
    // Bottom bay: stove, centered
    color([0.2, 0.4, 0.8, 0.5])
        translate([(W - stove[0])/2, (D - stove[1])/2, bay_floor(0)]) cube(stove);
    // Middle bay: cook set in the left compartment, at the front
    color([0.8, 0.3, 0.2, 0.5])
        translate([comp_cx(1, 0), ext + clearance + cook_d/2, bay_floor(1)])
            cylinder(d=cook_d, h=cook_h, $fn=64);
    // Middle bay: upright propane cylinders in a row, front to back, in compartment 1
    color([0.2, 0.7, 0.3, 0.5])
        for (j = [0 : cyl_qty - 1])
            translate([comp_cx(1, 1), ext + clearance + cyl_d/2 + j*(cyl_d + clearance), bay_floor(1)])
                cylinder(d=cyl_d, h=cyl_h, $fn=48);
    // Middle bay: teapot in compartment 2, at the front
    color([0.6, 0.6, 0.6, 0.5])
        translate([comp_cx(1, 2), ext + clearance + tea_d/2, bay_floor(1)])
            cylinder(d=tea_d, h=tea_h, $fn=48);
    // Top bay: dish set in the left compartment, at the front
    color([0.9, 0.9, 0.9, 0.5])
        translate([comp_cx(2, 0), ext + clearance + dish_d/2, bay_floor(2)])
            cylinder(d=dish_d, h=dish_h, $fn=64);
    // Top bay: bins in the rightmost compartments, at the front
    color([0.9, 0.7, 0.2, 0.5])
        for (k = bin_comps())
            translate([comp_cx(2, k) - bin[0]/2, ext + clearance, bay_floor(2)]) cube(bin);
}

// ---------- Assembly ----------
module chuckbox() {
    frame();
    base();
    for (i = [1 : n_bays - 1]) shelf(level_z(i));
    shelf_brackets();
    cooktop();
    bay_dividers();
    if (show_panels) panels();
    if (show_door)   door();
    if (show_items)  items();
}

chuckbox();

// ---------- Cut list (mm; extrusion also in inches for the supplier) ----------
for (m = members) assert(on_grid(m[5]), str(m[0], " length ", m[5], " mm is not on the 1/16\" grid"));
echo(str("Overall: ", mm(W), " x ", mm(D), " x ", mm(H + top_t), " mm (frame ", mm(H), " + cooktop ", mm(top_t), ")"));
echo(str("Bays (bottom->top): ", [for (b = bays) mm(b)], " mm"));
for (L = [H, inner_w, inner_d])
    let (n = len([for (m = members) if (m[5] == L) 1]))
    echo(str("2020: ", n, " x ", mm(L), " mm (", in_str(L), ")"));
echo(str("12 mm ply base: 1 x ", mm(inner_w), " x ", mm(base_d)));
echo(str("12 mm ply shelves: ", n_bays - 1, " x ", mm(shelf_w), " x ", mm(inner_d)));
echo(str("12 mm ply cooktop: 1 x ", mm(W), " x ", mm(D)));
echo(str("6 mm ply back: 1 x ", mm(back_w), " x ", mm(back_h)));
echo(str("6 mm ply sides (bottom->top, 2 each): ", mm(side_d), " x ", [for (i = [0 : n_bays - 1]) mm(side_h(i))]));
for (i = [0 : n_bays - 1]) if (n_dividers(dividers[i]) > 0)
    echo(str("6 mm ply dividers, bay ", i, ": ", n_dividers(dividers[i]), " x ", mm(inner_d), " x ", mm(bays[i]),
             " -> compartment widths ", [for (w = comp_widths(dividers[i])) mm(w)]));
echo(str("6 mm ply door: 1 x ", mm(W - 2*door_gap), " x ", mm(H - 2*door_gap)));

// ---------- Weight estimate (kg) ----------
al_m   = vsum([for (m = members) m[5]], len(members)) / 1000;
ply12  = (inner_w*base_d + (n_bays - 1)*shelf_w*inner_d + W*D) / 1e6 * shelf_t/1000 * ply_kg_m3;
div_a  = vsum([for (i = [0 : n_bays - 1]) n_dividers(dividers[i]) * inner_d * bays[i]], n_bays);
ply6   = (back_w*back_h + 2*side_d*vsum([for (i = [0 : n_bays - 1]) side_h(i)], n_bays) + div_a
          + (W - 2*door_gap)*(H - 2*door_gap)) / 1e6 * panel_t/1000 * ply_kg_m3;
dry_kg = al_m*al_kg_m + ply12 + ply6 + hw_kg;
echo(str("Weight: extrusion ", mm(al_m*al_kg_m), " kg (", mm(al_m), " m), 12 mm ply ", mm(ply12),
         " kg, 6 mm ply ", mm(ply6), " kg, hardware ", mm(hw_kg), " kg"));
echo(str("Dry ", mm(dry_kg), " kg (", mm(dry_kg/LB), " lb), gross ", mm(dry_kg + item_kg),
         " kg (", mm((dry_kg + item_kg)/LB), " lb) + bin"));
