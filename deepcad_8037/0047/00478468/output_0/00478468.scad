
// Parameters
module central_hub() {
    difference() {
        cylinder(h=20, r=15, $fn=100); // Outer cylinder
        cylinder(h=20, r=5, $fn=100);  // Central bore
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=15, $fn=100); // Outer ring
        cylinder(h=2, r=10, $fn=100); // Inner cutout
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=15, $fn=100); // Outer cylinder
        cylinder(h=5, r=10, $fn=100); // Inner cutout
        for (i = [0:90:270]) {
            translate([12*cos(i), 12*sin(i), 0])
                cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module bolt() {
    cylinder(h=25, r=2, $fn=100); // Bolt body
}

module nut() {
    difference() {
        cylinder(h=5, r=4, $fn=6); // Hexagonal nut
        cylinder(h=5, r=2, $fn=100); // Inner threading
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Top flange plate with nuts
    translate([0, 0, 0])
        flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 5])
            nut();
    }

    // Layer 2: Spacer ring with bolts
    translate([0, 0, 5])
        spacer_ring();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 7])
            bolt();
    }

    // Layer 3: Second flange plate with nuts
    translate([0, 0, 27])
        flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 32])
            nut();
    }

    // Layer 4: Central hub
    translate([0, 0, 37])
        central_hub();

    // Layer 5: Third flange plate with nuts
    translate([0, 0, 57])
        flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 62])
            nut();
    }

    // Layer 6: Second spacer ring with bolts
    translate([0, 0, 62])
        spacer_ring();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 64])
            bolt();
    }

    // Layer 7: Bottom flange plate with nuts
    translate([0, 0, 86])
        flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 91])
            nut();
    }
}

// Render the flexible coupling
flexible_coupling();

