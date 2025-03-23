
// Parameters for the components
module central_cylinder() {
    // Central cylinder with smooth surface
    cylinder(h=30, r=10, $fn=100);
}

module input_cylinder() {
    // Input cylinder with adjusted hollow center and smooth surface
    difference() {
        cylinder(h=20, r=10, $fn=100);
        translate([0, 0, -1]) cylinder(h=22, r=5, $fn=100); // Hollow center
    }
}

module output_cylinder() {
    // Output cylinder with adjusted hollow center and smooth surface
    difference() {
        cylinder(h=20, r=10, $fn=100);
        translate([0, 0, -1]) cylinder(h=22, r=5, $fn=100); // Hollow center
    }
}

module spacer_ring() {
    // Thin, flat, ring-shaped spacer
    difference() {
        cylinder(h=1, r=10, $fn=100);
        cylinder(h=1.5, r=8, $fn=100); // Inner hollow
    }
}

module flange_plate() {
    // Flat, hollow cylindrical plate with bolt holes
    difference() {
        cylinder(h=5, r=12, $fn=100);
        cylinder(h=5, r=8, $fn=100); // Inner hollow
        for (i = [0:45:315]) {
            translate([10*cos(i), 10*sin(i), 0]) cylinder(h=5, r=1, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    // Small, hexagonal nut
    cylinder(h=2, r=1.5, $fn=6);
}

module bolt() {
    // Slender cylindrical bolt
    cylinder(h=25, r=1, $fn=100);
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

