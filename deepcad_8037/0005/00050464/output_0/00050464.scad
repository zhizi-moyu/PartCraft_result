
// Parameters for components
module spacer_ring() {
    difference() {
        cylinder(h = 5, r = 20); // Outer cylinder
        cylinder(h = 6, r = 10); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 10, r = 30); // Outer cylinder
        cylinder(h = 11, r = 20); // Inner hole
        for (i = [0:45:360]) {
            rotate([0, 0, i]) translate([25, 0, 0]) cylinder(h = 12, r = 2); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h = 5, r = 4); // Hexagonal nut approximation
}

module bolt() {
    union() {
        cylinder(h = 30, r = 2); // Bolt shaft
        translate([0, 0, 30]) cylinder(h = 5, r = 3); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Spacer Ring
    translate([0, 0, 0]) spacer_ring();

    // Layer 2: Spacer Ring
    translate([0, 0, 10]) spacer_ring();

    // Flange Plates
    translate([0, 0, -5]) flange_plate();
    translate([0, 0, 15]) flange_plate();

    // Bolts and Nuts
    for (i = [0:45:360]) {
        rotate([0, 0, i]) translate([25, 0, -5]) bolt();
        rotate([0, 0, i]) translate([25, 0, 35]) nut();
    }
}

// Render the flexible coupling
flexible_coupling();

