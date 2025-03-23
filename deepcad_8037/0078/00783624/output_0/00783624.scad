
// Parameters for the components
module central_cylinder() {
    cylinder(h=30, r=10, $fn=100); // Central cylinder dimensions
}

module input_cylinder() {
    difference() {
        cylinder(h=20, r=10, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=22, r=5, $fn=100); // Hollow center
    }
}

module output_cylinder() {
    difference() {
        cylinder(h=20, r=10, $fn=100); // Outer cylinder
        translate([0, 0, -1]) cylinder(h=22, r=5, $fn=100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=10, $fn=100); // Outer ring
        cylinder(h=3, r=8, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=12, $fn=100); // Outer plate
        cylinder(h=6, r=8, $fn=100); // Inner hollow
        for (i = [0:45:315]) {
            translate([10*cos(i), 10*sin(i), -1]) cylinder(h=7, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=3, r=2, $fn=6); // Hexagonal nut
}

module bolt() {
    cylinder(h=25, r=1, $fn=100); // Bolt
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
        translate([10*cos(i), 10*sin(i), -23]) nut();
        translate([10*cos(i), 10*sin(i), 33]) nut();
    }
}

// Render the flexible coupling
flexible_coupling();

