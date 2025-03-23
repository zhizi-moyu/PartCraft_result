
// Parameters
module central_hub() {
    // Adjusted to remove protrusions and ensure a smooth cylindrical surface
    difference() {
        cylinder(h=20, r=15, $fn=100); // Outer cylinder
        translate([0, 0, -1])
            cylinder(h=22, r=5, $fn=100);  // Central bore
    }
}

module spacer_ring() {
    // Adjusted to flatten and reduce thickness
    difference() {
        cylinder(h=0.5, r=15, $fn=100); // Outer ring (reduced thickness)
        cylinder(h=0.5, r=10, $fn=100); // Inner cutout
    }
}

module flange_plate() {
    // Adjusted to simplify design and ensure evenly distributed bolt holes
    difference() {
        cylinder(h=3, r=15, $fn=100); // Outer cylinder
        cylinder(h=3, r=10, $fn=100); // Inner cutout
        for (i = [0:90:270]) {
            translate([12*cos(i), 12*sin(i), 0])
                cylinder(h=3, r=1.5, $fn=100); // Bolt holes (adjusted size)
        }
    }
}

module bolt() {
    // Adjusted to match original slender cylindrical shape with threading
    union() {
        cylinder(h=18, r=1.5, $fn=100); // Bolt body (adjusted length and radius)
        translate([0, 0, 18])
            cylinder(h=2, r=1.8, $fn=100); // Threading at one end
    }
}

module nut() {
    // Adjusted to match original hexagonal design with internal threading
    difference() {
        cylinder(h=3, r=3.5, $fn=6); // Hexagonal nut (adjusted size)
        cylinder(h=3, r=1.5, $fn=100); // Inner threading
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Top flange plate with nuts
    translate([0, 0, 0])
        flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 3])
            nut();
    }

    // Layer 2: Spacer ring with bolts
    translate([0, 0, 3])
        spacer_ring();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 3.5])
            bolt();
    }

    // Layer 3: Second flange plate with nuts
    translate([0, 0, 19])
        flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 22])
            nut();
    }

    // Layer 4: Central hub
    translate([0, 0, 22])
        central_hub();

    // Layer 5: Third flange plate with nuts
    translate([0, 0, 42])
        flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 45])
            nut();
    }

    // Layer 6: Second spacer ring with bolts
    translate([0, 0, 45])
        spacer_ring();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 45.5])
            bolt();
    }

    // Layer 7: Bottom flange plate with nuts
    translate([0, 0, 61])
        flange_plate();
    for (i = [0:90:270]) {
        translate([12*cos(i), 12*sin(i), 64])
            nut();
    }
}

// Render the flexible coupling
flexible_coupling();

