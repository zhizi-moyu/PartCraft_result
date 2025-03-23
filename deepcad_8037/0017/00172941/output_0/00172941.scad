
// Base Plate
module base_plate() {
    difference() {
        cube([50, 50, 5], center = true); // Main rectangular plate
        translate([0, 0, 2.5]) cylinder(r = 5, h = 5, center = true); // Protrusion
        translate([0, 0, -2.5]) cylinder(r = 2, h = 10, center = true); // Hole in the center
    }
}

// Side Plate
module side_plate() {
    difference() {
        cube([10, 50, 5], center = true); // Main rectangular plate
        translate([0, 0, -2.5]) cylinder(r = 2, h = 10, center = true); // Hole near the center
    }
}

// Connector Plate
module connector_plate() {
    difference() {
        cube([50, 10, 2], center = true); // Thin rectangular plate
        translate([0, 0, -1]) cylinder(r = 2, h = 4, center = true); // Hole in the center
    }
}

// Support Bracket
module support_bracket() {
    difference() {
        cube([20, 10, 5], center = true); // Main bracket
        translate([0, 0, 2.5]) rotate([90, 0, 0]) cylinder(r = 5, h = 10, center = true); // Curved edge
        translate([0, 0, -2.5]) cube([10, 5, 5], center = true); // Rectangular cutout
    }
}

// Fastener Bolt
module fastener_bolt() {
    union() {
        cylinder(r = 1.5, h = 20, center = false); // Bolt shaft
        translate([0, 0, 20]) cylinder(r = 2, h = 2, center = false); // Bolt head
    }
}

// Fastener Nut
module fastener_nut() {
    difference() {
        cylinder(r = 3, h = 2, center = false); // Hexagonal nut
        translate([0, 0, 1]) cylinder(r = 1.5, h = 4, center = true); // Threading inside
    }
}

// Assembly
module assembly() {
    // Layer 1: Connector Plate
    translate([0, 0, 50]) connector_plate();

    // Layer 2: Side Plates
    translate([-25, 0, 25]) side_plate();
    translate([25, 0, 25]) side_plate();

    // Layer 3: Support Bracket
    translate([0, 0, 0]) support_bracket();

    // Layer 4: Base Plate
    translate([0, 0, -25]) base_plate();

    // Fasteners
    translate([-25, 0, 25]) fastener_bolt();
    translate([25, 0, 25]) fastener_bolt();
    translate([0, 0, 0]) fastener_bolt();
    translate([0, 0, -25]) fastener_bolt();

    translate([-25, 0, 25]) fastener_nut();
    translate([25, 0, 25]) fastener_nut();
    translate([0, 0, 0]) fastener_nut();
    translate([0, 0, -25]) fastener_nut();
}

// Render the assembly
assembly();

