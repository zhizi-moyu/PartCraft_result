
// Parameters for components
module central_craft() {
    difference() {
        cylinder(h = 20, r = 10, $fn = 100); // Main cylinder
        translate([0, 0, -1]) cylinder(h = 22, r = 5, $fn = 100); // Central hole
    }
}

module input_craft() {
    difference() {
        cylinder(h = 15, r = 10, $fn = 100); // Main cylinder
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Central hole
    }
}

module output_craft() {
    difference() {
        cylinder(h = 15, r = 10, $fn = 100); // Main cylinder
        translate([0, 0, -1]) cylinder(h = 17, r = 5, $fn = 100); // Central hole
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 10, $fn = 100); // Outer ring
        translate([0, 0, -1]) cylinder(h = 4, r = 8, $fn = 100); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 10, $fn = 100); // Outer plate
        translate([0, 0, -1]) cylinder(h = 5, r = 8, $fn = 100); // Inner hole
        for (angle = [0:90:270]) {
            translate([8 * cos(angle), 8 * sin(angle), -1])
                cylinder(h = 5, r = 1, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 3, r = 2, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 20, r = 1, $fn = 100); // Bolt shaft
        translate([0, 0, 20]) cylinder(h = 2, r = 1.5, $fn = 6); // Bolt head
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
    translate([0, 0, -12]) flange_plate();
    translate([0, 0, -8]) flange_plate();
    translate([0, 0, 8]) flange_plate();
    translate([0, 0, 12]) flange_plate();

    // Bolts and nuts
    for (angle = [0:90:270]) {
        translate([8 * cos(angle), 8 * sin(angle), -20])
            bolt();
        translate([8 * cos(angle), 8 * sin(angle), -23])
            nut();
        translate([8 * cos(angle), 8 * sin(angle), 20])
            bolt();
        translate([8 * cos(angle), 8 * sin(angle), 23])
            nut();
    }
}

// Render the full assembly
flexible_coupling();

