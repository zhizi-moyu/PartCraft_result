
// Parameters for components
module central_craft() {
    cylinder(h = 30, r = 10, $fn = 100); // Outer cylinder
}

module input_craft() {
    difference() {
        cylinder(h = 18, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1])
            cylinder(h = 19, r = 5, $fn = 100); // Inner hollow
    }
}

module output_craft() {
    difference() {
        cylinder(h = 18, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1])
            cylinder(h = 19, r = 5, $fn = 100); // Inner hollow
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 1, r = 10, $fn = 100); // Outer ring
        translate([0, 0, -1])
            cylinder(h = 2, r = 8, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 3, r = 12, $fn = 100); // Outer plate
        translate([0, 0, -1])
            cylinder(h = 4, r = 8, $fn = 100); // Inner hollow
        for (angle = [0:45:315]) { // Increase bolt holes
            translate([10 * cos(angle), 10 * sin(angle), 0])
                cylinder(h = 10, r = 1.5, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 5, r = 3, $fn = 6); // Hexagonal nut with sharp edges
}

module bolt() {
    union() {
        cylinder(h = 25, r = 1.2, $fn = 100); // Bolt shaft with slender profile
        translate([0, 0, 25])
            cylinder(h = 2, r = 2, $fn = 6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Central craft
    central_craft();

    // Input craft
    translate([0, 0, -18])
        input_craft();

    // Output craft
    translate([0, 0, 30])
        output_craft();

    // Spacer rings
    translate([0, 0, -1])
        spacer_ring();
    translate([0, 0, 29])
        spacer_ring();

    // Flange plates
    translate([0, 0, -4])
        flange_plate();
    translate([0, 0, 27])
        flange_plate();
    translate([0, 0, -7])
        flange_plate();
    translate([0, 0, 30])
        flange_plate();

    // Bolts and nuts
    for (angle = [0:45:315]) {
        translate([10 * cos(angle), 10 * sin(angle), -7])
            bolt();
        translate([10 * cos(angle), 10 * sin(angle), 30])
            bolt();
        translate([10 * cos(angle), 10 * sin(angle), -12])
            nut();
        translate([10 * cos(angle), 10 * sin(angle), 32])
            nut();
    }
}

// Render the full assembly
flexible_coupling();

