
// Parameters for components
module central_craft() {
    difference() {
        cylinder(h = 20, r = 10, $fn = 100); // Main cylinder (adjusted height)
        translate([0, 0, 0]) cylinder(h = 20, r = 6, $fn = 100); // Central hole (aligned and smoothed)
    }
}

module input_craft() {
    difference() {
        cylinder(h = 10, r = 10, $fn = 100); // Main cylinder (reduced height)
        translate([0, 0, 0]) cylinder(h = 10, r = 6, $fn = 100); // Central hole (aligned)
    }
}

module output_craft() {
    difference() {
        cylinder(h = 10, r = 10, $fn = 100); // Main cylinder (reduced height)
        translate([0, 0, 0]) cylinder(h = 10, r = 6, $fn = 100); // Central hole (aligned)
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 0.5, r = 10, $fn = 100); // Outer ring (reduced thickness)
        translate([0, 0, 0]) cylinder(h = 0.5, r = 8, $fn = 100); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 1, r = 10, $fn = 100); // Outer plate (reduced thickness)
        translate([0, 0, 0]) cylinder(h = 1, r = 8, $fn = 100); // Inner hole
        for (angle = [0:45:315]) { // Adjusted number of bolt holes
            translate([8 * cos(angle), 8 * sin(angle), 0])
                cylinder(h = 1, r = 0.8, $fn = 100); // Bolt holes (adjusted size)
        }
    }
}

module nut() {
    cylinder(h = 1.5, r = 1.2, $fn = 6); // Hexagonal nut (adjusted size)
}

module bolt() {
    union() {
        cylinder(h = 15, r = 0.6, $fn = 100); // Bolt shaft (adjusted length and thickness)
        translate([0, 0, 15]) cylinder(h = 1, r = 1, $fn = 6); // Bolt head (adjusted size)
    }
}

// Assembly
module flexible_coupling() {
    // Central craft
    central_craft();

    // Input and output crafts
    translate([0, 0, -20]) input_craft();
    translate([0, 0, 20]) output_craft();

    // Spacer rings
    translate([0, 0, -10]) spacer_ring();
    translate([0, 0, 10]) spacer_ring();

    // Flange plates
    translate([0, 0, -11]) flange_plate();
    translate([0, 0, -9]) flange_plate();
    translate([0, 0, 9]) flange_plate();
    translate([0, 0, 11]) flange_plate();

    // Bolts and nuts
    for (angle = [0:45:315]) {
        translate([8 * cos(angle), 8 * sin(angle), -20])
            bolt();
        translate([8 * cos(angle), 8 * sin(angle), -21.5])
            nut();
        translate([8 * cos(angle), 8 * sin(angle), 20])
            bolt();
        translate([8 * cos(angle), 8 * sin(angle), 21.5])
            nut();
    }
}

// Render the full assembly
flexible_coupling();

