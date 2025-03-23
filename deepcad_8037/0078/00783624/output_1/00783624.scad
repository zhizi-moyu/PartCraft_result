
// Parameters for the components
module central_cylinder() {
    cylinder(h=30, r=10, $fn=100); // Central cylinder dimensions (smooth surface)
}

module input_cylinder() {
    cylinder(h=20, r=10, $fn=100); // Simplified input cylinder (smooth surface)
}

module output_cylinder() {
    cylinder(h=20, r=10, $fn=100); // Simplified output cylinder (smooth surface)
}

module spacer_ring() {
    difference() {
        cylinder(h=1, r=10, $fn=100); // Thinner outer ring
        cylinder(h=1.5, r=8, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=12, $fn=100); // Simplified flat plate
        cylinder(h=5, r=8, $fn=100); // Inner hollow
        for (i = [0:45:315]) {
            translate([10*cos(i), 10*sin(i), 0]) cylinder(h=5, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=2, r=1.5, $fn=6); // Smaller, simpler hexagonal nut
}

module bolt() {
    cylinder(h=25, r=1, $fn=100); // Simplified slender cylindrical bolt
}

// Assembly
module flexible_coupling() {
    // Central cylinder
    central_cylinder();

    // Input cylinder
    translate([0, 0, -25]) input_cylinder();

    // Output cylinder
    translate([0, 0, 25]) output_cylinder();

    // Spacer rings
    translate([0, 0, -15]) spacer_ring();
    translate([0, 0, 15]) spacer_ring();

    // Flange plates
    translate([0, 0, -20]) flange_plate();
    translate([0, 0, -10]) flange_plate();
    translate([0, 0, 10]) flange_plate();
    translate([0, 0, 20]) flange_plate();

    // Bolts and nuts
    for (i = [0:45:315]) {
        // Bolts
        translate([10*cos(i), 10*sin(i), -20]) bolt();
        translate([10*cos(i), 10*sin(i), 10]) bolt();

        // Nuts
        translate([10*cos(i), 10*sin(i), -22]) nut();
        translate([10*cos(i), 10*sin(i), 32]) nut();
    }
}

// Render the flexible coupling
flexible_coupling();

