
// Parameters for components
module flange_plate() {
    difference() {
        cylinder(h=5, r=30); // Outer cylinder
        cylinder(h=6, r=20); // Inner hole
        for (i = [0:45:315]) { // Bolt holes
            translate([25*cos(i), 25*sin(i), 0])
                cylinder(h=6, r=2);
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=30); // Outer cylinder
        cylinder(h=3, r=20); // Inner hole
    }
}

module central_craft() {
    difference() {
        cylinder(h=20, r=25); // Outer cylinder
        cylinder(h=21, r=10); // Inner hole
    }
}

module bolt() {
    cylinder(h=30, r=2); // Bolt body
}

module nut() {
    difference() {
        cylinder(h=5, r=4); // Outer hexagonal cylinder
        cylinder(h=6, r=2); // Inner threading
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Top flange plate
    translate([0, 0, 0])
        flange_plate();

    // Layer 2: Spacer ring
    translate([0, 0, 5])
        spacer_ring();

    // Layer 3: Second flange plate
    translate([0, 0, 7])
        flange_plate();

    // Layer 4: Central craft
    translate([0, 0, 12])
        central_craft();

    // Layer 5: Third flange plate
    translate([0, 0, 32])
        flange_plate();

    // Layer 6: Second spacer ring
    translate([0, 0, 37])
        spacer_ring();

    // Layer 7: Bottom flange plate
    translate([0, 0, 39])
        flange_plate();

    // Bolts and nuts
    for (i = [0:45:315]) {
        translate([25*cos(i), 25*sin(i), 0])
            bolt();
        translate([25*cos(i), 25*sin(i), 30])
            nut();
    }
}

// Render the flexible coupling
flexible_coupling();

