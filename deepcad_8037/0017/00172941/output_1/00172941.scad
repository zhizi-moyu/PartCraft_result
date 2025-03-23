
// Base Plate
module base_plate() {
    difference() {
        cube([50, 50, 5], center = true); // Main rectangular plate
        translate([0, 0, 2.5]) cylinder(r = 4, h = 5, center = true); // Reduced protrusion size
        translate([0, 0, -2.5]) cylinder(r = 2, h = 10, center = true); // Repositioned hole to align with the center
    }
}

// Side Plate
module side_plate() {
    difference() {
        cube([10, 50, 5], center = true); // Main rectangular plate
        translate([0, 0, -2.5]) cylinder(r = 2, h = 10, center = true); // Hole repositioned closer to the center
    }
}

// Connector Plate
module connector_plate() {
    difference() {
        cube([50, 10, 1.5], center = true); // Reduced thickness of the rectangular plate
        translate([0, 0, -0.75]) cylinder(r = 1.5, h = 3, center = true); // Adjusted hole size
    }
}

// Support Bracket
module support_bracket() {
    difference() {
        cube([20, 10, 5], center = true); // Main bracket
        translate([0, 0, 2.5]) rotate([90, 0, 0]) cylinder(r = 4, h = 10, center = true); // Reduced curve on the edge
        translate([0, 0, -2.5]) cube([12, 5, 5], center = true); // Enlarged rectangular cutout
    }
}

// Fastener Bolt
module fastener_bolt() {
    union() {
        cylinder(r = 1.5, h = 18, center = false); // Reduced bolt shaft length
        translate([0, 0, 18]) cylinder(r = 2, h = 2, center = false); // Bolt head
    }
}

// Fastener Nut
module fastener_nut() {
    difference() {
        cylinder(r = 2.5, h = 2, center = false); // Reduced hexagonal nut size
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

