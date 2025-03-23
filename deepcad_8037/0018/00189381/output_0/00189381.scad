
// Parameters for components
module central_craft() {
    difference() {
        cylinder(h = 30, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1])
            cylinder(h = 32, r = 5, $fn = 100); // Inner hollow
    }
}

module input_craft() {
    difference() {
        cylinder(h = 20, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1])
            cylinder(h = 22, r = 5, $fn = 100); // Inner hollow
    }
}

module output_craft() {
    difference() {
        cylinder(h = 20, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1])
            cylinder(h = 22, r = 5, $fn = 100); // Inner hollow
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 10, $fn = 100); // Outer ring
        translate([0, 0, -1])
            cylinder(h = 4, r = 8, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 5, r = 12, $fn = 100); // Outer plate
        translate([0, 0, -1])
            cylinder(h = 7, r = 8, $fn = 100); // Inner hollow
        for (angle = [0:60:300]) {
            translate([10 * cos(angle), 10 * sin(angle), 0])
                cylinder(h = 10, r = 1.5, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 5, r = 3, $fn = 6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h = 20, r = 1.5, $fn = 100); // Bolt shaft
        translate([0, 0, 20])
            cylinder(h = 2, r = 2.5, $fn = 6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Central craft
    central_craft();

    // Input craft
    translate([0, 0, -20])
        input_craft();

    // Output craft
    translate([0, 0, 30])
        output_craft();

    // Spacer rings
    translate([0, 0, -2])
        spacer_ring();
    translate([0, 0, 28])
        spacer_ring();

    // Flange plates
    translate([0, 0, -7])
        flange_plate();
    translate([0, 0, 25])
        flange_plate();
    translate([0, 0, -12])
        flange_plate();
    translate([0, 0, 30])
        flange_plate();

    // Bolts and nuts
    for (angle = [0:60:300]) {
        translate([10 * cos(angle), 10 * sin(angle), -12])
            bolt();
        translate([10 * cos(angle), 10 * sin(angle), 30])
            bolt();
        translate([10 * cos(angle), 10 * sin(angle), -17])
            nut();
        translate([10 * cos(angle), 10 * sin(angle), 32])
            nut();
    }
}

// Render the full assembly
flexible_coupling();

