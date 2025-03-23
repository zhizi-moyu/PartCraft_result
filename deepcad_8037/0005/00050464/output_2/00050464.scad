
// Parameters for components
module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 20); // Outer cylinder (reduced thickness to match original)
        cylinder(h = 3, r = 10); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 6, r = 25); // Outer cylinder (reduced height and diameter to match original)
        cylinder(h = 7, r = 15); // Inner hole
        for (i = [0:30:360]) { // Increased number of bolt holes to match original
            rotate([0, 0, i]) translate([20, 0, 0]) cylinder(h = 8, r = 1.5); // Bolt holes (adjusted position closer to center and smaller radius)
        }
    }
}

module nut() {
    difference() {
        cylinder(h = 2, r = 2.5); // Reduced size for nut to match original
        rotate([0, 0, 0]) translate([0, 0, 1]) cylinder(h = 2, r = 2.2, $fn = 6); // Less pronounced hexagonal shape
    }
}

module bolt() {
    union() {
        cylinder(h = 20, r = 1.5); // Bolt shaft (shortened length and reduced diameter to match original)
        translate([0, 0, 20]) cylinder(h = 3, r = 2.5); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Spacer Ring
    translate([0, 0, 0]) spacer_ring();

    // Layer 2: Spacer Ring
    translate([0, 0, 4]) spacer_ring();

    // Flange Plates
    translate([0, 0, -2]) flange_plate();
    translate([0, 0, 6]) flange_plate();

    // Bolts and Nuts
    for (i = [0:30:360]) {
        rotate([0, 0, i]) translate([20, 0, -2]) bolt();
        rotate([0, 0, i]) translate([20, 0, 23]) nut();
    }
}

// Render the flexible coupling
flexible_coupling();

