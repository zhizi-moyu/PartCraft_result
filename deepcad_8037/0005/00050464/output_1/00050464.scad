
// Parameters for components
module spacer_ring() {
    difference() {
        cylinder(h = 3, r = 20); // Outer cylinder (reduced thickness)
        cylinder(h = 4, r = 10); // Inner hole
    }
}

module flange_plate() {
    difference() {
        cylinder(h = 8, r = 30); // Outer cylinder (reduced height)
        cylinder(h = 9, r = 20); // Inner hole
        for (i = [0:45:360]) {
            rotate([0, 0, i]) translate([23, 0, 0]) cylinder(h = 10, r = 2); // Bolt holes (adjusted position closer to center)
        }
    }
}

module nut() {
    cylinder(h = 4, r = 3.5); // Reduced size for nut
}

module bolt() {
    union() {
        cylinder(h = 25, r = 2); // Bolt shaft (shortened length)
        translate([0, 0, 25]) cylinder(h = 4, r = 3); // Bolt head
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Spacer Ring
    translate([0, 0, 0]) spacer_ring();

    // Layer 2: Spacer Ring
    translate([0, 0, 6]) spacer_ring();

    // Flange Plates
    translate([0, 0, -3]) flange_plate();
    translate([0, 0, 9]) flange_plate();

    // Bolts and Nuts
    for (i = [0:45:360]) {
        rotate([0, 0, i]) translate([23, 0, -3]) bolt();
        rotate([0, 0, i]) translate([23, 0, 29]) nut();
    }
}

// Render the flexible coupling
flexible_coupling();

