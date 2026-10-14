// T-slot chuck box: 1" (10-series) aluminum extrusion frame
// Units: inches. For mm export, wrap the top-level call in scale(25.4).
//
// Coordinates: X = width (left->right), Y = depth (front->back), Z = height.
// Front face (door side) is at Y = 0.

/* [Overall exterior] */
W = 25.5;
D = 17;
// Frame height H is derived from the bay heights below; cooktop sits on top.

/* [Materials] */
ext         = 1.0;    // 10-series profile size
shelf_t     = 0.5;    // 1/2" birch, base + shelves (load-bearing)
top_t       = 0.5;    // 1/2" birch cooktop: carries stove + food (load-bearing)
panel_t     = 0.25;   // 1/4" birch, side + back walls (nominal; real sheets run ~0.22)
slot_engage = 0.25;   // how far wall panels sit into the T-slot past the face
door_t      = 0.25;   // door panel thickness
door_gap    = 0.0625; // reveal around the door edge
len_step    = 1/16;   // supplier cut-length increment for extrusion

/* [Layout] */
clearance = 0.25;     // per side, around stored items
// Clear bay heights, bottom -> top
bay_stove = 6.25;     // stove 5.7 + 0.5 = 6.2, up to 1/16" grid (heaviest, least used -> low)
bay_gas   = 8.5;      // propane 8 + 0.5; cook set shares this bay
bay_top   = 4.5;      // 4" bin + 0.5 (dish set 3" also fits)
// Vertical dividers (1/4" ply, front-to-back) per bay, bottom -> top.
// A number = that many evenly spaced dividers.
// A list = widths of the compartments left -> right; the last compartment gets the rest.
dividers  = [0, [11.5, 5], [9.5, 6]];
// middle: cook set | propane x2 (front-to-back) | teapot
// top:    dish set | free | bin

/* [View] */
show_panels = true;
show_door   = true;
show_items  = true;
door_angle  = 100;    // 0 = closed

// ---------- Stored items (W x D x H) ----------
stove   = [22.6, 13.7, 5.7];    // Coleman Triton+ (InstaStart), lid closed, lying flat
cook_d  = 10.3;                 // Stanley Even-Heat Camp Pro, packed
cook_h  = 6.7;
cyl_d   = 3.88;                 // Coleman 1 lb propane
cyl_h   = 8;
cyl_qty = 2;
tea_d   = 5.5;                  // MSR Pika 1L teapot
tea_h   = 3.5;
dish_d  = 8.5;                  // dish set, top bay, left compartment
dish_h  = 3;
bin     = [7, 14.5, 4];         // storage bins, top bay, one per compartment, rightmost first
bin_qty = 1;

// ---------- Derived ----------
bays    = [bay_stove, bay_gas, bay_top];
n_bays  = len(bays);
// Z of the rail/crossbar level under bay i (level 0 = base, level n_bays = top rails)
function level_z(i) = i == 0 ? 0 : level_z(i - 1) + ext + shelf_t + bays[i - 1];
function bay_floor(i) = level_z(i) + ext + shelf_t;
H       = level_z(n_bays) + ext;
function on_grid(x) = abs(x/len_step - round(x/len_step)) < 1e-6;
function gcd(a, b) = b == 0 ? a : gcd(b, a % b);
// Inches as a fraction to the nearest 1/16, e.g. 24.75 -> 24 3/4"
function frac(x) =
    let (w = floor(x + 1e-6), n = round((x - w)*16), g = gcd(n, 16))
    n == 0 ? str(w, "\"") : w == 0 ? str(n/g, "/", 16/g, "\"") : str(w, " ", n/g, "/", 16/g, "\"");
inner_w = W - 2*ext;
inner_d = D - 2*ext;
crossbar_ys = [ext, D/2 - ext/2, D - 2*ext];

assert(inner_w >= stove[0] + 2*clearance, "Too narrow for stove");
assert(inner_d >= stove[1] + 2*clearance, "Too shallow for stove");
assert(bay_stove >= stove[2] + 2*clearance, "Stove bay too short");
assert(bay_gas >= cyl_h + 2*clearance, "Gas bay too short for cylinders");
assert(bay_gas >= cook_h + 2*clearance, "Gas bay too short for cook set");
assert(inner_d >= cook_d + 2*clearance, "Gas bay too shallow for cook set");
assert(bay_top >= bin[2] + 2*clearance, "Top bay too short for bins");
assert(inner_d >= bin[1] + 2*clearance, "Top bay too shallow for bins");
// Top bay: compartment 0 = dish set, rightmost bin_qty compartments = one bin each
function bin_comps() = [for (k = [n_dividers(dividers[2]) - bin_qty + 1 : n_dividers(dividers[2])]) k];
assert(bay_top >= dish_h + 2*clearance, "Top bay too short for dish set");
assert(comp_w(2, 0) >= dish_d + 2*clearance, "Dish set compartment too narrow");
assert(n_dividers(dividers[2]) >= bin_qty, "Top bay needs one compartment per bin");
for (k = bin_comps())
    assert(comp_w(2, k) >= bin[0] + 2*clearance, str("Bin compartment ", k, " too narrow"));
// Middle bay: compartment 0 = cook set, 1 = all propane cylinders in a front-to-back row, 2 = teapot
assert(n_dividers(dividers[1]) >= 2, "Gas bay needs 3 compartments");
assert(comp_w(1, 2) >= tea_d + 2*clearance, "Teapot compartment too narrow");
assert(comp_w(1, 0) >= cook_d + 2*clearance, "Cook set compartment too narrow");
assert(comp_w(1, 1) >= cyl_d + 2*clearance, "Propane compartment too narrow");
assert(inner_d >= cyl_qty*cyl_d + (cyl_qty + 1)*clearance, "Propane compartment too shallow");

// ---------- 10-series profile (simplified) ----------
// Supplier slot types: A = 1 slot, B = 2 adjacent, C = 2 opposite, D = 3, STD = 4.
// Each member opens only the faces it needs: a panel edge, shelf/cooktop bolts (+z),
// divider brackets (-z), hinge or latch. Joints are end-tapped, so they need no slot.

// local profile faces in rotate() order: +x, +y, -x, -y
module profile_1010(mask = [1, 1, 1, 1]) {
    open  = 0.256;   // slot opening
    lip   = 0.087;   // lip thickness
    cav_w = 0.45;    // slot cavity width
    cav_d = 0.18;    // slot cavity depth below lip
    difference() {
        square(ext, center=true);
        for (i = [0:3]) if (mask[i]) rotate(i*90) {
            translate([ext/2 - lip - 0.01, -open/2]) square([lip + 0.02, open]);
            translate([ext/2 - lip - cav_d, -cav_w/2]) square([cav_d, cav_w]);
        }
        circle(d=0.205, $fn=24);
    }
}

// World face each local profile face points to, per bar axis (see bar placement rotations)
face_map = [["+x", "+y", "-x", "-y"],    // z: posts
            ["-z", "+y", "+z", "-y"],    // x: rotate([0, 90, 0])
            ["+x", "-z", "-x", "+z"]];   // y: rotate([-90, 0, 0])
function axis_idx(a) = a == "z" ? 0 : a == "x" ? 1 : 2;
function has(v, x) = len([for (e = v) if (e == x) 1]) > 0;
function slot_mask(axis, slots) = [for (f = face_map[axis_idx(axis)]) has(slots, f) ? 1 : 0];
function slot_type(m) =
    let (n = m[0] + m[1] + m[2] + m[3])
    n == 1 ? "A" : n == 3 ? "D" : n == 4 ? "STD" :
    n == 2 ? ((m[0] && m[2]) || (m[1] && m[3]) ? "C" : "B") : "none";

module ext_bar(len, mask) color("Silver") linear_extrude(len) profile_1010(mask);

// Each bar is placed by the min corner of its 1x1 cross-section.
module bar(axis, x, y, z, len, slots) {
    m = slot_mask(axis, slots);
    if (axis == "x")      translate([x, y + ext/2, z + ext/2]) rotate([0, 90, 0]) ext_bar(len, m);
    else if (axis == "y") translate([x + ext/2, y, z + ext/2]) rotate([-90, 0, 0]) ext_bar(len, m);
    else                  translate([x + ext/2, y + ext/2, z]) ext_bar(len, m);
}

// ---------- Frame members: [name, axis, x, y, z, length, open faces] ----------
function divided_below(i) = i > 0 && n_dividers(dividers[i - 1]) > 0;

members = concat(
    // Corner posts: side panel edges (+/-y), back panel edge (+/-x),
    // pivot hinges on the front-left front face, latch keeper on the front-right outer face
    [["post front-left",  "z", 0,     0,     0, H, ["+y", "-y"]],
     ["post front-right", "z", W-ext, 0,     0, H, ["+y", "+x"]],
     ["post back-left",   "z", 0,     D-ext, 0, H, ["-y", "+x"]],
     ["post back-right",  "z", W-ext, D-ext, 0, H, ["-y", "-x"]]],
    // Bottom perimeter: panel bottom edges (+z); front rail has no panel, A is the minimum
    [["bottom front rail", "x", ext, 0,     0, inner_w, ["+z"]],
     ["bottom back rail",  "x", ext, D-ext, 0, inner_w, ["+z"]]],
    [for (x = [0, W-ext]) ["bottom side rail", "y", x, ext, 0, inner_d, ["+z"]]],
    // Top perimeter: cooktop bolts (+z), panel top edges (-z)
    [["top front rail", "x", ext, 0,     H-ext, inner_w, ["+z"]],
     ["top back rail",  "x", ext, D-ext, H-ext, inner_w, ["+z", "-z"]]],
    [for (x = [0, W-ext]) ["top side rail", "y", x, ext, H-ext, inner_d, ["+z", "-z"]]],
    // Shelf side rails: side panels above (+z) and below (-z)
    [for (i = [1 : n_bays - 1], x = [0, W-ext])
        ["shelf side rail", "y", x, ext, level_z(i), inner_d, ["+z", "-z"]]],
    // Crossbars: shelf/cooktop bolts (+z), divider brackets (-z) where the bay below is divided
    [for (i = [0 : n_bays], y = crossbar_ys)
        ["crossbar", "x", ext, y, level_z(i), inner_w, divided_below(i) ? ["+z", "-z"] : ["+z"]]]
);

// ---------- Frame ----------
module frame() for (m = members) bar(m[1], m[2], m[3], m[4], m[5], m[6]);

// ---------- Plywood ----------
module shelf(z) color("BurlyWood") translate([ext, ext, z + ext]) cube([inner_w, inner_d, shelf_t]);

// Full-footprint cooktop on the top rails + crossbars, countersunk bolts, flush surface
module cooktop() color("BurlyWood") translate([0, 0, H]) cube([W, D, top_t]);

function side_h(i) = level_z(i + 1) - level_z(i) - ext + 2*slot_engage;

module panels() {
    e = slot_engage;
    c = ext/2 - panel_t/2;   // panel sits on the slot centerline
    color("Wheat") {
        // Back (one piece; no back shelf rails)
        translate([ext - e, D - ext + c, ext - e]) cube([inner_w + 2*e, panel_t, H - 2*ext + 2*e]);
        // Sides, one panel per bay between shelf rails
        for (x = [c, W - ext + c], i = [0 : n_bays - 1])
            translate([x, ext - e, level_z(i) + ext - e]) cube([panel_t, inner_d + 2*e, side_h(i)]);
    }
}

// Each divider stands on its shelf, fixed with small L-brackets to the shelf
// and screwed into the cooktop crossbars above.
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
    latch_z = H/2 - 0.4;
    rotate([0, 0, -door_angle]) {
        color("Tan") translate([door_gap, -door_t, door_gap])
            cube([W - 2*door_gap, door_t, H - 2*door_gap]);
        // Draw latch body on the door face
        color("DimGray") translate([W - 1.6, -door_t - 0.2, latch_z]) cube([1.4, 0.2, 0.8]);
    }
    // Pivot hinge pins, top and bottom
    color("DimGray") for (z = [0, H - 1]) translate([0, 0, z]) cylinder(d=0.3, h=1, $fn=24);
    // Latch keeper on the right post's side face
    color("DimGray") translate([W, 0.1, latch_z]) cube([0.15, 0.7, 0.8]);
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
    for (i = [0 : n_bays - 1]) shelf(level_z(i));
    cooktop();
    bay_dividers();
    if (show_panels) panels();
    if (show_door)   door();
    if (show_items)  items();
}

chuckbox();

// ---------- Cut list ----------
echo(str("Overall: ", frac(W), " x ", frac(D), " x ", frac(H + top_t), " (frame ", frac(H), " + cooktop ", frac(top_t), ")"));
echo(str("Bays (bottom->top): ", [for (b = bays) frac(b)]));
// Extrusion grouped by length and slot type
member_types = [for (m = members) [m[5], slot_type(slot_mask(m[1], m[6]))]];
for (m = members) assert(on_grid(m[5]), str(m[0], " length ", m[5], "\" is not on the 1/16\" grid"));
for (L = [H, inner_w, inner_d], T = ["A", "B", "C", "D", "STD"])
    let (n = len([for (t = member_types) if (t[0] == L && t[1] == T) 1]))
    if (n > 0) echo(str("1010-", T, ": ", n, " x ", frac(L)));
echo(str("1/2\" ply shelves: ", n_bays, " x ", frac(inner_w), " x ", frac(inner_d)));
echo(str("1/2\" ply cooktop: 1 x ", frac(W), " x ", frac(D)));
echo(str("1/4\" ply back: 1 x ", frac(inner_w + 2*slot_engage), " x ", frac(H - 2*ext + 2*slot_engage)));
echo(str("1/4\" ply sides (bottom->top, 2 each): ", frac(inner_d + 2*slot_engage), " x ",
         [for (i = [0 : n_bays - 1]) frac(side_h(i))]));
for (i = [0 : n_bays - 1]) if (n_dividers(dividers[i]) > 0)
    echo(str("1/4\" ply dividers, bay ", i, ": ", n_dividers(dividers[i]), " x ", frac(inner_d), " x ", frac(bays[i]),
             " -> compartment widths ", [for (w = comp_widths(dividers[i])) frac(w)]));
echo(str("Door: 1 x ", frac(W - 2*door_gap), " x ", frac(H - 2*door_gap), " x ", frac(door_t)));
