
// Parameters for components
module central_craft() {
    difference() {
        cylinder(h = 18, r = 10, $fn = 100); // Main cylinder (reduced height)
        translate([0, 0, -1]) cylinder(h = 20, r = 6, $fn = 100); // Central hole (widened)
    }
}

module input_craft() {
    difference() {
        cylinder(h = 13, r = 10, $fn = 100); // Main cylinder (shortened height)
        translate([0, 0, -1]) cylinder(h = 15, r = 6, $fn = 100); // Central hole (widened and aligned)
    }
}

module output_craft() {
    difference() {
        cylinder(h = 13, r = 10, $fn = 100); // Main cylinder (shortened height)
        translate([0, 0, -1]) cylinder(h = 15, r = 6, $fn = 100); // Central hole (widened)
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, r = 10, $fn = 100); // Outer ring (reduced thickness)
        translate([0, 0, -1]) cylinder(h = 3, r = 8, $fn = 100); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 2, r = 10, $fn = 100); // Outer plate (reduced thickness)
        translate([0, 0, -1]) cylinder(h = 4, r = 8, $fn = 100); // Inner hole
        for (angle = [0:60:300]) { // Increased number of bolt holes
            translate([8 * cos(angle), 8 * sin(angle), -1])
                cylinder(h = 4, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 2, r = 1.5, $fn = 6); // Hexagonal nut (reduced size)
}

module bolt() {
    union() {
        cylinder(h = 18, r = 0.8, $fn = 100); // Bolt shaft (reduced length and thickness)
        translate([0, 0, 18]) cylinder(h = 1.5, r = 1.2, $fn = 6); // Bolt head (reduced size)
    }
}

// Assembly
module flexible_coupling() {
    // Central craft
    central_craft();

    // Input and output crafts
    translate([0, 0, -18]) input_craft();
    translate([0, 0, 18]) output_craft();

    // Spacer rings
    translate([0, 0, -9]) spacer_ring();
    translate([0, 0, 9]) spacer_ring();

    // Flange plates
    translate([0, 0, -11]) flange_plate();
    translate([0, 0, -7]) flange_plate();
    translate([0, 0, 7]) flange_plate();
    translate([0, 0, 11]) flange_plate();

    // Bolts and nuts
    for (angle = [0:60:300]) {
        translate([8 * cos(angle), 8 * sin(angle), -18])
            bolt();
        translate([8 * cos(angle), 8 * sin(angle), -20])
            nut();
        translate([8 * cos(angle), 8 * sin(angle), 18])
            bolt();
        translate([8 * cos(angle), 8 * sin(angle), 20])
            nut();
    }
}

// Render the full assembly
flexible_coupling();

