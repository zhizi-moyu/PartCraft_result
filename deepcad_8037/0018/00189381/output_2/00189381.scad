
// Parameters for components
module central_craft() {
    // Simplified to match the original model
    cylinder(h = 30, r = 10, $fn = 100); // Smooth cylindrical surface
}

module input_craft() {
    // Shortened and simplified to match the original model
    difference() {
        cylinder(h = 15, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1])
            cylinder(h = 16, r = 5, $fn = 100); // Inner hollow
    }
}

module output_craft() {
    // Simplified to match the original model
    difference() {
        cylinder(h = 15, r = 10, $fn = 100); // Outer cylinder
        translate([0, 0, -1])
            cylinder(h = 16, r = 5, $fn = 100); // Inner hollow
    }
}

module spacer_ring() {
    // Flattened to match the original model
    difference() {
        cylinder(h = 0.5, r = 10, $fn = 100); // Outer ring
        translate([0, 0, -0.5])
            cylinder(h = 1, r = 8, $fn = 100); // Inner hollow
    }
}

module flange_plate() {
    // Adjusted bolt holes to match the original model
    difference() {
        cylinder(h = 3, r = 12, $fn = 100); // Outer plate
        translate([0, 0, -1])
            cylinder(h = 4, r = 8, $fn = 100); // Inner hollow
        for (angle = [0:30:330]) { // Increased bolt holes and evenly distributed
            translate([10 * cos(angle), 10 * sin(angle), 0])
                cylinder(h = 10, r = 1.5, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    // Resized to match the smaller hexagonal profile of the original model
    cylinder(h = 5, r = 2.5, $fn = 6); // Hexagonal nut
}

module bolt() {
    // Elongated to match the original model
    union() {
        cylinder(h = 30, r = 1.2, $fn = 100); // Bolt shaft
        translate([0, 0, 30])
            cylinder(h = 2, r = 2, $fn = 6); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Central craft
    central_craft();

    // Input craft
    translate([0, 0, -15])
        input_craft();

    // Output craft
    translate([0, 0, 30])
        output_craft();

    // Spacer rings
    translate([0, 0, -0.5])
        spacer_ring();
    translate([0, 0, 29.5])
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
    for (angle = [0:30:330]) {
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

